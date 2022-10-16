<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
/*
	1. 캘린더 객체 생성 한다.
	 1.1 단계 현재(선택한)연도의 직전 년도 까지(2021년 12월 31일)의 날 수 를 구한다.
	 1.2 단계 현재 연도의 현재 월의 1일까지의 날 수 를 구한다.
	 1.3 단계 현재 월의 1일이 무슨 요일이 되는지 구한다.
	 1.4 단계 현재 월의 마지막날 날 수 를 구한다.
	 1.5 단계 달력을 그린다(출력)
	 
	2. 『▶』 또는 『◀』을 클릭시 연도와 월이 변경되도록 <a href= URL?값=키&값=키...>로 전달한다.(GET방식)
*/

	// 달력 객체 생성 -- Calendar 추상클래스
	GregorianCalendar cal = new GregorianCalendar();
	
	// 현재의 년, 월, 일
	int nowYear = cal.get(Calendar.YEAR);			// 현재 연도
	int nowMonth = cal.get(Calendar.MONTH)+1;		// 현재 월
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	// 현재 일

	// 그려야 할 달력의 년, 월 구성
	//- 최초 요청
	int checkYear = nowYear;
	int checkMonth = nowMonth;

	// 이전 페이지(자기자신)으로 부터 수신한 데이터 
	
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	
	// 초기 페이지에서 사용자가 클릭이 없으면 모든 값이 null 인 상황이다..
	// null 이 아닌 클릭이 이루어지면? 그 값을 형변환해서 담는다.
	if (sYear != null && sYear != null)
	{
		checkYear = Integer.parseInt(sYear);
		checkMonth = Integer.parseInt(sMonth);
	}
	
	int lastYear = checkYear;
	int lastMonth = checkMonth-1;
	
	if (lastMonth < 1)		// 1월 에서 ◀ 클릭시 전년도 12월이 출력 
	{
		lastYear -= 1;	//	lastYear = lastYear - 1;
		lastMonth = 12;
	}
	
	
	
	int nextYear = checkYear;	 	 
	int nextMonth = checkMonth+1;		// check~!~! ▶ 클릭시 월을 +1 해서 컨트롤 해야한다.
	
	if (nextMonth>12)	 // 12월에서 ▶ 클릭시 다음 년도 1월이 되어야한다.
	{
		nextYear += 1; 	  // nextYear = nextYear + 1; 
		nextMonth = 1;
	}
	
	
	// ◀ 클릭이 이루어지면 이전 달(-1), 필요에 따라서 년도도 -1씩 보여야한다
	// ▶ 클릭이 이루어지면 다음 달(+1), 필요에 따라서 년도도 +1씩 보여야한다.
	
	
	
	String lastStr = String.format("<a href='SendAndReceive07.jsp?checkYear=%d&checkMonth=%d'>◀</a>", lastYear, lastMonth);
	String nextStr = String.format("<a href='SendAndReceive07.jsp?checkYear=%d&checkMonth=%d'>▶</a>", nextYear, nextMonth);
	
	
	// -----------여기까지하면 ◀, ▶ 클릭 에 따른 년 월 설정 완료
	
	
	// 1.1 이전 년도 말 까지의 날 수 계산
	// int nalsu = (checkYear-1)*365 + (checkYear-1)/4 - (checkYear-1)/100 + (checkYear-1)/400;
	
	// 1.2 현재 월 1일 까지의 날 수 계산
	
	// 캘린더 클래스 이용
	
	
	//http://localhost:8090/WebApp06/SendAndReceive07.jsp?checkYear=2022&checkMonth=11
	//  달력 셋팅(특정 날짜로 지정) 년, 월 일	
	/*
	cal.set(cal.YEAR, checkYear);
	cal.set(cal.MONTH, checkMonth-2);
	
	int befores = cal.getActualMaximum(cal.DAY_OF_MONTH);
	
	cal.set(cal.MONTH, checkMonth-1);
	cal.set(cal.DAY_OF_MONTH,1);
	
	int week = cal.get(cal.DAY_OF_WEEK);
	int maxdays = cal.getActualMaximum(cal.DAY_OF_MONTH);
	*/
	
	// 각 달의 마지막 날 수 배열 구성
	int[] months =
	{ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
	
	if (checkYear % 4 == 0 && checkYear % 100 != 0 || checkYear % 400 == 0)
	{
		months[1] = 29;
	}
	
	
	String[] weeks = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	
	
	// 총 날 수를 누적할 변수 선언
	int nalsu = 0;
	
	// 선택한 년도의 이전 년도까지의 총 날 수 연산
	nalsu = (checkYear - 1) * 365 + (checkYear - 1) / 4 - (checkYear - 1) / 100 + (checkYear - 1) / 400;
	
	// 선택한 월의 이전 월까지의 날 수 누적 연산
	for (int i = 0; i < checkMonth - 1; i++)
		nalsu += months[i];
	
	// 선택한 월 1일의 추가 누적 연산
	nalsu++; // nalsu += 1;
	
	// 요일 변수 선언
	int week = 0;
	week = nalsu % 7;
	
	// 마지막 날짜 변수 선언
	int lastDay = 0;
	lastDay = months[checkMonth - 1];
	
	
	String drawCal = ""; 
	
	drawCal += "<br><table border='1'>"; 
	drawCal += "<tr>";

	for(int i=0; i<weeks.length;i++)
	{
		if(i == 0 ) 	// 일요일 일 때
		drawCal += "<th class='sun'>"+ weeks[i]  +"</th>";
		else if(i == 6)	// 토요일 일 때
		drawCal += "<th class='sat'>" + weeks[i] + "</th>";
		else			// 평일
		drawCal += "<th>" + weeks[i] + "</th>";
	}
	
	drawCal += "</tr>";
	drawCal += "<tr>";
	
	/*
	// 1일이 시작되기 전 까지 빈칸 채우기
	week -=1;
	for(int i=1,j = befores-week+1; i<=week; i++,j++)  
	{
		drawCal +="<td></td>";

	}
	*/
	// 해당 월의 1일이 시작하기 전의 빈 칸 공백 td 발생
	for (int i = 1; i <= week; i++)
		drawCal += "<td></td>";

	
	// 달력 그리기(출력)
	for(int i=1; i<=lastDay;i++)
	{
		// 달력을 그리는 동안 요일 증가
		week++; 
	// 오늘 , 일, 토 요일 구분하기
	if(i==nowDay && checkYear==nowYear && checkMonth==nowMonth)
	{
		drawCal += "<td class='now'>" + i + "</td>";
	}
	else if(week%7==1) // 1 → 일요일 2 → 월요일 ...
	{
		drawCal += "<td class='sun'>" + i + "</td>";
	}
	else if(week%7==0)
	{
		drawCal += "<td class='sat'>" + i + "</td>";
	}
	else
	{
		drawCal += "<td>" + i + "</td>";
	}
	
	// 달력의 개행
	if(week % 7 == 0)
	{
		drawCal += "</tr><tr>";
	}
	
	
}

	// 해당월 마지막 날짜 출력후 남은 빈칸 채우기
	for(int i=0; i<=week; i++, week++)
	{
		if(week%7==0)
			break;
		drawCal += "<td></td>";
		
	}


	drawCal += "</tr>";


	drawCal += "</table>";

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">


<style type="text/css">

.sun {color: red;}
.sat {color: blue;}
.calendar {color: ligthgray;}
.now {background-color: yellow; font-weight: bold}

</style>

</head>
<body>

<!-- 
	○ 데이터 송수신 관련 실습 07
	
	● 과제
	
	- 달력을 출력하는 jsp 페이지를 구성한다.
	
	- 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	
	- 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
		
	- 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구현한다.
	
	
	- 페이지 레이아웃
	---------------------------------------------------
	  
		  ◀ 2022년 10월 ▶
	
	   
	   [달력이 그리지는 위치]

	---------------------------------------------------
	화살표에 링크가 달려있다. ◀ 2022   9월 ▶ 
		
	만년달력이나 캘린더의 set 메소드 
		
	『◀』이나 『▶』 클릭시 
	해당 년 월의 달력을 출력해주는 페이지로 구성한다.
	
	
	- 사용자의 최초 요청 페이지는 
	『http://localhost:8090/WebApp06/SendAndReceive07.jsp』로 한다.
 -->



<div>
	<h1>데이터 송수신 관련 실습 07  - 과제</h1>
	<h2>달력 출력</h2>
	<hr>
</div>

<div>
	
	<%=lastStr %> <%=checkYear %>년 <%=checkMonth %>월 <%=nextStr %>

</div>
	
<div>
	<%=drawCal %>
</div>

</body>
</html>