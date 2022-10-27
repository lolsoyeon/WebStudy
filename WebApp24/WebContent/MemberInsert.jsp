<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	//이전페이지로부터 데이터 수신했음
	//-- dto라는 이름으로 
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<jsp:useBean id="dto" class="com.test.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%--
<div>
	<p>${dto.userName1 }</p>
	<p>${dto.userTel1 }</p>
</div>
 --%>

<jsp:forward page="MemberList.jsp"></jsp:forward>
</head>
<body>

</body>
</html>