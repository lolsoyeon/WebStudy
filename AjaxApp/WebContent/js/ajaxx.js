/**
 *	ajaxx.js 
 */

// XMLHttpRequest 객체를 담아둘 변수 
var ajaxx = null;


// AJAX 객체 생성 함수
function createAjax()
{
	if (window.ActiveXObject)
	{		
		return new ActiveXObjext("Msxml2.XMLHTTP");
	}
	else if (window.XMLHttpRequest)
	{
		return new XMLHttpRequest();
	}
	else
	{
		return null;
	}
	
	
}




