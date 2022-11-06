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
		
		display: none; 
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
<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">
	
	// 키보드를 누를 때 마다
	// 그 때 까지의 입력된 단어를 서버호 전송하고
	// 그에 맞는 추천 검색어를 받아올 수 있도록 처리 
	function search()
	{
// 		alert("d");

		// 데이터 수집
		var search = document.getElementById("search").value;
		
		// 모르겠는 부분
		// 검색어로 입력한 내용이 있을 경우에만 전송할 수 있도록 처리
		if (search.replace(" ","")=="")
		{
			document.getElementById("list").style.display = "none";
			
			return;
		}
		
		var regEx = /^[가-힣]{1,}$/;
		
		if (!regEx.test(search))
		{
			return;
		}
		/*
		else 
		{
			alert(search);
		}
		*/
		
		//URL 구성
		var url = "test06.do?search=" + search;
		
		//XMLHttrRequest 객체 생성 (AJAX)객체
		ajax = createAjax();
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState==4)
			{
				if (ajax.status==200)
					callBack();
			}
		}
		
		ajax.send("");
		
		// 추출된 업무 내용
		//-- XML 목록으로 받아온 검색어들을
		//   적당한 리스크로 생성해서 화면에 출력
		function callBack()
		{
			// XML 문서 객체 수신
			var doc = ajax.responseXML;
			
			// 수신한 XML 문서의 최상위 엘리먼트 → 지금은 <list> 인 상황
			var root = doc.documentElement;
			
			// root 기반으로 모든 <item> 엘리먼트 수신
			var itemList = root.getElementsByTagName("item");
			
			// → var itemList = ajax.responseXML.documentElement.getElementsByTagName("item");
			
			// item 박스 초기화
			document.getElementById("items").innerHTML = "";
			
			// 복습 부분~!!!!
			// 추천 검색어 삽입하기
			
			// 여러개의 형태로 추가추가,,,
			for (var i=0; i < itemList.length; i++)
			{
				var word = itemList[i].firstChild.nodeValue;
				
				// item 추가하기
				document.getElementById("items").innerHTML 
				+= "<div class='item'>"+ word +"</div>";
					
			}
			
			// 다 수행한 이후에 최종적으로 목록을 화면에 보일 수 있도록 처리하기 → 스타일 제어
			document.getElementById("list").style.display = "block";
			
		}
		
		
	}

</script>



</script>

</head>
<body>

<div>
	<h1>추천 검색어 관련 실습</h1>
	<hr />
</div>

<div>
	검색어
	<input type="text" id="search" class="control" placeholder="검색어를 입력하세요" 
	onkeyup="search()">
</div>

<div id="list">
	<div id="items">
		<div class="item">가다랑어</div>
		<div class="item">가마솥</div>
		<div class="item">가방</div>
		<div class="item">가방끈</div>
		<div class="item">가방끈 매듭</div>
		<div class="item">가방끈 매듭 만드는법</div>
		<div class="item">가방끈 매듭 풀기</div>
	</div>
	<div id="footer">
		추천 검색어
	</div>
</div>

</body>
</html>