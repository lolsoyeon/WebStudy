<%@ page contentType="text/html; charset=UTF-8"%>



<%
	// 이전페이지(Send05_1.jsp) 로 부터 데이터 수신
	
	// 한글 인코딩 
	request.setCharacterEncoding("UTF-8");

	// String → int 태민이 방식도 해보기
	int dan = Integer.parseInt(request.getParameter("dan"));
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">



</head>
<body>


<div>
	<h1>구구단 <%= dan %>단</h1>
	<hr>
</div>

<div>
	
	<form>
	
	
   		<%for(int i = 1; i<=9; i++) {%>
   	   <div><%=dan %> * <%=i %>  = <%=dan*i %></div> 
	  <%} %>
	
	</form>

</div>
	
</body>
</html>