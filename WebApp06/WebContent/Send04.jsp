<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	.msg{color: red; font-size: small; display: none;}
/* 	그릴거면 저런스타일로 할건데 현재는 안그릴거야   display: none */

</style>

<script type="text/javascript">

	function formCheck()
	{
		//alert("함수 호출확인");
		
		//return false;
		//return true;


		// 검사 대상 확인 → 적합 → return true;
		// 검사 대상 확인 → 부적합 → return false;

		var userId = document.getElementById("userId");
		var userPwd = document.getElementById("userPwd");
		var userName = document.getElementById("userName");
		var userTel = document.getElementById("userTel");
		
		var idMsg = document.getElementById("idMsg");
		var pwdMsg = document.getElementById("pwdMsg");
		var nameMsg = document.getElementById("nameMsg");
		var telMsg = document.getElementById("telMsg");
		
		
		// 기본 세팅  -- 문제가 없으면 none 으로 세팅후에 새로검사
		idMsg.style.display = "none";
		pwdMsg.style.display = "none";
		nameMsg.style.display = "none";
		telMsg.style.display = "none";
		
		if(userId.value == "")
		{
			//alert("아이디입력");
			idMsg.style.display = "inline";
			userId.focus();
			return false;
		}
		if(userPwd.value == "")
		{
			pwdMsg.style.display = "inline";
			userPwd.focus();
			return false;
		}
		if(!userName.value)
		{
			nameMsg.style.display = "inline";
			userName.focus();
			return false;
		}
		if(!userTel.value)
		{
			telMsg.style.display = "inline";
			userTel.focus();
			return false;
		}
		
		return true;
		
	}

</script>

</head>
<body>

<!-- 
	○ 데이터 송수신 관련 실습 04
	
	- 회원가입 요청 및 처리에 대한 과정을 jsp 페이지로 구성한다
	
	- 서버로 전송하기 전에(클라이언트 측에서 작성한 내용을 서버 측에 제출하기 전에)
	입력 데이터에 대한 기본 검사 과정을 추가한다.
	즉, 자바스크립트로 필수 입력 항목에 대한 입력 누락 여부 확인
	(Send04.jsp)
	
	
	- 페이지 레이아웃
	-------------------------------------
	
	아이디(*)		[		]
	패스워드(*)		[		]
	이름(*)			[		]		이름을 입력해야합니다.
	전화번호(*)		[		]
	
	성별  			●여자 ○ 남자  radio 버튼
	
	지역 			[ 서울 ▼]		select
	
	수강과목		□자바 기초 □오라클 중급 □JDBC □JSP심화 checkbox다중선택가능
	
	<회원 가입>
	
	-------------------------------------

	- 회원가입 버튼 클릭 시
	『 아이디: superman
		패스워드 : 1234
		이름 : 엄소연
		전화번호 : 010-1111-1111
		
		성별  : 여성
		지역  : 서울
		수강과목 : 오라클중급
	
		이라는 내용을 출력하는 jsp 페이지를 작성한다.
		(Receive04.jsp)
	』
	
	
	- 사용자의 최초 요청 페이지는 
		 『localhost:8090/WebApp06/Send04.html』로 한다.	 	
-->

<div>
	<h1>데이터 전송 실습 04</h1>
	<h2>회원가입 버튼 을 누르면 회원가입이 완료 된다</h2>
	<hr>
</div>

<div>
	<!-- 『onsubmit』대상은 form 이다~!~! -->
	<!-- 『onsubmit』: submit 액션(이벤트) 이 발생할경우 처리 -->
<!-- 	<form action="Receive04.jsp" method="post" onsubmit="return true;"> -->
<!-- 	<form action="Receive04.jsp" method="post" onsubmit="return false;"> -->
	<form action="Receive04.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th>아이디(*)</th>
				<td>
					<input type="text" name="userId" id="userId" class="txt">
					<span class="msg" id="idMsg">아이디를 입력해야합니다.</span>
				</td>
			</tr>
			
			<tr>
				<th>패스워드(*)</th>
				<td>
					<input type="password" name="userPwd" id="userPwd" class="txt">
					<span class="msg" id="pwdMsg">패스워드를 입력해야합니다.</span>
				</td>
			</tr>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" name="userName" id="userName" class="txt">
					<span class="msg" id="nameMsg">이름을 입력해야합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호(*)</th>
				<td>
					<input type="text" name="userTel" id="userTel" class="txt">
					<span class="msg" id="telMsg">전화번호를 입력해야합니다.</span>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" name="userGender" id="female" value="여성">여자
				
					</label>
					
					<label>
						<input type="radio" name="userGender" id="male" value="남성">남자
				
					</label>
				</td>
			</tr>
			
			<tr>
			<th>지역</th>
				<td>
					<select name="userCity" id="userCity">
						<option>=선택하세요=</option>
						<option value="서울시">서울
						<option value="대전시">대전
						<option value="광주시">광주
						<option value="대구시">대구
					</select>
				</td>
			</tr>
			
			<tr>
				<th>수강과목</th>
				<td>
					<label>
						<input type="checkbox" name="userSubject" id="check1" value="자바기초과목">
						자바기초
					</label>
					
					<label>
						<input type="checkbox" name="userSubject" id="check2" value="오라클중급과목">
						오라클중급
					</label>
					
					<label>
						<input type="checkbox" name="userSubject" id="check3" value="JDBC과목">
						JDBC
					</label>
					
					<label>
						<input type="checkbox" name="userSubject" id="check4" value="JSP 심화과목">
						JSP 심화
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입" class="btn">
					<input type="reset" value="취소" class="btn">
				
				</td>
			
			</tr>
			
			
		</table>
	
	</form>

</div>
	
</body>
</html>