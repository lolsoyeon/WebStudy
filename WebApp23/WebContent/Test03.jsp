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
<title>Test03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) forEach문 실습</h1>
	<hr>
</div>

<div>
	<table class="table">
	
		<%--JSTL Core 반복문 --%>
		<%--『<c:forEach var="변수" begin="시작값" end="끝값" step="증가값"</c:forEach>』 --%>
	
		<%-- 루프변수에 바로 변수명 접근 가능(변수의 스코프라서) --%>
		<c:forEach var="a" begin="1" end="9" step="1">
		<tr>
			<c:forEach var="b" begin="1" end="9" step="1">
			<td style="width: 20px; text-align: right;">
				<p>${a*b }</p>
			</td>
			</c:forEach>
		</tr>
		</c:forEach>
	
	</table>

</div>

</body>
</html>