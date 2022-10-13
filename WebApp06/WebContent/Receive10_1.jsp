<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전페이지(Forward10_1.jsp) 로부터 넘어온 데이터 수신
	// num1 op num2 result
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	String op = request.getParameter("op");
	
	String result = (String)request.getAttribute("result"); 

	
	
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
	
	연산결과 : <%=result %>
	
</div>

</body>
</html>