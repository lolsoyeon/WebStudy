<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 내가한것
	request.setCharacterEncoding("UTF-8");

	// 이전페이지(CheckArea.jsp)에서 수신한 데이터
	// --== name, memo, checkGroup
	
	String name = request.getParameter("name");

	String memo = request.getParameter("memo");
	
	String[] group = request.getParameterValues("checkGroup");
	
	
	memo = memo.replaceAll("\n","<br>");
	
	
	String result = "";
	
	try
	{
		for (int i=0; i<group.length; i++)	// 0 1 2 3 4 5 6 7 
			result += group[i] + "<br> " ; 	
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
		getServletContext().log("오류 : " + e.toString());
	}
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckArea_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>JSP를 이용한 데이터 송수신 추가 관찰</h1>
	<hr>
</div>

<div>
	<h2>CheckArea.jsp → CheckArea_ok.jsp</h2>
	
	<br> 
	이름 : <%=name %>
	<br>
	메모 : <%=memo %>
	<br>
	== 이상형 리스트 == <br>
	<%=result %>
	

</div>
	
</body>
</html>