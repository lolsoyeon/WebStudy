<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(Table.jsp) 데이터 수신
	//-- su1 su2
	
	//int su1 = Integer.parseInt(request.getParameter("su1"));
	//int su2 = Integer.parseInt(request.getParameter("su2"));
	
	String su1 = request.getParameter("su1");
	String su2 = request.getParameter("su2");
	
	int num1 = 0;
	int num2 = 0;
	
	try
	{
		num1 = Integer.parseInt(su1);
		num2 = Integer.parseInt(su2);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	// 스크립릿
		// tr 이 num1 개
		// td 가 num2 개 로 셀생성
	
	// String table = "";
	// table += "<table border='1'>";
	// table += "<tr>";
	// 해당 월의 날짜 td 발생
	// for (int i = 1; i<num2; i++)
	// {
		
	// 	table += "<td>" + i + "</td>";
		
	//	table += "</tr><tr>";
	// }
	// 	table += "</tr>";
	//	table += "</table>";
	
	
	String str = "화이팅";

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok1.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
</head>
<body>


<div>
	<h1>JSP 를 이용한 데이터 송수신 추가 관찰</h1>
	<h2></h2>
	<hr>
</div>

<div>
	
	<form>
	<table border='1'>
	<%
	for(int i=1; i<=num1; i++)
	{
	%>
	<tr style="width: 50px;">
	<%
		for(int j=1; j<=num2; j++)
		{
	%>
		<td style="width: 50px;"><%=str %></td>
	<%
		}
	%>
	</tr>
	<%
	}
	%>
	
	
	
	
	
	</form>

</div>
	
</body>
</html>