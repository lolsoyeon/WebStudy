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
	
	String names[] = request.getParameterValues("name");
	String tels[] = request.getParameterValues("tel");
	String addrs[] = request.getParameterValues("addr");
	
	ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	
	MemberDTO dto = null;
	
	for (int i=0; i<names.length; i++)
	{
		dto = new MemberDTO(names[i], tels[i], addrs[i]);
		list.add(dto);
	}
	
	request.setAttribute("list", list);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<%-- <jsp:useBean id="dto" class="com.test.MemberDTO"></jsp:useBean> --%>
<%-- <jsp:setProperty property="*" name="dto"/> --%>

<%--
<div>
	<p>${dto.userName1 }</p>
	<p>${dto.userTel1 }</p>
</div>
 --%>

<jsp:forward page="MemberList_1.jsp"></jsp:forward>
</head>
<body>

</body>
</html>