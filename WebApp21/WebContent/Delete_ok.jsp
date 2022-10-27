<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Delete_ok.jsp
	
	String pageNum = request.getParameter("pageNum");
	String strNum = request.getParameter("num");

	int num = Integer.parseInt(strNum);
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.deleteData(num);
	
	// result 가 얼마나에 따라서 분기 처리 코드 삽입 가능
	
	DBConn.close();
	
	// 사용자에게 List.jsp 페이지를 다시 요청 할 수 있도록 안내
// 	response.sendRedirect(cp + "/List.jsp?num=" + dto.getNum() + "&pageNum=" + pageNum);
	response.sendRedirect(cp + "/List.jsp?pageNum="+ pageNum);
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

</body>
</html>