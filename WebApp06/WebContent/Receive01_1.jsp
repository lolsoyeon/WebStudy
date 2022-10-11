<%@ page contentType="text/html; charset=UTF-8"%>

<%

		String userName = request.getParameter("name");
		String userTel = request.getParameter("tel");
		
	
		
		String str = userName + "님, 회원가입이 완료 되었습니다." 
		+"회원님께서 등록하신 전화번호는 "+ userTel +"입니다.";
		
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01_1.jsp</title>
</head>
<body>
<div>
	<form action="">
		<%=str %>

	</form>
</div>
</body>
</html>