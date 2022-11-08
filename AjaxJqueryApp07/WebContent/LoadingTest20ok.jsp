<%@page import="java.io.Console"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
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
	String result= "";
	
	try
	{
		JSONArray jarr = new JSONArray();
		 
		for (int n=1; n<=3; n++)		// 1 2 3 
		{
			JSONObject jobj = new JSONObject();
			
			jobj.put("n", n);
			jobj.put("name", name);
			jobj.put("pre", pre);
			jobj.put("telM", telM);
			jobj.put("telL", telL);
			jobj.put("city", city);
			
			// 컬렉션 add() 처리
			jarr.add(jobj);
			
		}
			out.print(jarr.toString());
			
			Thread.sleep(50);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	
%>
