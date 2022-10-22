<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String content = request.getParameter("content");
	
	content = content.replace("\n", "<br>");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	
	
</script>


<jsp:useBean id="dto" class="com.test.GuestDTO" scope="page"></jsp:useBean>

<%-- <jsp:setProperty property="*" name="dto"/> --%>

<jsp:setProperty property="userName" name="dto"/>
<jsp:setProperty property="subject" name="dto"/>
<jsp:setProperty property="content" name="dto"/>

</head>
<body>

<div>
	<h1>JSP 액션 태그 실습</h1>
	<hr>
</div>

<div>
	<h2>작성된 내용 확인</h2>
	
	<%-- <h2><%=dto %></h2>  ->com.test.GuestDTO@5893becd --%>
	<h3>이름 : <%=dto.getUserName() %></h3>
	<h3>제목 : <%=dto.getSubject() %></h3>
	<h3>내용 </h3>
	<h3><%=content %></h3>
	
<%--  <textarea cols="50" rows="8"><%=dto.getContent() %>"</textarea> --%>
</div>


</body>
</html>