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
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	#result
	{
		display: inline-block;
		width: 250px;
		color: #f33;
	}
	p
	{
		margin: 0px;
	}
	

</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>

<script type="text/javascript">

	function check()
	{
// 		alert("함수");
		
		//  데이터 수집
		var id = document.getElementById("id").value;

		// URL 구성
		var url = "test04.do?id="+id; 
		
		//AJAX 객체 생성(XMLHttpRequest 객체 생성)
		ajax = createAjax();
		
		// 환경 설정(『open』("메소드 방식", "URL", 비동기/ 동기))
		ajax.open("GET", url, true);
		
		// 이런 상황이 발생하면 = 기능행위동작 
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4)
			{
				if (ajax.status==200)
				{
					// 이러면 업무 처리 할거야~!
					//-- 아이디 중복 검사의 결과 를 통보받아
					//   사용자에게 메세지 출력(안내)
					callBack();
				}
			}
		}
		
		// 실제로 시작해라~~ 라고 하는건 얘다.
		ajax.send("");

	}//end check()
	
	// 업무 처리 내용 추출
	function callBack()
	{
		var data = ajax.responseText; 
		
		// 정수형태로 바꿔주고..... 그게 1인지 0 인지에 따라 .innerText
		data = parseInt(data);
		
		if (data==0)
		{
			document.getElementById("result").innerText = "사용 가능한 아이디입니다.";
			
		}
		else 
		{
			document.getElementById("result").innerText = "이미 사용중인 아이디 입니다.";
		}
		
	}
	
	
	
</script>
</head>
<body>

<div>
	<h1>회원 가입</h1>
	<h2>아이디 중복검사</h2>
	<hr />
	<p>- AjaxTest04.jsp</p>
	<p>- ajax.js</p>
	<p>- main.css</p>
	<p>- com.test.ajax.Test04.java</p>
	<p>- Test04Ok.jsp</p>
	<p>- web.xml</p>
	<p>- URL : test04.do</p>
	<p>- DB 연동 → 자료구조 대체 활용 → admin, superman</p>
</div>

<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="control txt">
			<input type="button" value="중복 검사" class="control btn" onclick="check()">
			<span id="result">
<!-- 			중복 검사에 대한 결과 처리 할 부분 항상 이렇게 (뷰) 적어 놓는당~! -->
<!-- 				사용 가능한 아이디 입니다. -->
<!-- 				이미 사용중인 아이디 입니다. -->
			</span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td>
			<input type="text" id="name" class="control txt">
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="addr" class="control txt">
			
		</td>
	</tr>
</table>
<br><br>

<div style="text-align: center;">
	: <br>
	: <br>
	: <br>
</div>


</body>
</html>