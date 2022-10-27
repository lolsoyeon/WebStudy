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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
	
 	<c:forEach var="dto" items="${list }">
		 <tr>
		 	<td>${dto.name }</td>
		 	<td>${dto.tel }</td>
		 	<td>${dto.addr }</td>
		 </tr>
	 </c:forEach>
	 </table>
</div>



</body>
</html>