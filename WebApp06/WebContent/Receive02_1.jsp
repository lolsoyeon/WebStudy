<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 (자바)영역
	String userName = request.getParameter("userName");
	String userKor = request.getParameter("userKor");
	String userEng = request.getParameter("userEng");
	String userMat = request.getParameter("userMat");
	
	int kor = Integer.parseInt(userKor);
	int eng = Integer.parseInt(userEng);
	int mat = Integer.parseInt(userMat);
	
	
	int tot = kor + eng + mat; 
	double avg = (kor + eng + mat)/3;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>성적 처리 페이지</h1>
	<hr>
</div>

<div>
	<h2>성적의 결과</h2>
	
	<form>
<!-- 		테스트 -->
<%-- 	<p><%=userName %></p> --%>
<%-- 	<p><%=userKor %></p> --%>
<%-- 	<p><%=userEng %></p> --%>
<%-- 	<p><%=userMat %></p> --%>

<%-- 	<p><%=avg %> --%>
	
	<span><%=userName %>님, 성적 처리가 완료 되었습니다.<br>
		  회원님의 점수는 국어: <%=kor %>점, 영어: <%=eng %>점, 수학: <%=mat %>점 입니다.<br>
		  총점은 <%=tot %>점 평균은 <%=avg %>점 입니다.</span>


	</form>

</div>
	
</body>
</html>