# Drive-Space-Overwrite<br>
Overwrite free space on a drive<br>
Fill an empty hard drive with content/overwrite all free space on a drive<br>
Multiple junk content text files are written into a series of HEX labelled directories<br>
This won't erase existing content, but it ought to overwrite existing 'deleted' data / space to make recovery more difficult<br>
Text is (c) Iain M. Banks - The Algebraist*<br>
Probably not the fastest, or most secure, way of erasing empty space but it'll do for simplicity<br>
<br>
Use:<br>
Change the drive path variable ($outputDrive = "E:") to the drive you want to fill.<br>
Change the repeat variable ($rptCount = 16) to vary the file size - 16 gives a file ~100MB in size.<br>
  Smaller files will pack more completely into the drive<br>
Change the number of files per directory by changeing the variable ($filePerDir = 1048576)<br>
<br><br>
*the text here used here is from the book The Algebraist by Iain M. Banks.<br>
In the book the text is found writen repeatedly over the entire storage of a deceased AI to erase it's own memory.<br>
