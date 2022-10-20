<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest01_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function sendIt()
	{
		// alert("함수 호출 확인~!");
		//var f = document.getElementById("폼아이디");
		var f = document.myForm;
		
		if (!f.name.value)
		{
			alert("이름을 입력해 주세요~!");
			f.userId.focus();
			return;
			// from 객체 . 이름
			
		}
		if (!f.birth.value)
		{
			alert("패스워드를 입력 해주세요~!")
			f.userPwd.focus();
			return;
		}
		
		f.submit();
		
	}
</script>

</head>
<body>


<!-- ○ SessionTest01에서 사용자로부터 이름과 생일을 입력받아
		SessionTest02 로 전송~!!!

	    SessionTest02 에서 사용자로부터 아이디와 패스워드 입력받아
	    앞에서 전달받은 이름과 생일을 함께 
	    SessionTest03 으로 전송~!!!
	    SessionTest03 에서
	    전달받은 이름, 생일, 아이디, 패스워드 출력~!!!
	
	
	01 ----------→ 02 ------------------→ 03
	이름, 생일		 아이디, 패스워드      이름, 생일, 아이디, 패스워드
	입력			 입력                  출력
				  - getParameter()			getAttribute()
				  
				  
	※ 즉, 01에서 02로 넘겨줄 땐 getParameter
	02 에서 03으로 넘겨줄때는 getParamemter 와 getAttribute로 세션 활용
	01 에서 03으로 직접 넘겨줄 수 없기 때문에 세션에 저장
	
	session 외에 hidden 을 이용하여 데이터전달 가능
	
	 -->

<div>
	<form action="SessionTest02_1.jsp" method="get" name="myForm" id="myForm">
	<table>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" id="userName" name="name">
				<span id="nMsg">이름을 입력해주세요</span>
			</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>
				<input type="text" id="userBirth" name="birth">
				<span id="bMsg">생일을 입력해주세요</span>
			</td>
		</tr>
		
	
	</table>
	</form>
	<br>
	<button type="button" style="width: 400px;"onclick="sendIt()">아이디/패스워드창</button>
</div>












</body>


</html>