<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(SessionTest02.jsp)로부터 테이터 수신
	//-- userName, userBirth + userId, userPwd
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");

	// String userName = request.getParameter("userName");  	//--(X)
	// String userBirth = request.getParameter("userBirth");	//--(X)
	String uName = (String)session.getAttribute("uName");
	String uBirth = (String)session.getAttribute("uBirth");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 전송및 수신</h1>
	<hr>
</div>

<div>
	<p>이름,생일, 아이디, 패스워드, 출력(SesstionTest03.jsp)</p>
	<h3>이름 : <%=uName %></h3>
	<h3>생일 : <%=uBirth %></h3>
	<h3>아이디 : <%=userId %></h3>
	<h3>패스워드 : <%=userPwd %></h3>
</div>

</body>
</html>