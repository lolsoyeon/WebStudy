<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send04_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	function result()
	{
		var id = document.getElementById("userId");
		var userPwd = document.getElementById("userPwd");
		var userName = document.getElementById("userName");
		var userTel = document.getElementById("userTel");
		
		
		if(userId.length == "")
			alert("아이디를 입력하지 않았습니다.");	
		if(userPwd.length == "")
			alert("비밀번호를 입력하지 않았습니다.");
		if(userName.length == null)
			alert("이름 입력하지 않았습니다.");  
		if(userTel.length == null)
			alert("전화번호를 입력하지 않았습니다.");
		
// 		if(sub==0)
// 			document.gerElementById("sing_in").action = "Receive04_1.jsp";
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
	<hr>
</div>

<div>
	<h2>회원가입 버튼 을 누르면 회원가입이 완료 된다</h2>
	
	<form id="sing_in" action="Receive04_1.jsp" method="get" onsubmit="return result()">
		<div>
			아이디(*) <input type="text" class="txt" name="userId" id="userId"><br>
		    패스워드(*) <input type="text" class="txt" name="userPwd" id="userPwd"><br>
			이름(*) <input type="text" class="txt" name="userName" id="userName"><br>
			전화번호(*) <input type="text" class="txt" name="userTel" id="userTel"><br>
			<br><br>
			
			
				
				성별 <label><input type="radio" name="gender" value="female">여자</label>
				 	 <label><input type="radio" name="gender" value="male">남자</label>
				 
			<br><br>
			지역
			<select name="city">
				<option value="seoul">서울
				<option value="ulsan">울산
				<option value="busan">부산
				<option value="deagu">대구
			</select>
			<br><br>
			수강 과목
			<label><input type="checkbox" name="sub" value="자바 기초">자바 기초</label>
			<label><input type="checkbox" name="sub" value="오라클 중급">오라클 중급</label>
			<label><input type="checkbox" name="sub" value="JDBC">JDBC</label>
			<label><input type="checkbox" name="sub" value="JSP">JSP 심화</label>
			<br><br>
			<button>회원 가입</button>
			
		</div>
	
	</form>

</div>
	
</body>
</html>