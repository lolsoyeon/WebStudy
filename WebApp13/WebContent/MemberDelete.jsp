<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberDelete.jsp

	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(MemberSelect.jsp)로 부터 데이터 수신
	// -- sid
	
	String sid = request.getParameter("sid");
	
	MemberDAO dao = new MemberDAO();
	
	String strAddr = "";
	
	try
	{
		dao.connection();
		
		// dao.remove(sid);
		
		
		int checkCount = dao.refCount(sid);
		// --TBL_MEMBER 테이블의 제거하고자 하는 데이터의
		// SID 를 참조하는 TBL_MEMBERSCORE 테이블 내의 데이커 갯수(존재 여부) 확인
	
		if (checkCount==0)
		{
			dao.remove(sid);
			strAddr = "MemberSelect.jsp";
		}
		else
		{
// 			dao.remove(sid);
			strAddr = "Notice.jsp";
			// -- 제거하지 못하는 사유를 안내하는 페이지...
			//   + 리스트로 돌아가는 기능
		}
	
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());			
		}
	}
	
	// 클라이언트가 srtAddr 의 주소로 다시 요청 할 수 있도록 안내
	response.sendRedirect(strAddr);

%>
