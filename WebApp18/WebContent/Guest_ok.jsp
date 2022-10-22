<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.GuestDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 액션 태그 실습</h1>
	<hr>
</div>

<div>
	<h2>작성된 내용 확인</h2>
	<!-- 
	<h3>이름: 유동현</h3>
	<h3>제목: 남기고 갑니다.</h3>
	<h3>내용</h3><br>
	첫 번째로 방명록의 내용을 남깁니다.<br>
	앞으로 열심히 합시다.<br>
	모두 잘 부탁 드립니다.<br>
	-->
	<h3>이름 : <%=ob.getUserName() %></h3> 
	<h3>제목 : <%=ob.getSubject() %></h3>
	<h3>내용 : <%=ob.getContent().replaceAll("\n", "<br>")%></h3>
<%-- 	<h3>내용 : <%=ob.getContent().replaceAll("\n", "<br>")%></h3> --%>
<!-- 				Object String	  -->
	 
</div>


</body>
</html>