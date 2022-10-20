<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 왔다는 것만으로도 '쿠키를 생성'하게한다.
	Cookie c = new Cookie("cookieTest", "studyCookie");
	
	// 쿠키 설정 (굽기, 데코)
	//c.Xxx()
	c.setMaxAge(3600);
	
	// 쿠키 추가 (여기서 클라이언트한테 넘겨준다.)
	response.addCookie(c);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SetCookieTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>쿠키 설정 및 추가</h1>
	<hr>
</div>

<div>
	<a href="GetCookieTest.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
	
	<a href="RemoveCookieTest.jsp"><button type="button" class="btn">쿠키 정보 삭제</button></a>
</div>


</body>
</html>