<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 캘린더 객체 생성
	Calendar calendar = Calendar.getInstance();

	// 초기 페이지 날짜 설정을 위한 값 불러오기
	int nowYear = calendar.get(Calendar.YEAR);
	int nowMonth = calendar.get(Calendar.MONTH) + 1;
	int nowDay = calendar.get(Calendar.DAY_OF_MONTH);
	
	// 초기 페이지(사용자가 값을 입력하지 않은 경우) 년월 설정
	int year = nowYear;
	int month = nowMonth;
	
	String inputYear = request.getParameter("year");
	String inputMonth = request.getParameter("month");
	
	// 사용자가 값을 입력한 경우 년월 설정
	if (inputYear!=null && inputMonth!=null)
	{
		year = Integer.parseInt(inputYear);
		month = Integer.parseInt(inputMonth);
	}
	
	// 12월 이후, 1월 이전 연도 처리
	if (month<1)
	{
		year--;
		month = 12;
	}
	else if (month>12)
	{
		year++;
		month = 1;
	}
	
	// 월 이동 버튼 설정
	String before = String.format("<a href='SendAndReceive07.jsp?year=%d&month=%d'>◀</a>", year, (month-1));
	String after = String.format("<a href='SendAndReceive07.jsp?year=%d&month=%d'>▶</a>", year, (month+1));
	
	// 년월 컨트롤러 설정 완료 -------------------------------------------------------------------------------------
	
	// 달력 그리기 -------------------------------------------------------------------------------------------------
	
	// 각 달의 마지막 날 수 배열 구성
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if (year%4==0 && year%100!=0 || year%400==0)
		months[1] = 29;
	
	// 각 요일 배열 구성
	String[] weekName = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 총 날 수를 누적할 변수 선언
	int nalsu = 0;
	
	// 선택한 년도의 이전 년도까지의 총 날 수 연산
	nalsu = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
	
	// 선택한 월의 이전 월까지의 날 수 누적 연산
	for (int i=0; i<month-1; i++)
		nalsu += months[i];
	
	// 선택한 월 1일의 추가 누적 연산
	nalsu++;
	
	// 요일 변수 선언
	int week = 0;
	week = nalsu % 7;
	
	// 마지막 날짜 변수 선언
	int lastDay = 0;
	lastDay = months[month-1];
	
	// 달력을 그릴 문자열 변수 선언
	String calStr = "";
	calStr += "<br><table border='1'>";
	calStr += "<tr>";
	
	for (int i=0; i<weekName.length; i++)
	{	
		if(i==0)
			calStr += "<th class='sun'>" + weekName[i] + "</th>";
		else if(i==6)
			calStr += "<th class='sat'>" + weekName[i] + "</th>";
		else
			calStr += "<th>" + weekName[i] + "</th>";
	}
		
	calStr += "</tr>";
	calStr += "<tr>";
	
	// 해당 월의 1일이 시작하기 전의 빈 칸 공백 td 발생
	for (int i=1; i<=week; i++)
		calStr += "<td></td>";
		
	// 해당 월의 날짜 td 발생
	for (int i=1; i<=lastDay; i++)
	{
		// 날짜가 그려지는 동안 요일 증가
		week++;
		
		// 오늘 / 토일요일 색상 변경될 수 있도록 설정
		if (year==nowYear && month==nowMonth && i==nowDay)
			calStr += "<td class='now'>" + i + "</td>";
		else if (week%7==0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if (week%7==1)
			calStr += "<td class='sun'>" + i + "</td>";
		else
			calStr += "<td>" + i + "</td>";
		
		// 달력 줄바꿈
		if (week%7==0)
			calStr += "</tr><tr>";
	}
	
	// 해당 월의 마지막 날짜까지 td 구성을 완료한 후
	// 빈칸 공백 td 발생
	for (int i=0; i<=week; i++, week++)
	{
		if(week%7==0)
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
	input {margin: 5px;}
	p {padding-left: 136px;}
	table {text-align: center;}
	.now {background-color: #E6E6E6; font-weight: bold;}
	.sun {color: #FA5858;}
	.sat {color: #5882FA;}
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
		<%=before %> <%=year %>년 <%=month %>월 <%=after %>
		</p>
		
		<%=calStr %>
		
	</form>
</div>

</body>
</html>