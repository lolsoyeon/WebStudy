<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 이전페이지(SessionTest02_1.jsp)로 부터 수신한 데이터
	//-- id, pwd    setAttribute해 놓은 name, birth
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	
	String name = (String)session.getAttribute("name");
	String birth = (String)session.getAttribute("birth");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest03_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<h2>안녕하세요 <%=name %>님</h2>
<h2>당신의 생일은(주민번호 앞자리)는 <%=birth %> 입니다.</h2>
<h2>당신의 id는 <%=id %></h2>
<h2>비밀번호는 <%=pwd %>입니다.</h2>

</body>
</html>