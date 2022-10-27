<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>이름과 전화번호를 입력 해주세요</h1>
	<hr>
</div>



<div>
	<form action="MemberInsert.jsp" method="get">	
	이름 : <input type="text" name="userName1" />
	전화번호 : <input type="tel" name="userTel1" /><br>
	이름 : <input type="text" name="userName2" />
	전화번호 : <input type="tel" name="userTel2" /><br>
	이름 : <input type="text" name="userName3" />
	전화번호 : <input type="tel" name="userTel3" /><br>
	이름 : <input type="text" name="userName4" />
	전화번호 : <input type="tel" name="userTel4" /><br>
	이름 : <input type="text" name="userName5" />
	전화번호 : <input type="tel" name="userTel5" /><br>
	
	<button type="submit">확인</button>
	
	</form>
</div>	




</body>
</html>