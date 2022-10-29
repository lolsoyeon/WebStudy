<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVCTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>MVC 관련 실습 1</h1>
	<h2>1 ~ 100 까지 출력하라</h2>
</div>




<div>
<!-- 	컨트롤러(MVCTest01.java)로 부터 수신한 결과에 대한 처리
		view 페이지 JSTL : forEach 문 익히기~!~!~!~! -->
<%-- 	<h1>${list }</h1> --%>
	<ul>
		<c:forEach var="i" items="${list }">
		<li>${i }</li>
		</c:forEach>
	</ul>

</div>

<br><br><br><br>

</body>
</html>