<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(SessionTest01.jsp)에서 수신한 데이터
	// -- userName, Userbirth
	
	 String userName = request.getParameter("userName");
	 String userBirth = request.getParameter("userBirth");

	 session.setAttribute("uName", userName);
	 session.setAttribute("uBirth", userBirth);
	 
	 
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
		// alert("힘수 호출");
		var f = document.forms[0];
		
		if (!f.userId.value)
		{
			alert("아이디 입력해야 합니다.");
			f.userId.focus;
			return;
		}
		
		if (!f.userPwd.value)
		{
			alert("패스워드를 입력해야 합니다.");
			f.userPwd.focus;
			return;
		}
		
		f.submit();
		
	}



</script>

</head>
<body>

<div>
	<p>아이디와 패스워드(SesstionTest02.jsp)</p>
	<form action="SessionTest03.jsp" method="post" id="myForm">
	
	<!-- <input type="hidden"name = "userName" value="<%=userName%>"> -->
	<!-- <input type="hidden" name="userBirth" value="<%=userBirth%>">  -->
	
	<table class="table">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="userId" class="txt" size="10">
			</td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td>
				<input type="text" name="userPwd" class="txt" size="10">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="sendIt()" class="btn">
				다음 페이지로 전송</button>
			</td>
		</tr>
	</table>
	</form>
	
</div>

</body>
</html>