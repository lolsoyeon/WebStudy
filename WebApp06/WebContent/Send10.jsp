<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- ○ 포워드 / 리다이렉트 에서 포워드와 관련한 중요한 실습 -->

<!-- 1. 사칙연산 수행을 위한 정수 입력 페이지를 구성한다.

	 2. 연산자를 함께 입력받을 수 있도록 페이지를 구성한다.
	 	(Send10.jsp)
	 	
	 3. 사용자의 최초 요청 페이지
	   → 『http://localhost:8090/WebApp06/Send10.jsp』
	 
	 4. 연산 전용 페이지를 구성한다. → java → Servlet
	 	(Forward10.jsp)   
	 	- 주방에서 요리만 전담
	 	※ 스크립릿 코드만 존재 → java 코드 (+ jsp:forward 액션태그)
	 	
	 5. 최종 결과 출력 페이지를 구성한다.
	 	(Receive10.jsp)
 -->

	<div>
		<h1>데이터 송수신 관련 실습 10</h1>
		<form action="Forward10.jsp" method="post">
			<table class="table" style="width: 400px;">
				
				<tr>
					<th>정수1</th>
					<th>연산자</th>
					<th>정수2</th>
				</tr>

				<tr>			
					<td style="text-align: center;">
						<input type="text" name="num1" class="txt" style="width: 100px;">
					</td>
					
					<td style="text-align: center;">
						<select name="op" style="width: 100px;">
							<option value="0">연산 선택</option>
							<option value="1">더하기</option>
							<option value="2">빼기</option>
							<option value="3">곱하기</option>
							<option value="4">나누기</option>
						</select>
					
					</td>
					<td>
						<input type="text" name="num2" class="txt" style="width: 100px;">
					</td>
		
					
				</tr>
			</table>
				
			<button type="submit" class="btn">확인</button>
		</form>
	</div>





</body>
</html>