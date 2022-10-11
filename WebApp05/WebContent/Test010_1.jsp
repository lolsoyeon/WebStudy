<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립 릿
	// 1 ~ 100 중 4의 배수만 출력 , 5개 에 한번 개행 
	StringBuffer sb = new StringBuffer();
	int result = 0;
	
	for(int i =1; i<=100; i++)
	{
// 		sb.append(String.format("%d", i));
		
		if(i%4 == 0)
		{
			sb.append(String.format("%d<br>", i));
		}
		
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test010_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>


<div>
	<h1>스크립릿/ 표현식 실습</h1>
	<hr>
</div>

<div>
	<h2>문제 해결</h2>
	<p>1 부터 100 까지의 정수 중에서
	  4의 배수만 출력하는 jsp 페이지를 작성한다.</p>
	<p>- 한 줄에 5 개씩만 출력할 수 있도록 한다.</p>
	<p>- 빈 줄 바꿈은 『br』을 활용한다.</p>
	<p>- for 반복문을 활용한다.</p>  
	
	<form>
		내용 확인
		<%=sb.toString() %>
	</form>

</div>
	
</body>
</html>