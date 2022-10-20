<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(SessionTest01_1.jsp)에서 수신한 데이터
	// -- name, birth
	
	String userName = request.getParameter("name");
	String userBirth = request.getParameter("birth");
	
	
	session.setAttribute("name", userName);
	session.setAttribute("birth", userBirth);
	
	// 이름과 생일이 다르다면 다시 요청할수 있도록 처리
	// 여기서는 이 구문을 넣으면 쿠키삭제를 하라고 한다,,,,,,
	// response.sendRedirect("SessionTest02_1.jsp");
		
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SesstionTest02.jsp _ok page</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	function sendIt()
	{
		var f = document.forms[0];
		
		if (!f.id.value)
		{
			alert("아이디를 입력해주세요");
			f.id.focus();
			return;
		}
		if (!f.pwd.value)
		{
			alert("비밀번호를 입력해주세요");
			return;
		}
		
		f.submit();
	}

</script>

</head>
<body>

<div>
	<form action="SessionTest03_1.jsp" method="get" id="myForm">
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="userId" name="id">
			</td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td>
				<input type="text" id="userPwd" name="pwd">
			</td>
		</tr>
		
	
	</table>
	</form>
	<br>
	<button type="button" style="width: 400px;" onclick="sendIt()">고객 총정보</button>
</div>

</body>
</html>