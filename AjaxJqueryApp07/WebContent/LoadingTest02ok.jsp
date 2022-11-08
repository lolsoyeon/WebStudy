<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// LoadingTest02ok.jsp
	
	// 데이터 수신
	
	String name = request.getParameter("name");
	String pre = request.getParameter("pre");
	
	int telM = Integer.parseInt(request.getParameter("telM"));
	int telL = Integer.parseInt(request.getParameter("telL"));
	
	String city = request.getParameter("city");
	
	try
	{
		Thread.sleep(5000);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	
%>
<br>
이름  : <%=name %>
<br>
전화 번호 : <%=pre %> - <%=telM %> - <%=telL %>
<br>
지역 : <%=city %>