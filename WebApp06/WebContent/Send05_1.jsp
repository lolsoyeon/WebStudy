<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<!-- 
	○ 데이터 송수신 관련 실습 05
	
	- 구구단 결과를 출력하는 jsp 페이지를 구성한다.
	
	- 원하는 답수를 입력 받아 결과를 화면에 출력해주는 형태의 페이지로 구성한다.
	
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
	(Receive05.jsp)
	
	
	- 사용자의 최초 요청 페이지는 
		『http://localhost:8090/WebApp06/Send05.jsp』로 한다.
		http://211.238.142.58/WebApp06/Send05.jsp	 	
-->

<div>
	<h1>데이터 송수신 관련 실습 05</h1>
	<h2>구구단 출력</h2>
	<hr>
</div>

<div>
	
	<form action="Receive05_1.jsp" onchange="Receive05_1.jsp" method="get">
	단 수 선택 
	<select name="dan" onchange="this.form.submit()">
		<option>택</option>
		<option id="1" value="1">1단
		<option id="2" value="2">2단
		<option id="3" value="3">3단
		<option id="4" value="4">4단
		<option id="5" value="5">5단
		<option id="6" value="6">6단
		<option id="7" value="7">7단
		<option id="8" value="8">8단
		<option id="9" value="9">9단
	
	</select>
	
	</form>

</div>
	
</body>
</html>