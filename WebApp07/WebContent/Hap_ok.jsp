<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Hap.jsp)로부터 데이터 수신
	//-- su1, su2 → 보낸 네임이 뭐냐?
			
	// ※『request』 : 내장객체(→ Servlet 구성→ HttpServletReuest)	
	
	// ※ 인코딩 방식을 request 접근후 바로(처음에) 지정해 주어야
	// 즉, 파라미터에 접근해서 데이터 꺼내기 전에 지정해 주어야
	// 한글 데이터를 깨뜨리지 않고 정상적으로 수신하여 처리 할 수 있다.
	request.setCharacterEncoding("UTF-8");


	// ※ request로 부터 getPrameter() 로 수신한 데이터는 String 형태로 반환 
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	int sum = 0;
	
	try
	{
		int n1 = Integer.parseInt(s1);
		int n2 = Integer.parseInt(s2);
		
		sum = n1 + n2;
	}
	catch(Exception e)
	{

		// 예외 발생시...
		// 클라이언트의 브라우저 화면에서 출력되지 않고
		// 서버의 콘솔 창에 오류메세지가 나오도록 구성
		
		System.out.println(e.toString());

		// 예외 발생시...
		// 복습할 부분
		getServletContext().log("오류 : " + e.toString());
		
		
		// 클라이언트가 마주라는 것은 500에러가 아니라 페이지가 가능~!
		// 에러 발생시
		// 사용자가 특정 페이지를 다시 요청할 수 있도록 안내 가능
		// response.sendRedirect("Error.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hap_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>JSP 를 이용한 데이터 송수신 추가 관찰</h1>
	<hr>
</div>

<div>
	<h2>Hap.jsp → Hap_ok.jsp</h2>
	
	<h3>결과 : <%=sum %></h3>
	<!-- ※ 이전 페이지(Hap.jsp)로 부터 넘어온 데이터의 정수1 또는 정수2 항목에
			정수 형태의 숫자가 아닌, 변환이 불가능한 문자나 빈 공백을 입력 했을 결루
			또는, 값이 누락되었을 경우에도
			결과 확인 버튼 클릭시
			클라이언트의 화면 처리 결과를
			try ~ catch 블럭에 의해
			항상 0 으로 출력되는 것을 확인할 수 있다. 신기하다...-->

</div>
	
</body>
</html>