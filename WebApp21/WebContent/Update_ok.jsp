<%@page import="com.test.BoardDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.test.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Update_ok.jsp
	// 이전 페이지(Update에서 수신한 데이터(hidden type으로)
	// num, pageNum, pwdSource

	String pageNum= request.getParameter("pageNum");
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);

	int result = dao.updateData(dto);
	
	// result 값에 따른 분기 처리 가능
	
	
	DBConn.close();

	// 사용자에게 해당 게시물의 Article.jsp 페이지를 다시 요청 할 수 있도록 처리
	response.sendRedirect(cp + "/Article.jsp?pageNum=" + pageNum + "&num=" + dto.getNum());
%>
