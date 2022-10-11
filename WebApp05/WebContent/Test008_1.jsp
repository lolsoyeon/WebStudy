<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립 릿
	
	int result = 990;

	int oback = result/500;
	int back = (result%500)/100;
	int osip = ((result%500)%100)/50;
	int sip = (((result%500)%100)%50)/10;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test008.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>


<div>
	<h1>스크립 릿/ 표현식 실습</h1>
	<hr>
</div>

<div>
	<h2>문제 해결</h2>
	<p>990원을 화폐 단위로 구분하여 출력하는 jsp 페이지를 작성한다.</p>
	
	<form>
	<h3>대상 금액 : <%=result %>원</h3>
	<h3>화폐 단위</h3>
	<h4>- 오백원 : <%=oback %> 개</h4>
	<h4>- 백원 : <%=back %>개</h4>
	<h4>- 오십원 : <%=osip %>개</h4>
	<h4>- 십원 : <%=sip %>개</h4>
	</form>

</div>
	
</body>
</html>