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
		</tr>
	

	<%-- 컬렉션 객체 출력용 반복문 구성 --%>
	<%-- <c:forEach var="변수" items="컬렉션"></c:forEach> --%>
	<%--

	for (MyData dto : request.getAttribute("list"))
	{
	}
	 --%>
	 
<%-- 	 <c:forEach var="dto" items="MemberDTO"> --%>
	 <tr>
	 	<td>${param.userName1 }</td>
	 	<td>${param.userTel1 }</td>
	 </tr>
	 <tr>
	 	<td>${param.userName2 }</td>
	 	<td>${param.userTel2 }</td>
	 </tr>
	 
	 <tr>
	 	<td>${param.userName3 }</td>
	 	<td>${param.userTel3 }</td>
	 </tr>
	 <tr>
	 	<td>${param.userName4 }</td>
	 	<td>${param.userTel4 }</td>
	 </tr>
	 <tr>
	 	<td>${param.userName5 }</td>
	 	<td>${param.userTel5 }</td>
	 </tr>
<%-- 	 </c:forEach> --%>
	 </table>
</div>



</body>
</html>