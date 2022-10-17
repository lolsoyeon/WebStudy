<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 여기까지오면 이름 입력한것(국어 ,영어, 수학도 사실 입력할것이다.)
	// 이전페이지(ScoreList.jsp) 에서 수신한 데이터
	//-- userName, userKor, userEng, userMat
	
	String name = request.getParameter("userName");
	int kor = Integer.parseInt(request.getParameter("userKor"));
	int eng = Integer.parseInt(request.getParameter("userEng"));
	int mat = Integer.parseInt(request.getParameter("userMat"));
	
	// int tot = 0;
	
	/*
	try
	{
		int korStr = Integer.parseInt(kor);
		int engStr = Integer.parseInt(eng);
		int matStr = Integer.parseInt(mat);
	}
	catch(Exception e)
	{
		getServletContext().log("오류 : " + toString());
	}
	*/
	
	// 	int tot = korStr + engStr + matStr;
	
	
	// 데이터는 수신했다 . 했으면 1.db로 뛰어가서 2. 인서트 해줘야한다.
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 작업객체 생성 (바구니)
	Statement stmt = conn.createStatement();
	
	// 쿼리문 준비
	// String sql = "";
	
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)" 
		   + " VALUES (SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", name, kor, eng, mat);
	
	// DB 액션 수행 → 쿼리문 수행
	int updateCount = 0;
	updateCount = stmt.executeUpdate(sql);
	
	// 쿼리 데리고 왔으면 객체 반환
	stmt.close();
	DBConn.close();
	
	if (updateCount < 1) // 인서트가 안됨
	{
		response.sendRedirect("ErrorScore.jsp");
	}
	else		// 인서트완료됨 
	{
		response.sendRedirect("ScoreList.jsp");
	}

%>
