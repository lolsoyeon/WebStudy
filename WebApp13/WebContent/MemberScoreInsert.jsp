<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreInsert.jsp 

	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(MemberScoreInsetForm)로 부터 데이터 수신
	//-- kor, eng, mat + sid(+)
	String sid = request.getParameter("sid");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		// MemberScoreDTO 인스턴스 생성 → 수신된 데이터로 객체 구성 
		// add() 메소드의 매개변수 전달
		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		score.setKor(Integer.parseInt(kor));
		score.setEng(Integer.parseInt(eng));
		score.setMat(Integer.parseInt(mat));
		
		// 
		dao.add(score);
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
	
	
	// check~!!
	// 클라이언트에게 새로운 페이지(MemberScoreSelect.jsp)를 요청 할 수 있도록 안내
	response.sendRedirect("MemberScoreSelect.jsp");
	
%>
