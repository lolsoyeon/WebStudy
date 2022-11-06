<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// AjaxJsonTest01ok.jsp
	String name = request.getParameter("name");
	String content = request.getParameter("content");

	String result = "";
	
	// ※ JSON 데이터 구성
	//    {"키1":"값1","키2":"값2", ...}
	
	StringBuffer sb = new StringBuffer();
	
	sb.append("{\"num\":\"" + 1 + "\"");
	sb.append(",\"name\":\"" + name + "\"");
	sb.append(",\"content\":\"" + content + "\"}");
	

	
	/* {"num":"1","name":"장현성","content":"내용"} */
	//						↓
	/* "{\"num\":\"1\",\"name\":\"장현성\",\"content\":\"내용\"}" */
	
	result = sb.toString();
	
	out.print(result);
	
%>
