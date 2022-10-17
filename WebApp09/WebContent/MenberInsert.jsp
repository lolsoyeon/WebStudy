<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(Test002.jsp)로부터 데이터 수신
	//-- userName, userTel
	
	String uName = request.getParameter("userName");
	String uTel = request.getParameter("userTel");
	
	// 데이터베이스에 연결
	Connection conn = DBConn.getConnection();
	
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	
	// 쿼리문 준비 → INSERT 쿼리문
	String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
				+ " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", uName, uTel);
	
	// DB 액션 처리 → 쿼리문 실행
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	//--------------- 여기까지는 클라이언트는 모르는 주방의 이야기
	// Test002에서 INSERT가 제대로 이루어지면 Test002.jsp를 재요청 한다.
	// 그래서 클라이언트는 MemberInsert 라는 페이지를 마주하지 못한다.
	
	if (result < 1)  // 인서트가 안됐다 즉, 제대로 처리가 안 된 경우
	{
		// 클라이언트에게 에러페이지를 다시 요청 할 수 있도록 안내
		response.sendRedirect("Error002.jsp");
	}
	else
	{
		// 클라이언트에게 Test002.jsp 페이지를 다시 요청할 수 있도록 안내~!!!
		response.sendRedirect("Test002.jsp");		
	}
	
	// 클라이언트에게 Test002.jsp 페이지를 다시 요청할 수 있도록 안내~!!! if문과 같은 이야기
	// response.sendRedirect("Test002.jsp");
	
%>
