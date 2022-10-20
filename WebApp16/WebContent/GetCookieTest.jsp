<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie[] ck = request.getCookies();
	//-- ck 라는 이름으로 쿠키들을 얻어내겠다.
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetCookieTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>쿠키 정보 얻어내기</h1>
	<hr>
</div>


<div>
	<table class="table" border="1">
		<tr>
			<th>쿠키 이름</th>
			<th>쿠키 값</th>
		</tr>
		<%
		for (Cookie c : ck)
		{
		%>
		<tr>
			<td><%=c.getName()%></td>
			<td><%=c.getValue()%></td>
		</tr>
		<%
		}
		%>
	</table>
</div>


<div>
	<a href="SetCookieTest.jsp"><button type="button" class="btn">쿠키 정보 설정</button></a>
	
	<a href="RemoveCookieTest.jsp"><button type="button" class="btn">쿠키 정보 삭제</button></a>
</div>


</body>
</html>