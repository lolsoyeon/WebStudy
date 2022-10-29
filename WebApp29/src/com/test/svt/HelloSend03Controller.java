/*========================================
  com.test.svt.HelloSend03Controller.java
 =========================================*/


package com.test.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloSend03Controller extends HttpServlet
{
	
	private static final long serialVersionUID = 1L;


	// 사용자 요청이 GET방식인 경우 Servlet Container 에 의해 자동으로 호출되는 메소드 
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자 요청이 POST방식인 경우 Servlet Container 에 의해 자동으로 호출되는 메소드 
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	
	// 사용자 요청이 GET 방식이든 POST방식이든 호출될 수 있도록 구성한 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		// View 객체에 대한 연결
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/HelloSend03.html");
		dispatcher.forward(request, response);
		
		
	}
}
