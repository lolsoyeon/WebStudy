<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Forward10.jsp)로 부터 넘어온 데이터 수신
	//  resultStr setAtrribute() getAttribute()  → Object 반환
 	String resultStr = (String)request.getAttribute("resultStr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 관련 실습 10</h1>
	<hr>
</div>


<div>
	<h2>연산결과 : <%=resultStr %></h2>
</div>
</body>
</html>