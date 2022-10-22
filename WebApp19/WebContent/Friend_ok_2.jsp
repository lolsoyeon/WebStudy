<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.test.FriendDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- 반복문 필요(다중 선택으로 넘어온 배열 형태의 결과값 출력) -->
<%
	String str = "";
	if(ob.getIdelType() != null)
	{
		for(String idel : ob.getIdelType())
		{
			str += idel + " ";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
</head>
<body>

<div>
	<h1>JSP 액션 태그 실습</h1>
	<hr>
</div>

<div>
	<h2>등록 수신결과 확인</h2>
	<!-- 
	<h3>이름 : 박원석</h3>
	<h3>나이 : 47</h3>
	<h3>성별 : 남성</h3>
	<h3>친구이상형 : 아이유 전효성</h3>
	 -->
	 <h3>이름 : <%=ob.getName() %></h3>
	 <h3>나이 : <%=ob.getAge() %></h3>
	 <h3>성별 : <%=ob.getGender() %></h3>
	 <h3>친구이상형 : <%=str %></h3>
</div>

</body>
</html>