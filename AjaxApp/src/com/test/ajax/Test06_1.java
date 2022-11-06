package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test06_1 extends HttpServlet
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
		// 한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 넘어온 데이터
		//-- search
		String strSearch = request.getParameter("search");
		
		// 자료구조 생성
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<String> order = new ArrayList<String>();
		
		list.add("가다랑어");
		list.add("가마솥");
		list.add("가방");
		list.add("가방끈");
		list.add("가방끈 매듭");
		list.add("가방끈 매듭 만드는법");
		list.add("가방끈 매듭 풀기");
		
		for (String data : list)
		{
			if (data.startsWith(strSearch))
			{
				order.add(data);
			}
		}
		
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test06Ok.jsp");
		dispatcher.forward(request, response);
		
		
	}

}
