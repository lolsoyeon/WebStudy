package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03 extends HttpServlet
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
		// 이전 페이지(AjaxTest03.jsp)에서 데이터 수신
		//-- n1, n2, op
		String strN1 = request.getParameter("n1");
		String strN2 = request.getParameter("n2");
		String strOp = request.getParameter("op");
		
		int result = 0;
		
		int n1 = Integer.parseInt(strN1);
		int n2 = Integer.parseInt(strN2);
		
		if (strOp.equals("add"))
		{
			result = n1 + n2;
		}
		else if (strOp.equals("sub"))
		{
			result = n1 - n2;
		}
		else if (strOp.equals("mul")) 
		{
			result = n1 * n2;
		}
		else if (strOp.equals("div")) 
		{
			result = n1 / n2;
		}
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test03Ok.jsp");
		dispatcher.forward(request, response);
		
	}

}
