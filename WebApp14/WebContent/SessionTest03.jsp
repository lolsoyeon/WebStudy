<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 세션 Attribute 해주자
	 String userName = (String)session.getAttribute("userName"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>SessionTest03.jsp</h1>
	<hr>
</div>

<div>
	<h2><%=userName %>님</h2>
	<h2>친구 관리 페이지입니다.</h2>
</div>

</body>
</html>