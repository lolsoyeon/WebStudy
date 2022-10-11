/*========================
 	Test005.java
 	- Servlet 관련 실습
 ========================*/

// 현재...자바 기본 클래스 Test004
// 이를...서블릿(Servlet) 으로 구성하는 방법

// HttpServlet 을 상속받는 클래스로 설계 → Servlet


package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Receive01 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// get 방식의 요청에 대해 호출되어 실행되는 메소드
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// post 방식의 요청에 대해서 호출되어 실행되는 메소드
		doGetPost(request, response);
	
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// get 방식의 요청이든 post 방식의 요청이든
		// 모두 처리할 수 있는 사용자 정의 메소드
		
		// 이전 페이지(Test005.jsp)로 부터 데이터 수신(받음)  (userId / userPwd)
		
		response.setContentType("text/html; charset=UTF-8");
		
		
		String userName = request.getParameter("name");
		String userTel = request.getParameter("tel");
		
		
		
		String str = "아이디: " + userName + ", 패스워드 : " + userTel;
		
		
	
		
		
	}
	
}
