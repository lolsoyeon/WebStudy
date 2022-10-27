/*========================
 	Test1.java
 	- 서블릿 관찰
 ========================*/


package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
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
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();

		// ①
//		pw.println("<html><body><h1>name : 조현하</h1><h1>age : 12</h1></body></html>");
		
		
//		ServletConfig config = getServletConfig();
		
		
		
		// ② 게임기안에 캐릭터의 이름고 전투력 미리 심어줌
		/*
		String name = "조현하";
		String age = "13";
		
		pw.println("<html>");
		pw.println("<body>");
		
		pw.println("<h1>name: " + name + "</h1>");
		pw.println("<h1>age: " + age + "세</h1>");
		
		pw.println("</body>");		
		pw.println("</html>");
		*/
		
		
		// ③ 이름과 나이를 web.xml 에서 삽입
		// 케릭터의 정보를 적어서 그걸 만들 수있다.
		
//		String name = "조현하";
//		String age = "13";
//      	↓
//		String name = web.xml 에서 처리한 이름;
//		String age = web.xml 에서 처리한 나이;
		
		// 『ServletConfig』
		//-- 컨테이너가 서블릿을 초기화 할 때
		//	 서블릿 당 하나씩 ServletConfig 생성하게 된다.
		//  『web.xml』 에 『<init-param>』 추가 후~!!!
		/*
		ServletConfig config = getServletConfig();
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		pw.println("<html>");
		pw.println("<body>");
		
		pw.println("<h1>name: " + name + "</h1>");
		pw.println("<h1>age: " + age + "세</h1>");
		
		pw.println("</body>");		
		pw.println("</html>");
		*/
		
		// ④ 『web.xml』 에 『<context-param>』 추가 후~!!!

		ServletConfig config = getServletConfig();
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		ServletContext context = getServletContext();
		
		String type = context.getInitParameter("type");
		
		
		pw.println("<html>");
		pw.println("<body>");
		
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "세</h1>");
		
		pw.println("<h1>type : " + type + "</h1>");
		
		pw.println("</body>");		
		pw.println("</html>");

		
		
		
		
		
	}

}
