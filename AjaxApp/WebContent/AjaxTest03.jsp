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
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">


<style type="text/css">
	.short
	{
	width: 40px; 
	}
</style>
<script type="text/javascript" src="<%=cp%>/js/ajaxx.js"></script>
<script type="text/javascript">

	function myAjax()
	{
// 		alert("함수 호출확인");
	
		// 데이터 수집
		var n1 = document.getElementById("n1").value;
		var n2 = document.getElementById("n2").value;
		var op = document.getElementById("op").value;
		
		
		// url 구성
		var url = "test03.do?n1="+n1+"&op="+op+"&n2="+n2;
// 		alert(url);
		
		// XMLHttpRequest 객체 생성
		// ajaxx.js
		ajaxx = createAjax();
// 		alert(ajaxx);
		
		ajaxx.open("GET", url, true);
		
		
		ajaxx.onreadystatechange = function()
		{
			if (ajaxx.readyState == 4)
			{
				if (ajaxx.status == 200)
				{
					callBack();
				}
			}
		}
		//--------이 까지는 셋팅
		
		// 실제 데이터 전송은 여기서 이루어진다.
		ajaxx.send("");
		
	}//end myAjax
	
	function callBack()
	{
		// 응답한 데이터 가 텍스트일 경우
		var data = ajaxx.responseText;
		
		document.getElementById("result").value = data;
		
	}

</script>

</head>
<body>

<div>
	<h1>AJAX 기본 실습</h1>
	<hr>
</div>

<div>
	<input type="text">
	<br>
	
	<label><input type="radio" name="rdo" id="rdo1">선택1</label>
	<label><input type="radio" name="rdo" id="rdo2">선택2</label>
	<br>
</div>
<br><br>

<div>
	<input type="text" id="n1" class="short txt">
	<select id="op">
		<option>== 선택하세요 ==</option>
		<option value="add">더하기</option>
		<option value="sub">빼기</option>
		<option value="mul">곱하기</option>
		<option value="div">나누기</option>
	</select>
	<input type="text" id="n2" class="short txt">
	<button type="button" value=" = " class="btn" onclick="myAjax()"> = </button>
	<input type="text" id="result" class="short txt">
</div>


</body>
</html>