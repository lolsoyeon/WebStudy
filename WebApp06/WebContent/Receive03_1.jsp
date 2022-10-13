<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿
// 	char plus = ' ';
	
	 int num1 = Integer.parseInt(request.getParameter("num1"));
	 
	 int num2 = Integer.parseInt(request.getParameter("num2"));
	 
// 	 String plusStr = request.getParameter("+");
// 	 plus = plusStr.charAt(0);

// 	String[] optional = request.getParameterValues("option");
	
	 String op = request.getParameter("op");
	 
	 String result = "";
	 
	 if(op.equals("add"))
		 result = String.valueOf(num1+num2);
	 else if(op.equals("sub"))
		 result = String.valueOf(num1-num2);
	 else if(op.equals("mul"))
		 result = String.valueOf(num1*num2);
	 else if(op.equals("did"))
		 result = String.format("%.1f", (num1/(double)num2));

	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AsampleJsp.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>데이터 송수신 02</h1>
	<hr>
</div>

<div>
	<h2>작은 주제</h2>
	
	<form>
<!-- 	테스트 -->
<%-- 	<p><%=optional %></p> --%>
	
	<p><%=op %></p>
	<span>입력하신 <%=num1 %>와 <%=num2 %>의 연산 결과는 <%=result%>입니다.
</span>
	
	</form>

</div>
	
</body>
</html>