<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Table.jsp) 데이터 수신
	//-- su1 su2
	
	request.setCharacterEncoding("UTF-8");

	String s1Str = request.getParameter("su1");
	String s2Str = request.getParameter("su2");

	int n1 = 0;
	int n2 = 0;
	
	// 테이블 셀안에서 1씩 증가 시켜나갈 변수 선언 및 초기화
	int n = 0;
	
	try 
	{
		n1 = Integer.parseInt(s1Str);
		n2 = Integer.parseInt(s2Str);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>JSP 를 이용한 데이터 송수신 추가 관찰</h1>
	<h2>Table.jsp → Table_ok.jsp</h2>
	<hr>
</div>

<div>
	<table border="1">
		<%
// 		for(int i=0; i<10; i++)	// 세로
		for(int i=0; i<n2; i++)	// 세로
		{
		%>
			<tr>
			<%
			// for (int j=0; j<5; j++)	//가로
			for (int j=0; j<n1; j++)	//가로
			{
			%>
				<td><%=++n %></td>		
			<%
			}		// 복습할 부분
			%>
			
			</tr>
		<%
		}
		%>
	
	</table>
	
</div>
	
</body>
</html>