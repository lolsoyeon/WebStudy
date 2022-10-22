<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<jsp:useBean id="ob" class="com.test.FriendDTO" scope="page"></jsp:useBean>

<jsp:setProperty property="*" name="ob"/>

<%
	String str = "";

	if (ob.getIdelType() != null)
	{
		for ( String temp : ob.getIdelType())
		{
			str += temp + " ";
		}
	}
%>

</head>
<body>


<div>
	<h1>jsp 액션 태그 실습</h1>
	<hr>
</div>

<div>
	<h2> 등록 수신 결과</h2>
	
	
	<!-- 
	<h3>이름 : 박원석</h3>
	<h3>나이 : 47</h3>
	<h3>성별 : 남성</h3>
	<h3>친구이상형 : 전효성</h3>
	 -->
	 
	<h3> 이름 : <%=ob.getName() %></h3>
	<h3> 나이 : <%=ob.getAge() %></h3>
	<h3> 성별 : <%=ob.getGender() %></h3>
	<h3> 친구이상형 : <%=str %></h3>  			
<%-- 	<h3> 친구이상형 : <%=ob.getIdleType() %></h3>   -> null    --%>
<%-- 	<h3> 친구이상형 : <%=ob.getIdleType() %></h3> --%>
</div>


</body>
</html>