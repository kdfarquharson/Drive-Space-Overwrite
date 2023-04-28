# Fill an empty hard drive with content/overwrite all free space on a drive
# This won't erase existing content
# Text Iain M. Banks(c) - The Algebraist
# Probably not the fastest, or most secure, but it'll do for simplicity

$outputString = "I was born in a water moon. Some people, especially its inhabitants, called it a planet, but as it was only a little over two hundred kilometres in diameter, 'moon' seems the more accurate term. The moon was made entirely of water, by which I mean it was a globe that not only had no land, but no rock either, a sphere with no solid core at all, just liquid water, all the way down to the very centre of the globe.
If it had been much bigger the moon would have had a core of ice, for water, though supposedly incompressible, is not entirely so, and will change under extremes of pressure to become ice. (If you are used to living on a planet where ice floats on the surface of water, this seems odd and even wrong, but nevertheless it is the case.) The moon was not quite of a size for an ice core to form, and therefore one could, if one was sufficiently hardy, and adequately proof against the water pressure, make one's way down, through the increasing weight of water above, to the very centre of the moon.
Where a strange thing happened.
For here, at the very centre of this watery globe, there seemed to be no gravity. There was colossal pressure, certainly, pressing in from every side, but one was in effect weightless (on the outside of a planet, moon or other body, watery or not, one is always being pulled towards its centre; once at its centre one is being pulled equally in all directions), and indeed the pressure around one was, for the same reason, not quite as great as one might have expected it to be, given the mass of water that the moon was made up from.
This was, of course, "

#Drive to clean
$outputDrive = "R:"

#Build the output text
$rpt = 1
#12 ~ 6MB
#16 ~ 100MB
#3.5" 7200 SATA USB Large files result in 10% quicker write speed (13-14MB/s vs 11-12MB/s)
#Parallel runs on SSD may be worth while but the bottlenack for spinning disk is write not transfer speed
$rptCount = 16			#string size - exponential
#$filePerDir = 1048576	#maximum number of files to put in a directory
$filePerDir = 100000	#maximum number of files to put in a directory

do{
    $outputString = $outputString + $outputString
    $rpt = $rpt + 1
}
while ($rpt -lt $rptCount)

#How many drive writes are we doing?
$iWipes = 1

for($iWipeCount = 0; $iWipeCount -lt $iWipes; $iWipeCount++) {
	$exitLoop = $false
	$iFile = 0 
	$iFolder = 0
	$hexFolder = $iFolder.ToString("X")
	$guidFolder = [guid]::NewGuid()

	New-Item -ItemType Directory -Force -Path "$($outputDrive)$($guidFolder)\$($hexFolder)"

	do {
		$hexFile = $iFile.ToString("X")
		Write-Output "Wipe $($iWipeCount) Folder $($hexFolder) File $($hexFile)"
		try{
			$outputString | Out-File -FilePath "$($outputDrive)$($guidFolder)\$($hexFolder)\$($hexFile).txt" -Force
		}
		catch{
			Write-Output "Message: $($_.Exception)"
			Write-Output "Check the drive $($outputDrive) is full"
			$exitLoop = $true
		}
		$iFile = $iFile + 1
		
		if ($iFile -gt $filePerDir){
			$iFile = 0
			$iFolder = $iFolder + 1
			$hexFolder = $iFolder.ToString("X")
			New-Item -ItemType Directory -Force -Path "$($outputDrive)$($guidFolder)\$($hexFolder)"
		}
	}
	while ($exitLoop -eq $false)
	Remove-Item -Path "$($outputDrive)$($guidFolder)" -Force -Recurse

	#$iWipeCount
}
<#
workflow work {
	foreach -parallel ($iWipeCount in 0..$iWipes) {
}
work
#>
