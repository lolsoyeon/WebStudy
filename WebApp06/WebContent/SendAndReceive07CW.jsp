<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 캘린더 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 초기 값 설정을 위한 값 불러오기
	int nowYear = cal.get(Calendar.YEAR); // 현재 년도
	int nowMonth = cal.get(Calendar.MONTH) + 1; // 현재 월 (월은 +1 처리)
	int nowDay = cal.get(Calendar.DAY_OF_MONTH); // 현재 일
	
	// String displaycal = "";
	
	// 초기 페이지
	
	int year = nowYear;
	
	int month = nowMonth;
	
	String selectYear = request.getParameter("year");
	String selectMonth = request.getParameter("month");
	
	// 사용자 값을 입력 했을 때 년월 설정
	if (selectYear != null && selectMonth != null)
	{
		year = Integer.parseInt(selectYear);
	
		month = Integer.parseInt(selectMonth);
	}
	
	// 월 이동값 설정
	String before = String.format("<a href='SendAndReceive07.jsp?year=%d&month=%d'>◀</a>", year, (month - 1));
	String ahead = String.format("<a href='SendAndReceive07.jsp?year=%d&month=%d'>▶</a>", year, (month + 1));
	
	// 1월이전으로 넘어가거나 12월 이후로 넘어갔을 때 연도 월 처리
	
	if (month < 1)
	{
		year--;
		month = 12;
	
	} 
	else if (month > 12)
	{
		year++;
		month = 1;
	}
	
	// 달력 그리기
	// 각 달의 마지막 날 수 배열 구성
	int[] months =
	{ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
	
	if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
	{
		months[1] = 29;
	}
	
	// 요일 배열 구성
	String[] weekName = { "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" };
	
	// 총 날 수를 누적할 변수 선언
	int nalsu = 0;
	
	// 선택한 년도의 이전 년도까지의 총 날 수 연산
	nalsu = (year - 1) * 365 + (year - 1) / 4 - (year - 1) / 100 + (year - 1) / 400;
	
	// 선택한 월의 이전 월까지의 날 수 누적 연산
	for (int i = 0; i < month - 1; i++)
		nalsu += months[i];
	
	// 선택한 월 1일의 추가 누적 연산
	nalsu++; // nalsu += 1;
	
	// 요일 변수 선언
	int week = 0;
	week = nalsu % 7;
	
	// 마지막 날짜 변수 선언
	int lastDay = 0;
	lastDay = months[month - 1];
	
	// 달력을 그릴 문자열 변수 선언
	String calStr = "";
	calStr += "<table border='1'>";
	calStr += "<tr>";
	for (int i = 0; i < weekName.length; i++)
	{
		if (i == 0)
			calStr += "<th class='sun'>" + weekName[i] + "</th>";
		else if (i == 6)
			calStr += "<th class='sat'>" + weekName[i] + "</th>";
		else
			calStr += "<th>" + weekName[i] + "</th>";
	}
	calStr += "</tr>";
	
	calStr += "<tr>";
	
	// 해당 월의 1일이 시작하기 전의 빈 칸 공백 td 발생
	for (int i = 1; i <= week; i++)
		calStr += "<td></td>";
	
	// 해당 월의 날짜 td 발생
	for (int i = 1; i <= lastDay; i++)
	{
		// 날짜가 그려지는 동안 요일 증가
		week++;
	
		//calStr += "<td>" + i + "</td>";
	
		if (year == nowYear && month == nowMonth && i == nowDay && week % 7 == 0)
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if (year == nowYear && month == nowMonth && i == nowDay && week % 7 == 1)
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if (year == nowYear && month == nowMonth && i == nowDay)
			calStr += "<td class='now'>" + i + "</td>";
		else if (week % 7 == 0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if (week % 7 == 1)
			calStr += "<td class='sun'>" + i + "</td>";
		else
			calStr += "<td>" + i + "</td>";
	
		// 일요일을 그리기 전 기존 tr 을 마무리하고, 새로운 tr 구성
		if (week % 7 == 0)
			calStr += "</tr><tr>";
	}
	
	// 해당 월의 마지막 날짜까지 td 구성을 완료한 후
	// 빈 칸 공백 td 발생
	for (int i = 0; i <= week; i++, week++)
	{
		if (week % 7 == 0)
			break;
	
		calStr += "<td></td>";
	}
	
	calStr += "</tr>";
	
	calStr += "</table>";
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
input {
	margin: 10px;
}

p {
	padding-left: 150px;
}

table {
	text-align: center;
}

.now {
	background-color: aqua;
	font-weight: bold;
}

.sun {
	color: red;
}

.sat {
	color: #5882FA;
}
</style>
</head>
<body>

	<!-- 
	○ 데이터 송수신 관련 실습 07
	
		- 달력을 출력하는 JSP 페이지를 구성한다.
		
		- 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
		
		- 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.

		- 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구현한다.
		  
		- 페이지 레이아웃
		  ----------------------------------------------
				
			  ◀ 2022년 10월 ▶
			   
			[  달력이 그려지는 위치  ]
			
		  ----------------------------------------------
		  
		- 『◀』 이나 『▶』 클릭 시
		  해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
		  
		- 사용자의 최초 요청 페이지는
		  『http://localhost:8090/WebApp06/SendAndReceive07.jsp』로 한다.
-->

	<div>
		<h1>데이터 송수신 관련 실습 07</h1>
		<h2>달력 요청 및 응답</h2>
		<hr>
	</div>

	<div>
		<form action="SendAndReceive07.jsp" method="post">

			<p>
				<%=before%>
				<%=year%>년
				<%=month%>월
				<%=ahead%>
			</p>

			<%=calStr%>

		</form>
	</div>

</body>
</html>