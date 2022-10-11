<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	// 1부터 100 까지의 정수합
	int sum= 0;
	int n = 1;
	
	while(n<=100)
	{
		sum += n;
		n++;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test009_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>


<div>
	<h1>스크립릿 / 표현식 실습</h1>
	<hr>
</div>

<div>
	<h2>문제 해결</h2>
	<p>1부터 100 까지의 정수 합을 계산하여 출력하는 jsp 페이지를 작성한다.
	<p>while반복문을 확용한다.</p>
	<form>
<%-- 		<h3>1부터 100 까지의 합 : <%=sum %></h3> --%>
		<h3>1부터 100 까지의 합 : <%=sum %></h3>
	</form>

</div>
	
</body>
</html>