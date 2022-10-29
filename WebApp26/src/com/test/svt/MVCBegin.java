/*===========================================
   MVCBegin.java
 - Controller  역할을 수행할 서블릿 클래스 
 ===========================================*/


package com.test.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCBegin extends HttpServlet
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
		// 서블릿 관련 코딩
		
		// 변수 선언 및 데이터 구성
		String message = "안녕하세요, MVC 패턴입니다~!!!!";
		
		// View 역할을 수행하는 JSP 페이지에 전달 할 데이터 구성(값이 담겨있는 변수 전달)
		request.setAttribute("message", message);
		
		
		// Check~!!!
		// 제어권(제어 흐름)도 JSP 페이지(View)에 전달해야한다.
//		RequestDispatcher dispatcher = request.getRequestDispatcher("MVCBegin.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/MVCBegin.jsp");
		dispatcher.forward(request, response);
		// -- 『javax.servlet.RequestDispatcher』클래스는
		//  현재 클라이언트의 요청을 다른 서블릿/ JSP페이지로 전달 하더나
		//  현재 서블릿 / JSP 페이지의 결과를 현재 위치에 포함시키고자
		//  할 때 사용된다.
		
		
		// ※ 『RequestDispatcher』 객체는
		// 		이와 같은 기능을 제공하기 위해
		// 		『forword() 메소드와 『include()』 메소드를 제공하고있으며
		// 		이 두 메소드는 JSP 의 『<jsp:forword>』액션 태그
		// 		『<jsp:include>』 액션 태그와 동일한 기능을 제공한다.
		// 		위의 경우는 현재 요청을 MVCBegin.jsp 로 보내고자 하는 경우이다.
		
		//==> 웹 기본 모델2(MVC)구조는
		// 	  바로 이 『RequestDispatcher』 객체의 forward() 메소드를 통해 구현된다.
		
		
		// 이제는 컨트롤러의 허락없이는 view 페이지를 못만난다.
		// http://localhost:8090/WebApp26/mvcbegin
		
	}


}
