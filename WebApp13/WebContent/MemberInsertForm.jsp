<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/memberSelect.css">

<script type="text/javascript">

	function memberSubmit()
	{
		// alert("함수호출");
		// 많이처리하는 방식이다.
		var memberForm = document.getElementById("memberForm");
		
		var uName = document.getElementById("uName");		
		var nameMsg = document.getElementById("nameMsg");		
		
		nameMsg.style.display = "none";
		
		if (uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return;
		}
		
		// form 을 직접 지정하여 submit 액션 수행
		memberForm.submit();
	}
	
	
	// 
	// 이름 전화번호 입력하고 함수 호출이 되면 입력한것이 지워지도록 , 포커스는 그대로
	function memberReset()
	{
		/*
		// alert("함수 호출");
		var uName = document.getElementById("uName");
		var uTel = document.getElementById("uTel");
		
		if(!(uName.value == ""))
		{
			uName.value == "";
			uName.focus();
			return false;
		}
		
		if (!(uTel.value==""))
		{
			uTel.value == "";
			uTel.focus();
			return false;
		}
		
		return true;
		*/
		
		// T > form 을 데려올 수있다. (form 객체를 변수로 받아야한다.)
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		// form 을 직접 지정하여  reset(); 액션 수행
		memberForm.reset();
		
		// reset(); 되면 span 이 사라져야한다.
		// 이름에 포커스가 들어온다.
		uName.focus();
		
		
	}
</script>


</head>
<body>

<div>
	<h1>회원 명단 관리 및 입력 페이지</h1>
	<p>주 기능은 회원의 이름 전화번호를 입력하기 누르면 DB로 뛰어가서 추가해준다.</p>
	<hr>
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button" class="btn">회원 명단 관리</button></a>
</div>

<div>
	<!-- 회원 데이터 입력 폼 구성 -->
	<form action="MemberInsert.jsp" method="post" id="memberForm">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="uName" name="uName">
				</td>
				<td>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="tel" id="uTel" name="uTel">
				</td>
				<td>
				</td>
			</tr>
		</table>
		<a href="javascript:memberSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
		
		
	
	</form>
</div>

</body>
</html>