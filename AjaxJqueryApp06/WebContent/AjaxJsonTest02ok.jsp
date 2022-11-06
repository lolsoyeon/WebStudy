<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// AjaxJsonTest02ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result = "";
	
	// ※ JSON 데이터 배열 구조
	// [{"키1":"값2", "키2" : "값2"}, {"키3": "값", "키4" : "키4"}]
			
	/*
	{"num1":"1", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"2", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"3", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"4", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"5", "name":"고연수", "content":"이러쿵 저러쿵"},
	*/
	
	// ↓
	
		/*
	{"num1":"1", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"2", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"3", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"4", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"5", "name":"고연수", "content":"이러쿵 저러쿵"}  ← check~!
	*/
	
	
	
	/*
	[{"num1":"1", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"2", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"3", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"4", "name":"고연수", "content":"이러쿵 저러쿵"},
	{"num1":"5", "name":"고연수", "content":"이러쿵 저러쿵"}]
	*/
	
	for (int n=1;n<=5; n++)		// 1 2 3 4 5
	{
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"num\":\"" + n +  "\"");
		sb.append(", \"name\":\"" + name + "\"");
		sb.append(", \"content\":\"" + content + "\"},");		// check~!!!!!!
		
		result += sb.toString();

		
	}
	// 마지막 ,가 탈락된걸 얻을 수 있다.
	 result = result.substring(0, result.length()-1);
	
	
	 result = "[" + result + "]";
	
	out.println(result);
%>



