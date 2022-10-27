<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL코어(Core) 를 활용한 구구단 출력</h1>
	<hr>
</div>


<div>
	<form action="">
		원하는 단 입력 : <input type="text" name="dan" class="txt">
		<br><br>
		
		<button type="submit" class="btn" style="width: 200px; font-size: 16pt;">결과 확인</button> 
	</form>
</div>

<div id="result"> 
	<!-- 데이터 수신 결과 처리 -->
	<c:if test="${!empty param.dan }">
	
		<c:forEach var="a" begin="1" end="9" step="1">
		<c:set var="b" value="${param.dan }"></c:set>
			<tr>
				<td>
					<p>${b} * ${a} =  ${a*b }</p>
				</td>
			</tr>
		</c:forEach>
	
	
	</c:if>
	
</div>


</body>
</html>