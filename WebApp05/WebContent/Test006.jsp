<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	// 스크립 릿
	// 1 부터 10 까지 반복 연산 → 내용구성
	
	/*
	String str = "<ul>";
	
	
	for(int i=1; i<=10; i++)	// 1 ~ 10
	{
		str += String.format("<li>%d</li>", i);
	}
	str += "</ul>";
	*/
	
	StringBuffer sb = new StringBuffer();
	
	sb.append("<ul>");
	
	for (int i=1; i<=10; i++)
		sb.append(String.format("<li>%d</li>", i));
	
	sb.append("</ul>");
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test006.jsp</title>
</head>
<body>
<div>
	<h1>스크립릿/ 표현식 실습</h1>
	<hr>
</div>

<div>
	<h2>문제 해결</h2>
	<p>1부터 10 까지의 수를 출력하는 jsp 페이지를 작성한다.</p>
	<p>자바스크립트와 혼동하지 않는다</p>
	<p>사용자의 요청주소는 http://localhost:8090/WebApp05/Test006.jsp로 한다</p>
	<p>자바의 반복문을 활용한다.</p>
	
	
	<form>
		<div>
			<%--jsp 실행의 결과 값울 출력하는 영역 --%>
<%-- 			<%=str %> --%>
		<%=sb.toString() %>
		</div>
		
	</form>


</div>
</body>
</html>