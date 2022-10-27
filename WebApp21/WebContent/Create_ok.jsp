<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>


<%
	// Create_ok.jsp
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 수신한 데이터로 구성된 dto
	//- 이 과정에서 누락된 데이터  num, ipAddr, created, hitCount
	//- created, hitCount 는 넘겨줄 필요가 없음
	//- num, ipAddr 은 필요한 상황 그러면...
	
	// 1. 게시물의 현재 상태의 최대값 얻어오기
	int maxNum = dao.getMaxNum();
	
	// 2. 확보한 게시물 번호 최댓값에 1을 더해서 다시 set 하기
	dto.setNum(maxNum+1); 
	
	// 테스트
	// String ipTest = request.getRemoteAddr();
	
	// 3. IP Address set 하기
	dto.setIpAddr(request.getRemoteAddr());
	
	// 데이터베이스 insert 액션을 수행하기 위한 메소드 호출
	dao.insertDate(dto);
	
	DBConn.close();
	
	// 클라이언트에 List.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("List.jsp");
		
%>

<!-- 확인 -->
<%-- <%=maxNum %> --%>

<!-- 확인  -->
<%-- <%=ipTest %> --%>

