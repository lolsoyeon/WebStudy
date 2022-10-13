<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function formChange(obj)
	{
// 		alert("함수호출");
// 		alert(obj);
		//--==>> [object HTMLFormElement]
		// ※ 매개변수로 전달받은 obj 변수에는 form 객체가 저장되어 있다.
		//    필요에 따라 전송하기 전에 검증 절차를 추가하는 것이 가능하며
		//    이 form 을 필요에 따라 submit 할 수 있다.
		
		obj.submit();
		//-- form 의 『submit()』 을 통해
		// form 객체안의 데이터를 서버로 전송하는 것이 가능하다.
		
	}
</script>
</head>
<body>
<!-- 
	○ 데이터 송수신 관련 실습 05
	
	- 구구단 결과를 출력하는 jsp 페이지를 구성한다.
	
	- 원하는 단 수를 입력 받아 결과를 화면에 출력해주는 형태의 페이지로 구성한다.
	
	- 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
		(Send05.jsp)
	
	- 페이지 레이아웃
	-------------------------------------
	단 수 선택 [ 1단 ▼]
	
	-------------------------------------

	- 원하는 단을 선택시 시
	『 1 * 1 = 1 
	   1 * 2 = 2 
	   1 * 3 = 3 
	   1 * 4 = 1 
	   1 * 5 = 5 
	   		:
	   1 * 9 = 9』
	와 같은 내용을 출력하는 jsp 페이지를 작성한다.
	
	
	- 사용자의 최초 요청 페이지는 
		 『localhost:8090/WebApp06/Send05.html』로 한다.	 	
-->

<div>
	<h1>데이터 송수신 관련 실습 05</h1>
	<h2>구구단 입력</h2>
	<hr>
</div>

<div>
	
	<form action="Receive05.jsp" method="get">
	단 수 선택 
		<select id="dan" name="dan" onchange="formChange(this.form)">
			<option> 단 선택 </option>
			<option value="1">1단</option>
			<option value="2">2단</option>
			<option value="3">3단</option>
			<option value="4">4단</option>
			<option value="5">5단</option>
			<option value="6">6단</option>
			<option value="7">7단</option>
			<option value="8">8단</option>
			<option value="9">9단</option>
		</select>
	</form>


</div>
	
</body>
</html>