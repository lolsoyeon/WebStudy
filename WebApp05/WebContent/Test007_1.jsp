<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립 릿
	StringBuffer sb = new StringBuffer();	
	
	sb.append("<ul>");

	for(int dan=1; dan<=5; dan++)
	{
		sb.append(String.format("<li>%d</li>", dan));
			for(int i=1; i<=9; i++)
			{ 
				sb.append(String.format("<li>%d</li>", i));
			}
		
	}
	sb.append("</ul>");
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
	<h1>스크립릿/ 표현식 실습</h1>
	<hr>
</div>

<div>
	<h2>문제 해결</h2>
	<p>스크립릿과 표현식을 이용하여 구구단 5 단을 구성하여 출력하는 jsp 페이지를 작성한다</p>
	
	<form>
	<div>
		
		
	</div>
	
	</form>

</div>
	
</body>
</html>