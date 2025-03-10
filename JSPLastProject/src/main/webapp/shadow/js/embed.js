function writeFlash(width,height,url)
{
	document.write("<OBJECT classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0'  width = "+width+" height = "+height+">");
	document.write("<PARAM NAME=movie VALUE='"+url+"'>"); 
	document.write("<PARAM NAME=quality VALUE=high>");
	document.write("<PARAM NAME=bgcolor VALUE=#FFFFFF>");
	document.write("<PARAM NAME=wmode VALUE=transparent>");
	document.write("<EMBED src='"+url+"' quality=high bgcolor=#FFFFFF wmode=transparent width = "+width+" height = "+height+"  TYPE='application/x-shockwave-flash' PLUGINSPAGE='http://www.macromedia.com/go/getflashplayer'></EMBED>");
	document.write("</OBJECT>");
}