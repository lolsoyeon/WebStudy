<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	//-- 데이터 베이스의 테이블(TBL_MEMBER)에
	//   회원 데이터 추가 액션 처리 수행
	// ... 이후 , 다시 리스트페이지(MemberSelect.jsp)를 요청 할 수 있도로 안내하는 페이지
	
	// 한글관련 인코딩 처리
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(MemberInsertForm.jsp)로 부터 데이터 수신
	//-- uName, uTel
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	// 가장 중요한것은 DAO 연결
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이베이스 연결 
		// 복습할 부분 알지만 다시
		dao.connection();
		
		// MemberDTO 객체 구성 → dao의 add() 메소드 호출 필요
		MemberDTO dto = new MemberDTO();
		// dto.setSid(sid);
		dto.setName(uName);
		dto.setTel(uTel);
		
		// INSERT 쿼리문 수행 하는 dao의 메소드→  add()
		dao.add(dto);
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// check~!!!!! 잊지 말아야 할 것 
	// 클라이언트가 페이지(MemberSelect.jsp)를 다시 요청 할 수 있도록 안내하는 처리
	   response.sendRedirect("MemberSelect.jsp");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

</body>
</html>