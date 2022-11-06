<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String name = request.getParameter("name");
	
	// String result = "님 안녕하세요. 반갑습니다.";
	
	
%>
<%=name %> 님 안녕하세요.<br> 반갑습니다.