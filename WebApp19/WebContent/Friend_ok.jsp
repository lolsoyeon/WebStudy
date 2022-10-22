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


<!-- 반복문 필요(다중 선택으로 넘어온 배열 형태의 결과값 출력) -->
<!-- 배열 반복문으로 꺼낼때 null 체크 잊지말자~! -->
<%
	String str = "";

	if (ob.getIdelType() != null)
	{
		for (String temp : ob.getIdelType())
		{
			str += temp + " ";
			// 전송된것을 받아오는것이 아니라 문자열로 적재하기 때문에
			// 뒤로가기 를 통해 새로 객체를 받아올 경우,
			// 이전의 기록이 str 에 남아있게 된다.
			//-- form 자체를 리셋 해줘야하는 케이스 !(추후 배울 예정)
		}
	}
%>


</head>
<body>


<div>
	<h1>JSP 액션 태그 실습</h1>
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

</div>


</body>
</html>