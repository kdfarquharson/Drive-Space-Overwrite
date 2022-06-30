# Drive-Space-Overwrite<br>
Overwrite free space on a drive<br>
Fill an empty hard drive with junk content/overwrite all free space on a drive<br>
Multiple junk content text files are written into a series of HEX labelled directories<br>
This won't erase existing content, but it ought to overwrite 'deleted' data / space to make recovery more difficult<br>
Text is (c) Iain M. Banks - The Algebraist*<br>
Probably not the fastest, or most secure, way of erasing empty space but it'll do for simplicity<br>
Obviously this comes with no warranty or support or guarantees and if you are relying on a random script that someone wrote for fun that you found on the internet to securely overwrite empty drive space on your drives you may want to rethink your security strategy.
<br>
Use:<br>
Change the drive path variable ($outputDrive = "E:") to the drive you want to fill.<br>
Change the repeat variable ($rptCount = 16) to vary the file size - 16 gives a file ~100MB in size. This value will exponentially increase file size.<br>
&nbsp;Smaller files will pack more completely into the drive, that said the script seems to keep writing a file until space is zero so a partial file write will fill the drive<br>
Change the number of files per directory by changeing the variable ($filePerDir = 1048576)<br>
<br><br>
*the text here used here is from the book The Algebraist by Iain M. Banks.<br>
In the book the text is found writen repeatedly over the entire storage of a deceased AI to erase it's own memory to prevent it's knowledge falling into the wrong hands.<br>
