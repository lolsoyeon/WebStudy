<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전페이지(Send05.jsp)로 부터 데이터 수신
	// -- name="dan"   dan
	
	// 수신데이터에 한글 없음
	String danStr = request.getParameter("dan");
	int dan = Integer.parseInt(danStr);
	
	String result = "";
	
	for(int i =1; i<=9; i++)
		result += String.format("%d * %d = %d<br>",dan, i,(dan*i));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>데이터 송수신 관련 실습 05</h1>
	<h2>구구단 출력</h2>
	<hr>
</div>

<div>
	
	<form>
	<%=result %>
	
	</form>

</div>
	
</body>
</html>