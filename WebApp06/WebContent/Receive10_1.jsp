<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전페이지(Forward10_1.jsp) 로부터 넘어온 데이터 수신
	// myResult 단하나만 받으면 이 안에 다 포함 되어있다.
	// int num1 = Integer.parseInt(request.getParameter("num1"));
	// int num2 = Integer.parseInt(request.getParameter("num2"));
	
	// String op = request.getParameter("op");
	
	// String result = (String)request.getAttribute("result"); 

	String myResult = (String)request.getAttribute("myResult");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	
	연산결과 : <%=myResult %>
	
</div>

</body>
</html>