<%@page import="com.sun.scenario.effect.Merge"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberUpdate.jsp 클라이언트와 만날일 없는 페이지 ok페이지

	// 이전페이지(MemberUpdateForm.jsp) 부터 데이터 수신
	//-- uName,uTel + sid (get)방식 
	
	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	String name = request.getParameter("uName");
	String tel = request.getParameter("uTel");

	MemberDAO dao = new MemberDAO();
	
	try
	{
		// dao 의 호출하는 과정에서 인자로
		dao. connection();
		
		MemberDTO member = new MemberDTO();
		member.setSid(sid);
		member.setName(name);
		member.setTel(tel);
		
		// dao의 modify()메소드 호출
		dao.modify(member);
		
		
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
	
	// check~~!~!~!
	// 클라이언트가 MemberSelect.jsp 페이지를 다시 요청 할 수 있도록 다시 안내
	response.sendRedirect("MemberSelect.jsp");
%>
