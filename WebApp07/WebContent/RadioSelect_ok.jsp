<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(RadioSelect.jsp)에서 수신한 데이터
	//-name genger major hobby
	
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");		// 텍스트박스... 단일값 수신
	String gender = request.getParameter("gender"); // 라디오버튼... 단일값 수신
	String major = request.getParameter("major");   // 셀렉트박스... 단일값 수신
	
	// check~!!!!
	String[] hobbyArr = request.getParameterValues("hobby");
	//-- 다중 선택이 가능한 셀렉트박스일 경우.. 배열 형태로 수신
	
	// check~!!
	String genderStr = "";
	if (gender.equals("M"))
		genderStr += " 남자";
	else if (gender.equals("F"))
		genderStr += " 여자";
	else
		genderStr +=" 확인불가";
	
	// check~!!
	String hobbyStr = "";
	if (hobbyArr != null)
	{
		for (String item : hobbyArr)
			hobbyStr += "[ " + item + " ]";
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
	
	<p>성별 : <%=gender %><%=genderStr %></p>
	
	<P>전공 : <%=major %></P>
	
	<P>취미 : <%=hobbyStr %></P>
</div>
	
</body>
</html>