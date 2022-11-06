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
<title>AjaxTest05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.doNot
	{
		background-color: #d5d5d5;
	}

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
		var url = "test05.do?id="+id; 
		
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
	
	function search()
	{
// 		alert("함수 호출 확인");
		
		// 데이터 수집
		var addr = document.getElementById("addr").value;
		
		//  URL 준비
		var url = "test05.do?addr="+addr;
		
		//XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		// 설정
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4 && ajax.status == 200)
			{
				callBack2();
			}
		}
		// 실제로 내용을 보냄
		ajax.send("");
	}
	
	// 추출한 업무
	//-- 우편번호 검색 결과를 통보 받아서 사용자에게 안내해줄 수 있도록 처리
	function callBack2()
	{
// 		var data = ajax.responseText;
		
		// XML 문서 전체의 참조 객체(흔히 XML 문서 객체라고 한다.)
		var doc = ajax.responseXML;
		
		// XML 문서의 최상위 엘리먼트
		//--  현재 우리가 수신한 XML 문서의 최상위 엘리먼트는 <list>
		var root = doc.documentElement;
		
		// root(즉, <list> 엘리먼트) 하위의
		// 모든 <item> 엘리먼트들을 받아내기 (반환받기)
		var itemList = root.getElementsByTagName("item");

		// check~!!!!
		// select box 초기화 신경써야한다
		document.getElementById("addrResult").innerHTML = "";
		
		// 검색 결과 확인
		if (itemList.length==0)
		{
			document.getElementById("addrResult").innerHTML 
						= "<option>주소를 검색하세요</option>";
		} 
		else
		{
			document.getElementById("addrResult").innerHTML 
			= "<option value='0'>주소를 선택하세요</option>";
		}
		
		// 검색 결과가 존재할 경우...반복문을 순환하며 각 데이터 가져오기
		for (var i=0; i < itemList.length; i++)
		{
			// 해당 엘리먼트를 얻어내는 코드
			var zipcode = itemList[i].getElementsByTagName("zipcode")[0];
			var address = itemList[i].getElementsByTagName("address")[0];
			
			// ※ 해당 태그가 가지는 텍스트는
			//    태그의 첫 번째 자식이고...
			//    텍스트 노드의 값은
			//    nodeValue 로 가져온다.
			var zipcodeText = zipcode.firstChild.nodeValue;
			var addressText = address.firstChild.nodeValue;

		
			// select box 에 아이템 추가 추가 추가...
			document.getElementById("addrResult").innerHTML
			+= "<option value='" + zipcodeText + "/" + addressText
			+ "'>[" + zipcodeText +"]" + addressText + "</option>";
			
			
			
		}
		
// 			document.getElementById("addr1").value = zipcodeText;
// 			document.getElementById("addr2").value = addressText;
			
	}
	
	function selZipCode(obj)
	{
		// 확인
// 		alert(obj.value);
		//--==>> 04044/서울특별시 마포구 독막로3길 13 (서교동)
		
// 		alert(obj.value.split("/"));
		
		document.getElementById("addr1").value = obj.value.split("/")[0];
		document.getElementById("addr2").value = obj.value.split("/")[1];
		
		
		// check~!!!!
		document.getElementById("addr3").focus();
		
	}
	
	
	
</script>
</head>
<body>

<div>
	<h1>회원 가입</h1>
	<h2>우편번호 검색</h2>
	<hr />
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
			<input type="text" id="addr" class="control txt" placeholder="동 입력">
			<input type="button" value="검색하기" class="control btn" onclick="search()">
			<br>
			<select id="addrResult" class="control" onchange="selZipCode(this)">
				<option>주소를 입력하세요</option>
			</select>
			
		</td>
	</tr>
	
	<tr>
		<th>주소 검색 결과</th>
		<td>
			<input type="text" id="addr1" class="control doNot" readonly="readonly"
			 style="width: 200px;">
			 <br>
			 <input type="text" id="addr2" class="control doNot" readonly="readonly"
			 style="width: 400px;">
			 <br>
			 <input type="text" id="addr3" class="control txt" placeholder="상세주소를 입력하세요"
			 style="width: 400px;">
			
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