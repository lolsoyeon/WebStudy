/**
 * ajax.js
 */

// XAMLHttpRequest 객체를 담아둘 변수 (→ ajax 객체)
// var xmlHttp = null;
var ajax = null;

// AJAX 객체(XMLHttpRequest) 생성 함수
function createAjax()
{
	/*
	if (window.ActiveXObject) // -- IE 7이전 버전
	{
		return new ActiveXObject("Msml2.XMLHTTP");
		// -- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라~!
		// (ActiveXObject 객체 → XMLHttpRequest 객체를 대신하게 되는 객체)

	} else
	// -- 그 외의 브라우저
	{
		if (window.XMLHttpRequest) // --XMLHttpRequest 지원 브라우저
		{
			return new XMLHttpRequest();
			// 이와 같은 방식으로 XMLHttpRequset 객체를 생성해서 반환해라~!
		} else
		{
			return null;
		}
	}
	*/
	
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
