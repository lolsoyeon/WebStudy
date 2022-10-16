<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%
	// Calendar 객체 생성
	Calendar cal = Calendar.getInstance();

	// 최초 상황
	int nowYear = cal.get(Calendar.YEAR);		
	int nowMonth = cal.get(Calendar.MONTH)+1;
	
	int year = nowYear;
	int month = nowMonth;
	
	// 이전 페이지에서 데이터 수신
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	// 최초 요청이 아닐 때
	if(yearStr != null && monthStr != null)
	{
		year = Integer.parseInt(yearStr);
		month = Integer.parseInt(monthStr);
	}
	// ◀,▶ 어떤 것을 누르냐에 따라 증감or감소
	if(month<1)
	{
		year--;
		month=12;
	}
	// month가 12보다 크다면
	else if(month>12)
	{
		// 년도는 증가
		year++;
		// 월은 1로 초기화
		month=1;
	}
	
	
	// 달력 그리기
	
	// 각 요일 배열
	String[] weekName = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	// 각 달의 마지막 날 수
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	// 윤년일 경우
	if(year%4==0 && year%100!=0 || year%400==0)
	{
		//2월의 마지막 날 수
		months[1]=29;
	}
	
	// 총 날 수를 누적할 변수 선언
	int nalsu=0;
	
	// 작년까지의 총 날수
	nalsu = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
	
	// 이번 년도의 저번달까지의 날 수
	for(int i=0; i<month-1; i++)
		nalsu += months[i];
	
	// 이번달 1일
	nalsu+=1;
	
	// 요일 변수 선언
	int week = nalsu%7;
	
	// 마지막 날짜
	int lastDay = 0;
	lastDay = months[month-1];
	
	// 달력을 그릴 변수 선언
	String calStr = "";
	
	calStr="<table border='1'>";
	calStr+="<tr>";
	
	// 요일 그리기
	for(int i=0; i<weekName.length; i++)
		calStr += "<td>" + weekName[i] + "</td>";
	calStr+="</tr><tr>";
	
	
	// 공백 넣기
	for(int i= 0; i<week; i++)
		calStr += "<td></td>";
	// 숫자 넣기
	for(int i=1; i<=lastDay; i++)
	{
		week++;
		calStr += "<td>"+i+"</td>";
		
		if(week%7==0)
			calStr +="<tr></tr>";
	}
	// 마지막 공백
	for(int i=0; i<=week; i++, week++)
	{
		if(week%7==0)
			break;
		calStr += "<td></td>";
	}
	
	calStr+="</tr>";
	calStr+="</table>";
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
</head>
<body>

<!-- 
	○ 데이터 송수신 관련 실습 06
	
	   - 달력을 출력하는 JSP 페이지 구성한다.
	     
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
		 
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구현한다.
	   
	  
	   - 페이지 레이아웃
	     --------------------------------------------------
	     
	     		◀ 2022년 10월 ▶
	       
	       [ 달력이 그려지는 위치 ]
	     
	     
	     --------------------------------------------------
 	   - 『◀』 이나 『▶』 클릭 시 (링크)
 	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
 	     
 	   - 사용자의 최초 요청 페이지는
 	     『http://localhost:8090/WebApp06/SendAndReceive07.jsp』로 한다.
 -->
	
<div>
	<form action="" method="get">
	<a href="SendAndReceive07.jsp?year=<%=year%>&month=<%=month-1%>">◀</a>
	<%=year %> 년 <%=month %> 월 
	<a href="SendAndReceive07.jsp?year=<%=year%>&month=<%=month+1%>">▶</a>
	</form>
</div>

<div>
	<%=calStr %>
</div>
	
</body>
</html>