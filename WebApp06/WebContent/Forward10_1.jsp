<%@ page contentType="text/html; charset=UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	// 이전페이지 데이터 수신
	//-- num1 num2 op
	
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	String op = request.getParameter("op");

	String result = "";
	
	if (op.equals("add"))
		result += String.valueOf(num1+num2);
	else if (op.equals("sub"))
		result += String.valueOf(num1-num2);
	else if (op.equals("mul"))
		result += String.valueOf(num1-num2);
	else if (op.equals("div"))
		result += String.format("%.1f", num1/(double)num2);
	else if (op.equals("ahrt"))
		result += String.format("%.3f", num1%(double)num2);
	
	// 데이터 담기 (추가)
	request.setAttribute("myResult", result);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward10_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<div>
<!-- 	테스트 -->
<%-- 	<%=result %> --%>
<%-- 	<jsp:include page="Receive10_1.jsp"></jsp:include> --%>

	<jsp:forward page="Receive10_1.jsp"></jsp:forward>

	</div>
</body>
</html>