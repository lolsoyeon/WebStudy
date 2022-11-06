<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// LoadTest03Ok.jsp
	// 이전페이지에서 넘어온 데이터 (url안에 get 방식으로 받았다~!!~!)
	// --su1, su2, oper
	// el로 받아도된다~!!!!!!!

	// 복습부분
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	String oper = request.getParameter("oper");
	
	String result = "";
	
	if (oper.equals("add"))
		result = String.format("%d + %d = %d", su1, su2, (su1+su2));
	else if (oper.equals("sub"))
		result = String.format("%d - %d = %d", su1, su2, (su1-su2));
	else if (oper.equals("mul"))
		result = String.format("%d * %d = %d", su1, su2, (su1*su2));
	else if (oper.equals("div"))
		result = String.format("%d / %d = %.2f", su1, su2, ((double)su1/su2));
	
	
	
%>
<%=result %>