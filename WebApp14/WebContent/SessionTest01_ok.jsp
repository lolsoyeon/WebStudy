<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// SessionTest01_ok.jsp

	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(SesstionTest02.jsp)
	//-- userId, userPwd
	
	String userId  = request.getParameter("userId");
	String userPwd  = request.getParameter("userPwd");
	
	// DTO 활용 로그인 관련 테이블의 데이터와 비교 로그인 액션 처리
	
	String memberId= "superman";
	String memberPwd= "1234";
	String memberName= "최동현";

	// 이전 페이지로 부터 넘어온 로그인 관련 데이터가
	// 데이터베이스로 부터 얻어낸 정보와 일치 한다면~!!
	if (userId.equals(memberId) && userPwd.equals(memberPwd))
	{
		// check~!!!
		// session 에 키, 값 저장
		session.setAttribute("userName", memberName);
		//-- session 객체에 userName 이라는 이름으로 (key)
		//   "최동현" 데이터(값) 적재
		
		// 클라이언트가 다시 SessionTest01.jsp 페이지를 요청 할 수 있도록 안내
		response.sendRedirect("SessionTest01.jsp");
	}
%>
<!-- http://localhost:8090/WebApp14/SessionTest01_ok.jsp?userId=abc&userPwd=123 -->
<h2>로그인 실패~!!!</h2>

<a href="SessionTest01.jsp">로그인 페이지로 돌아가기</a>
