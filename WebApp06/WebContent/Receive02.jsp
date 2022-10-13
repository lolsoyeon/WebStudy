<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역

	// 한글 처리를 위한 인코딩 방식 지정(한글 깨짐 방지)
	request.setCharacterEncoding("UTF-8");
	
	
	// 이전 페이지(Send02.jsp)로부터 넘어온 데이터 수신
	// → userName, scoreKor,scoreEng, scoreMat
	
	String name = request.getParameter("userName");
	int kor = Integer.parseInt(request.getParameter("scoreKor"));
	int eng = Integer.parseInt(request.getParameter("scoreEnr"));
	int mat = Integer.parseInt(request.getParameter("scoreMat"));

	
	int tot = kor + eng + mat;
	
	double avg = tot/3.0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 난  Receive02.jsp 야~! -->

<div>
	<h1>데이터 송수신 관련 실습 02</h1>
	<hr>
</div>

<div>
	<h2>성적 처리</h2>
	
	<form>
		
<!-- 	  엄소연님, 성적 처리가 완료 되었습니다. -->
<!--       회원님의 점수는 국어:xx점, 영어:xx점, 수학:xx점 입니다. -->
<!-- 	  총점은 xxx점 평균은 xx.x점 입니다. -->

	<%=name %>님, 성적 처리가 완료 되었습니다.<br>
      회원님의 점수는 국어:<%=kor %>점, 영어:<%=eng %>점, 수학:<%=mat %>점 입니다.<br>
	  총점은 <%=tot %>점 평균은 <%=String.format("%.1f", avg) %>점 입니다.<br>
	
	</form>

</div>
	
	
	
	
</body>
</html>