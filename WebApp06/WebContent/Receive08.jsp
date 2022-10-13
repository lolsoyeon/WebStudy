<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send08.jsp)로부터 데이터 수신
	//- gugudan
	
	String gugudanStr = request.getParameter("gugudan");
	int gugudan = Integer.parseInt(gugudanStr);
	
	String result = "";
	for (int i=1; i<=9; i++)
		result += String.format("%d * %d = %d<br>",gugudan, i ,(gugudan*i));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>데이터 송수신 실습 08</h1>
	<h2>구구단 처리</h2>
	<hr>
</div>

<div>
	
	<form>
	
	<p>수신데이터 : <%=gugudanStr %></p>
	<%=result %>
	
	</form>

</div>
	
</body>
</html>