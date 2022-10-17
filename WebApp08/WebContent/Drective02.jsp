<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Drective02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>include 디렉티브 관찰 및 실습</h1>
	<hr>
</div>

<%@ include file="Drective03.jsp" %>
<br><br>

<div>
	<%=str %><br>
	<%=content %>
</div>

</body>
</html>