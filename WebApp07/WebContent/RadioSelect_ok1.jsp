<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// 이전 페이지에서 수신한 데이터
	//-name genger major hobby
	
	// 이름의 수신 데이터
	String name = request.getParameter("name");

	// 성별의 수신데이터
	String gender = request.getParameter("gender");
	
	// 성별의 결과값을 담을 변수
	String sex = "";
	
	if (gender.equals("F"))
		sex += "F(여자)";
	else if (gender.equals("M"))
		sex += "M(남자)";
	
	// 전공의 수신 데이터
	String major = request.getParameter("major");
		
	// 취미의 수신 데이터 (다중선택 가능하므로 수정)
// 	String hobby = request.getParameter("hobby");
	String[] hobbys = request.getParameterValues("hobby");
	
	// 취미의 결과 값을 담을 변수 선언 
	// str
	
	String str = "";
	
	try
	{
		if (hobbys != null)
		{
			for (String hb : hobbys)
				str += "[ " + hb +" ]";
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
		
		getServletContext().log("오류 : " + e.toString());
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AsampleJsp.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>JSP 를 이용한 데이터 송수신 추가 관찰</h1>
	<hr>
</div>


<div>
	<h2>RadioSelect.jsp → RadioSelect_ok.jsp</h2>
</div>

<div>
	<h3>수신한 데이터</h3>
	
	<p>이름 : <%=name %></p>
	
	<p>성별 : <%=sex %></p>
	
	<P>전공 : <%=major %></P>
	
	<P>취미 : <%=str %></P>
</div>
	
</body>
</html>