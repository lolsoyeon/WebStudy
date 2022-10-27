<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	
</script>

</head>
<body>

<div>
	<h1>Servlet JSP 에서의 데이터 흐름</h1>
	<hr>
</div>

<div>

<!-- 이거 꼭 익히기~!!!!!  -->
<!-- 	폼 구성 데이터를 서블릿(test2 → Test2.java)으로 전송하여 페이지 요청 (sevlet, mapping 등록함) -->
	<form action="test2" method="post">
		이름 : <input type="text" name="name" class="txt"><br>
		나이 : <input type="text" name="age" class="txt"><br>
		<br>
		
		<button type="submit" class="btn">확인</button>
	</form>
</div>

</body>
</html>