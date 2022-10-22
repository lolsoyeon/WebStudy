<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function sendIt()
	{
		// alert("함수 호출 확인");
		var f = document.forms[0];
		
		if (!f.userName.value)
		{
			alert("이름을 입력해주세요~!");
			userName.focus();
			return;
		}
		if (!f.subject.value)
		{
			alert("제목을 입력해주세요~!");
			subject.focus();
			return;
		}
		f.submit();
			
	}

</script>

</head>
<body>

<div>
	<h1>JSP 액션 태그 실습</h1>
	<hr>
</div>

<div>
	<p>간단한 기본 방명록 작성 실습</p>
	
	<form action="Guest_ok1.jsp">
		<table class="table">
			<tr>		
				<th>이름</th>
				<td>
					<input type="text" class="txt" name="userName">
				</td>
			</tr>
			<tr>		
				<th>제목</th>
				<td>
					<input type="text" class="txt" name="subject">
				</td>
			</tr>
			<tr>		
				<th>내용</th>
				<td>
					<textarea rows="5" cols="50" name="content" id="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="sendIt()"
					style="width: 100%;">방명록 작성</button>
				</td>
			</tr>
		</table>
	</form>
	
</div>


</body>
</html>