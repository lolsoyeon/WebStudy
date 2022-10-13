<%@ page contentType="text/html; charset=UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(Send10.jsp) 데이터 수신
	//→ num1 num2 op
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));

	String op = request.getParameter("op");

	// 선택한 연산자에 따라 처리된 연산 결과를 담아낼 변수
	String result = "";
	
	if (op.equals("1"))
		result +=String.format("%d + %d =%d\n", num1, num2,(num1+num2));
	else if(op.equals("2"))
		result +=String.format("%d - %d =%d\n", num1, num2,(num1-num2));
	else if(op.equals("3"))
		result +=String.format("%d * %d =%d\n", num1, num2,(num1*num2));
	else if(op.equals("4"))
		result +=String.format("%d / %d =%.1f\n", num1, num2,(num1/(double)num2));
	
	
	request.setAttribute("resultStr", result);
	

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	
	<jsp:forward page="Receive10.jsp"></jsp:forward>
	
</body>
</html>