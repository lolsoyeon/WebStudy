<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//내가 보낸 페이지로 부터 수신
	
	// 사용자가 입력 한 연도 가지고 오기
	String year = String.valueOf(request.getParameter("year"));
	if (year == null)
		year = "<br>수신데이터없음";
		

	String month = String.valueOf(request.getParameter("month"));
	if (month == null)
		month = "<br>수신데이터없음";
		
	// 달력 객체 생성
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SandAndReceive06_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function month(obj)
	{
		// 사용자가 입력 한 연도 가지고 오기
		
		obj.submit();
	
	}



</script>
</head>
<body>

<!-- 
	○ 데이터 송수신 관련 실습 06
	
	- 달력을 출력하는 jsp 페이지를 구성한다.
	
	- 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	
	- 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
		
	- 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구현한다.
	
	- 년도 구성은 년도 기준 이전 10년 이후 10년 으로 구성한다.
	
	- 월은 1월 부터 12월 까지로 구성한다.
	 
	
	- 페이지 레이아웃
	---------------------------------------------------
	  1992
	    :
	  2002
		:
	  2012			 1
		:			 :
	 [ 2022 ▼] 년 [ 10 ▼] 월
		:			 :
	  2032			12
	   
	   
	   [2012 10 달력이 그리지는 위치에 그리고 나서]
	   
	   스크립트로 접근하지 말고 내가 데이터를 보내고 내가 받는다~!!!
	---------------------------------------------------

	- 사용자의 최초 요청 페이지는 
		 『localhost:8090/WebApp06/SendAndReceive06_1.jsp』로 한다.
 -->



<div>
	<h1>데이터 송수신 관련 실습 06</h1>
	<h2>달력 요청 및 응답</h2>
	<hr>
</div>

<div>
	
	<form>
		<select id="year" name="year" onchange="this.form.submit()">
			<option>선택</option>
			<option value="2020">2020</option>
			<option value="2021">2021</option>
			<option value="2022">2022</option>
			<option value="2023">2023</option>
			 
		</select>년
		
		<select id="month" name="month" onchange="this.form.submit()">
			<option>선택</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			
		</select>월
		
		<%=year %>
		<%=month %>
	
	</form>

</div>
	
</body>
</html>