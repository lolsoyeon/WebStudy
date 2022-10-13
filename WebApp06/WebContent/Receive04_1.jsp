<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전페이지에서 넘어온 데이터 수신
	//http://localhost:8090/WebApp06/Receive04_1.jsp?userId=ewe&
	// userPwd=1224&userName=%EC%97%84%EC%86%8C%EC%97%B0&
	// userTel=010-1111-2222&gender=female&city=seoul&
	// javaBasic=java&oracle=oracle
	
	String id = request.getParameter("userId");
	int pwd = Integer.parseInt(request.getParameter("userPwd"));
	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	
	String gender = request.getParameter("gender");
	
	String myGender = "성별 : ";
	
	if(gender.equals("female"))
		myGender += "여성";
	
	if(gender.equals("male"))
		myGender += "남성";
	
	
	String city = request.getParameter("city");
	String result = "";
	
	if(city.equals("seoul"))
		result += "서울";
	else if(city.equals("ulsan"))
		result += "울산";
	else if(city.equals("busan"))
		result += "부산";
	else if(city.equals("deagu"))
		result += "대구";
	
	String[] sub = request.getParameterValues("sub");
	
	String subStr = " ";
	
// 	if(sub.equals("java"))
// 		subStr += "자바 기초";
	
// 	if(sub.equals("oracle"))
// 		subStr += "오라클 중급";
	
// 	if(sub.equals("jdbc"))
// 		subStr += "JDBC";
	
// 	if(sub.equals("jsp"))
// 		subStr += "JSP 심화";

	if(sub != null)
	{
		for(int i=0; i<sub.length;i++)
			subStr +=sub[i].toString()+ ", ";
	}
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	
	/*

	function result()
	{
		var userId = document.getElementById("userId");
		var userPwd = document.getElementById("userPwd");
		var userName = document.getElementById("userName");
		var userTel = document.getElementById("userTel");
		
		alert("함수 호출확인"); // 호출이 안되는 상황...
		
		if()
		
	}
	*/
</script>


</head>
<body>


<div>
	<h1>데이터 전송 실습 04</h1>
	<hr>
</div>

<div>
	<h2>회원 가입 완료</h2>
	
	<form onsubmit ="return result();">
<!-- 	테스트 -->
		아이디 : <%=id %><br>
		패스워드: <%=pwd %><br>
		이름 : <%=name %><br>
		전화번호 : <%=tel %><br><br>
		<%=myGender %> <br>
		지역 : <%=result %><br>
		수강 과목 : <%=subStr %>
	
	</form>

</div>
	
</body>
</html>