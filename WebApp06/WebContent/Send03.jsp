<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<!-- 
	○ 데이터 송수신 관련 실습 03
	
	- 두 개의 정수와 연산자를 서버로 전송하여 
	(Send.jsp)
	
	해당연산에 대한 결과를 받을 수 있는 jsp 페이지를 작성한다.
	
	- 페이지 레이아웃
	-------------------------------------
	
	정수 1    연산자        정수2
	[      ] [ 더하기 ▼]  [        ]
	
	<연산 결과>
	
	-------------------------------------

	- 연산결과 버튼 클릭 시
	『입력하신 x와 y의연산 결과는 z입니다.』
	라는 내용을 출력하는 jsp 페이지를 작성한다.
	(Receive03.jsp)
	
	- 사용자의 최초 요청 페이지는 
		 『localhost:8090/WebApp06/Send03.html』로 한다.	 	

	- 즉, 두 개의 정수와 연산자를 서버로 전송하여
		합, 차, 곱, 몫(나누기 연산)을 계산하여
		결과를 처리하는 jsp 페이지를 작성한다.

-->

<div>
	<h1>데이터 전송 실습 03</h1>
	<hr>
</div>

<div>
	<h2>작은 주제</h2>
	
	<form action="Receive03.jsp" method="get">
		<table class="table">
			<tr>
				<th>정수1</th>
				<td>
					<input type="text" name="num1" class="txt">
				</td>
			</tr>
			
			<tr>
				<th>연산자</th>
				<td>
					<select name="op">
						<option value="add">더하기</option>
						<option value="sub">빼기</option>
						<option value="mul">곱하기</option>
						<option value="div">나누기</option>
					</select>
				</td>
			</tr>
			
			
			<tr>
				<th>정수2</th>
				<td>
					<input type="text" name="num2" class="txt">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="연산결과" class="btn">
					<input type="reset" value="취소" class="btn">
				</td>
			</tr>
			
			
		</table>
	
	</form>

</div>
	
</body>
</html>