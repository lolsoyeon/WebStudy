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
		<form action="" method="get">
			정수 입력1 <input type="text" class="txt" name="num1">

			<select name="op">
				<option value="add">+</option>
				<option value="sub">-</option>
				<option value="mul">*</option>
				<option value="div">/</option>
				<option value="ahrt">%</option>
			</select>
		
			정수 입력2 <input type="text" class="txt" name="num2">
			
			<br>
			<button type="submit" style="width: 152px;"
			onclick="this.form.action='Forward10_1.jsp'">결과</button>
		</form>
	</div>





</body>
</html>