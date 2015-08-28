// JavaScript Document
function servImgOver(obj) 
{
		
		var img = "servImg";
		var path1 = "images/hpimg";
		var path2 = "-rover.jpg";
		document.getElementById(img + obj).setAttribute("src", path1 + obj + path2);		
}

function servImgOut(obj) 
{
		
		var img = "servImg";
		var path1 = "images/hpimg";
		var path2 = "-rout.jpg";
		document.getElementById(img + obj).setAttribute("src", path1 + obj + path2);		
}