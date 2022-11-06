<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	response.setContentType("text/xml");
	
	int count = Integer.parseInt(request.getParameter("count"));
	int age = Integer.parseInt(request.getParameter("age"));
	
	String name = request.getParameter("name");
	String hobby = request.getParameter("hobby");
	
%><?xml version="1.0" encoding="UTF-8"?>

<list>

	<%
	for (int i=1; i<=count; i++)
	{
	%>
	<recodes id="<%=i %>">
		<name><%=name + i%> </name>
		<age><%=age%></age>
		<hobby><%=hobby + i%></hobby>
	</recodes>	
	
	<%
	}
	%>

</list>

