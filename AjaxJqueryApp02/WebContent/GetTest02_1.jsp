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
<title>GetTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	#resultDiv
	{
		width: 180px;
		height: 180px;
		border: 2px solid #499bd7;
	}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		$(".btn").click(function()
		{
// 			alert("클릭버트 눌러짐~~");
			// 이때 userName 의 val을 가져온다
			var name = $("#userName").val();
// 			alert(name);
			
			$.get("GetTest02ok.jsp", {name: name}, function(args)
			{
				//업무에 대한 처리
				$("#resultDiv").html(args);
				
			});
			
			
		});
	});

</script>


</head>
<body>

<div>
	<h1>jqyery의 get() 메소드 실습</h1>
	<hr />
</div>

<form action="">
	<div>
	<input type="text" id="userName" class="txt" />
	<br><br>
	
	<button type="button" id="loadBtn" class="btn" >눌러보자</button>
	
	</div>
</form>

<div id="resultDiv">
<!-- 
	최동현님, 안녕하세요<br>
	반갑습니다.
	
 -->
</div>

</body>
</html>