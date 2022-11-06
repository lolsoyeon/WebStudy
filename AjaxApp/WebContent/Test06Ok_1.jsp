<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	response.setContentType("text/xml");
%><?xml version=1.0 encoding="UTF-8"?>
	<list>
	<c:foreEach var="item" items="${list }">
		<items>
			<item>${item }</item>
		</items>
	</c:foreEach>
	</list>