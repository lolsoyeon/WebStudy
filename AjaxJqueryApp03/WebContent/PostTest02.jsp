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
<title>PostTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	#resultDiv
	{
		width: 220px;
		height: 180px;
		border: 2px solid #499bd7;
	}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
//○ 『$.post(url, data, callBack);』
// - 매개변수로 넘겨받은 url을 사용하여 서버에대한 POST 요청을 전송한다.
// - 매개변수
//  url : (String) POST 메소드로 연결하는 서버 측 URL
//  data : (Object) 이름과 값의 쌍으로 프로퍼티를 가진 객체,
//		미리 구성 및 인토딩 된 쿼리 스트링
//  callBack : (Function) 요청이 완료 되면 호출되는 함수.
	
	
		$(document).ready(function()
		{
			$("#sendBtn").click(function()
			{
		
				$.post("PostTest02ok.jsp"
				, {title:$("#title").val(), content:$("#content").val() }
				, function(data)
				  {
					$("#resultDiv").html(data);
				  });

			});
		});
	


</script>


</head>
<body>

<div>
	<h1>jquery의 post() 메소드 실습</h1>
	<hr />
</div>

<div>
	제목 : <input type="text" id="title" class="txt">
	<br>
	내용 : <input type="text" id="content" class="txt" />
	<br>
	
	<input type="button" id="sendBtn" value="보내기" class="btn" />
	
	
</div>
<br><br>


<div id="resultDiv">
<!-- 	제목 : <b>어쩌구</b> -->
<!-- 	<br> -->
<!-- 	내용 : <b>저쩌구 </b> -->
</div>


</body>
</html>