<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 이전 페이지로 부터 데이터 수신
	//-- year, month
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");

	
	// Calendar  객체 생성  정적인 getInstance()
	// java.util.Calendar cal = java.util.Calendar.getInstance();
	Calendar cal = Calendar.getInstance();

	int nowYear = cal.get(Calendar.YEAR);				// 현재 년도 확인
	int nowMonth = cal.get(Calendar.MONTH)+1;			// 현재 월 확인 + 1
 	int nowDay = cal.get(Calendar.DAY_OF_MONTH);		// 현재 일 확인

 		
 	// 기본적으로 이과 같이 년, 월 구성(detailt))
 	// 그려야 할 달력의 년, 월 구성
 	int selectYear = nowYear;
 	int selectMonth = nowMonth;
 	
 	
 	// 페이지에대한 요청이 최초 요청이 아닐 경우
 	// 즉, 사용자가 넘겨준 년, 월에 대한 데이터가 존재할 경우
 	// 설정하는 년, 월에 대한 내용을 이와 같이 변경
 	
 	if (sYear != null || sMonth != null)
 	{
 		selectYear = Integer.parseInt(sYear);
 		selectMonth = Integer.parseInt(sMonth);
 	}
 	
 	//-- 여기까지 수행하면
 	//   상황에 따라 그려야 할 달력의 년, 월 구성 완료~!!!
 	
 	String yOptions = "";
 	for (int year= (selectYear-10); year<=(selectYear+10); year++)
 	{
//  		if (sYear == null && year == selectYear)
 		if (year == selectYear)
 		{
	 		yOptions += "<option value='" + year +"' selected='selected'>" + year + "</option>\n";
 		}
 		else
 		{
 			yOptions += "<option value='" + year +"'>" + year + "</option>\n";
 		}
 		
 	}
 	
 	String mOptions ="";
 	for (int month = 1; month<=12; month++)
 	{
//  	if (sMonth == null && month == nowMonth)
 		if (month == selectMonth)
 		{
 			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>\n";
 		}
 		else
 			mOptions += "<option value='" + month + "'>" + month + "</option>\n";
 	}
 	
 	// --여기까지 수행하면
 	// 	  그려야 할 달력의 년, 월 의 최종 선택 및 그에 따른 select 구성 완료------------------

 	// 여기부터는 달력 그리기
 	
 	
 	// 각 달의 마지막 날 수 배열 구성
 	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}; 
 	
 	if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
 	// 윤년처리 하겠다.
 		months[1] = 29;
 	
 	// 요일 배열 구성
 	String[] weekName = {"일요일", "월요일","화요일","수요일","목요일","금요일","토요일"}; 
 	
 	// 총 날 수를 누적할 변수 선언
 	int nalsu = 0;
 	
 	// 선택한 년도의 이전 년도까자의 총 날 수 연산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
 	
 	//선택한 월의 이전 월 까지의 날 수 누적 연산
 	for (int i = 0; i<selectMonth-1; i++)
 		nalsu += months[i];
 	
 	// 선택한 월 1일의 추가 누적 연산
 	nalsu++;		// nalsu +=1;
 	
 	
 	// 요일 변수 선언
 	int week = 0;
 	week = nalsu % 7;
	
 	// 마지막 날짜 변수 선언 	
 	int lastDay = 0;
	lastDay = months[selectMonth-1];
	
	// 달력을 그릴 문자열 변수 선언
	String calStr = "";
	calStr += "<br><table border='1'>";
	calStr += "<tr>";
	for (int i=0; i<weekName.length; i++)
	{
		if (i==0)
			calStr += "<th class='sun'>" + weekName[i] + "</th>";
		else if (i==6)
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
	for (int i = 1; i<=lastDay; i++)
	{
		// 날짜가 그려지는 동안 요일 증가
		week++;
		
		calStr += "<td>" + i + "</td>";
		
		// 일요일일 때 
		if (week == 0)
			calStr += "<td class='sSun'>" + i + "</td>";

		// 일요일을 그리기 전 기존 tr 을 마무리하고, 새로운 tr 구성
		if (week%7==0)
			calStr += "</tr><tr>";
		
	}	
			
			
			
	// 해당 월의 마지막 날짜까지 td 구성을 완료한 후
	// 빈 칸 공백 td 발생
	for (int i = 0; i<=week; i++, week++)
	{
		if (week%7==0)
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
<title>SandAndReceive06.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	.sun{color: red;}
	.sat{color: blue;}
	.sSun{color: red;}

</style>


<script type="text/javascript">

	function actionCalendar(obj)
	{
		// 매개변수로 넘겨받은 객체 → 폼 객체 
		// 폼객체 submit 액션 처리 하면 끝!
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
	   스크립트로 접근하지 말고, 내가 데이터를 보내고 내가 받는다~!!!
	---------------------------------------------------
	
	- 사용자의 최초 요청 페이지는 
		 『localhost:8090/WebApp06/SendAndReceive06.jsp』로 한다.
 -->



<div>
	<h1>데이터 송수신 관련 실습 06</h1>
	<h2>내가 데이터를 보내고 내가 받는 구조</h2>
	<hr>
</div>

<div>
	<!-- action 속성과 속성값 생략 → 요청페이지는 자기 자신 / 데이터의 수신처 자기 자신 -->
	<form method="post">
		<select id="year" name="year" onchange="actionCalendar(this.form)">
<!-- 		<option value="2022">2022</option> -->
			<%=yOptions %>
		
		</select>년
		
		<select id="month" name="month" onchange="actionCalendar(this.form)">
		
		 	<%=mOptions %>
		</select>월
	
	</form>

</div>

<div>
<!-- 달력을 그릴지점 -->
	<%=calStr %>

</div>


	
</body>
</html>