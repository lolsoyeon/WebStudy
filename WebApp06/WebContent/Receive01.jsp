<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역(자바 코드를 기술 할 수 있는 영역)

	
	// 이전페이지로부터(Send01.html) 데이터 수신
	// → userName, userTel
	// request.getParameter()
	
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>데이터 송수신 관련 실습01</h1>
	<hr>
</div>

<div>
	<h2>넘어온 데이터 확인</h2>
<!-- 	테스트	 -->
<%-- 	<p>userName :<%=userName %></p> --%>
<%-- 	<p>userTel :<%=userTel %></p> --%>
	
	
	
	<form>
		<span style="color: blue"><%=userName %></span>님, 회원가입이 완료 되었습니다.<br>
		  회원님께서 등록하신 전화번호는 <span style="color: red"> <%=userTel %></span> 입니다.<br>
	
	</form>

</div>
	
</body>
</html>