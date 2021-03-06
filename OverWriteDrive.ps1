# Fill an empty hard drive with content/overwrite all free space on a drive
# This won't erase existing content
# Text Iain M. Banks(c) - The Algebraist
# Probably not the fastest, or most secure, but it'll do for simplicity
# Use at your own risk

$outputString = "I was born in a water moon. Some people, especially its inhabitants, called it a planet, but as it was only a little over two hundred kilometres in diameter, 'moon' seems the more accurate term. The moon was made entirely of water, by which I mean it was a globe that not only had no land, but no rock either, a sphere with no solid core at all, just liquid water, all the way down to the very centre of the globe.
If it had been much bigger the moon would have had a core of ice, for water, though supposedly incompressible, is not entirely so, and will change under extremes of pressure to become ice. (If you are used to living on a planet where ice floats on the surface of water, this seems odd and even wrong, but nevertheless it is the case.) The moon was not quite of a size for an ice core to form, and therefore one could, if one was sufficiently hardy, and adequately proof against the water pressure, make one's way down, through the increasing weight of water above, to the very centre of the moon.
Where a strange thing happened.
For here, at the very centre of this watery globe, there seemed to be no gravity. There was colossal pressure, certainly, pressing in from every side, but one was in effect weightless (on the outside of a planet, moon or other body, watery or not, one is always being pulled towards its centre; once at its centre one is being pulled equally in all directions), and indeed the pressure around one was, for the same reason, not quite as great as one might have expected it to be, given the mass of water that the moon was made up from.
This was, of course,"

$outputDrive = "E:"

$rpt = 1
$rptCount = 16
$filePerDir = 1048576

do{
    $outputString = $outputString + $outputString
    $rpt = $rpt + 1
}
while ($rpt -lt $rptCount)


$iFile = 0 
$iFolder = 0
$hexFolder = $iFolder.ToString("X")
New-Item -ItemType Directory -Force -Path "$($outputDrive)$($hexFolder)"

do {
    $hexFile = $iFile.ToString("X")
    try{
        $outputString | Out-File -FilePath "$($outputDrive)$($hexFolder)\$($hexFile).txt" -Force
    }
    catch{
        Write-Host "Message: $($_.Exception)"
        Write-Host "Check the drive $($outputDrive) is full"
        break
    }
    $iFile = $iFile + 1
    
    if ($iFile -gt $filePerDir){
        $iFile = 0
        $iFolder = $iFolder + 1
        $hexFolder = $iFolder.ToString("X")
        New-Item -ItemType Directory -Force -Path "$($outputDrive)$($hexFolder)"
    }
}
while (1 -eq 1)
