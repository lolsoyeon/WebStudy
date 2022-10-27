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
<title>Test04_result</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL코어(Core) forEach문 자료구조 활용</h1>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
	

	<%-- 컬렉션 객체 출력용 반복문 구성 --%>
	<%-- <c:forEach var="변수" items="컬렉션"></c:forEach> --%>
	<%--

	for (MyData dto : request.getAttribute("list"))
	{
	}
	 --%>
	 
	 <c:forEach var="dto" items="${list }">
	 <tr>
	 	<td>${dto.name }</td>
	 	<%--dto.getName() --%>
	 	<td>${dto.age }</td>
	 	<%--dto.getAge() --%>
	 </tr>
	 </c:forEach>
	 </table>
</div>

</body>
</html>