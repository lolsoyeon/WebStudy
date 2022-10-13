<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 지금은 한글 데이터가 없기 때문에 설정하지 않아도 무방함.
// 	request.setCharacterEncoding("UTF-8");
	
	
	// 이전 페이지로(Send03.jsp)부터 넘어온 데이터 수신
	// → num1, op, num2
	//  num1 과 num2 는 형변환
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	String op = request.getParameter("op");
	
	String result = ""; 
	
	if(op.equals("add"))
		result = String.valueOf(num1 + num2);
	else if(op.equals("sub"))
		result = String.valueOf(num1 - num2);
	else if(op.equals("mul"))
		result = String.valueOf(num1 * num2);
	else if(op.equals("div"))
		result = String.format("%.1f" ,(num1/(double)num2));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>데이터 송수신 관련 실습02</h1>
	<hr>
</div>

<div>
	<h2>작은 주제</h2>
	
	<form>
		입력하신 <%=num1 %>와 <%=num2 %>의 연산 결과는 <%=result %>입니다.
	</form>

</div>
	
</body>
</html>