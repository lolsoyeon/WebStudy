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
<title>AjaxTest06.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	#search
	{
		width: 500px; 
	}
	#list
	{
		border:  1px solid gray;
		width: 500px;
		
		position: absolute;
		left: 70px;
		top: 135px;
		
/* 		display: none; */
		display: inline;
	}
	#list
	{
		padding: 1px;
	}
	#list #footer
	{
		background-color: #ddd;
		text-align: right;
		padding : 2px;
		font-size : 6px;
	}

</style>
<!-- <!-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> --> 
<%-- <%-- <script type="text/javascript" src="<%=cp%>/js/ajax.js"> --%> 
<!-- // 	$(document).ready(function() -->
<!-- // 	{ -->
<!-- // 		$("input").keyup(function() -->
<!-- // 		{ -->
<!-- // // 			alert("이벤트 발생"); -->

<!-- // 		}); -->
<!-- // 	}); -->

<!-- <!-- </script> --> 

<script type="text/javascript">
	function keyup()
	{
// 		alert("함수 호출");
		// 데이터 수집
		var search = document.getElementById("search").value;
		
//		alert(search);
		// url 구성
		var url = "test06.do?search=" + search;
// 		alert(url)
		// AJAX 연결 객체
		var ajax = createAjax();

// 		alert(ajax);
		//--==>> [object XMLHttpRequest]
		
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4 && ajax.status == 200)
			{
				// 이런 업무를 해라
				callback();
			}
		}
		
		// 실제로 보내는 구문
		ajax.send("");

	}
	
	function callBack(oj)
	{
		// 문서 전체의 참조 객체
		var doc = ajax.responseXML;
		
		// 최상위 객체 얻어 내기
		var root = doc.documentElement;
		
		// items 에 담아놓은거 itemList 에 담고
		var itemList = root.getElementsByTagName("items");
		
		
		// (검색 결과가) 존재할 경우 반복문을 수행하면서 각 데이터 가져오기
		for (var i = 0; i < itemList.length; i++)
		{
			var str = itemList[i].getElementsByTagName("item")[0];
		}
		
		document.getElementById("items").innerHTML += str;
		
		document.getElementById("items").value = oj.value;		
		
	}

</script>

</head>
<body>

<div>
	<h1>추천 검색어 관련 실습</h1>
	<hr />
</div>

<div>
	검색어
	<input type="text" id="search" class="control" placeholder="검색어를 입력하세요" onkeyup="keyup(this)">
</div>

<div id="list">
	<div id="items">
		<div class="item"></div>
	</div>
	<div id="footer">
		추천 검색어
	</div>
</div>

</body>
</html>