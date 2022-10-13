<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(Send04.jsp)부터 데이터 수신
	// -- userId, userPwd, userName, userTel
	// userGender , userCity, userSubject
	
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");		// 필수항목 수신 - 아이디
	String userPwd = request.getParameter("userPwd");	// 필수항목 수신 - 패스워드
	String userName = request.getParameter("userName");	// 필수항목 수신 - 이름
	String userTel = request.getParameter("userTel");	// 필수항목 수신 - 전화번호

	String userGender = "확인불가";
	userGender = request.getParameter("userGender");	//-- 성별	
	
	String userCity = "확인불가";
	userCity = request.getParameter("userCity");		//-- 지역
	
	
	// check~!!!
	// - 다중 선택 제어
	// - 배열 수신
	
	String[] subjectArr = request.getParameterValues("userSubject");
	
	String userSubject = " ";
	if (subjectArr.length != 0)
	{
		for(int i=0; i<subjectArr.length; i++)// 배열방의 갯수만큼 반복문 수행
		{
			userSubject += subjectArr[i].toString() + " ";
		}
	}
	else
	{
		userSubject = "선택항목없음";
	}
	
	// 수신된 데이터를
	// 쿼리문을 통해 DB 액션 처리(insert)하는 과정
	// 염두하여 작업을 진행하자~!!!
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>데이터 송수신 관련 실습 04</h1>
	<h2>회원가입</h2>
	<hr>
</div>

<div>
<!-- 	<h3>아이디 : </h3> -->
	<h3>아이디 : <%=userId %></h3>
	
<!-- 	<h3>패스워드 : </h3> -->
	<h3>패스워드 : <%=userPwd %></h3>
	
<!-- 	<h3>이름 : </h3> -->
	<h3>이름 : <%=userName %></h3>
	
<!-- 	<h3>전화번호 : </h3> -->
	<h3>전화번호 : <%=userTel %></h3>
	<br><br>
	
	<h4>성별 : <%=userGender %></h4>
	<h4>지역 : <%=userCity %></h4>
	<h4>수강과목: <%=userSubject %></h4>
	<br>
</div>
	
</body>
</html>