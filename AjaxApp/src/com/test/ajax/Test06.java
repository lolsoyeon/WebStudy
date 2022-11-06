package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test06 extends HttpServlet
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
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 사용자가 타이핑중에 전송한 데이터(완성형 단어) 수신
		String search = request.getParameter("search");
		
		// DB 연결 및 연결 액션 처리 모델 컨트롤러... 
		// ~~~~~~~~~ 『where column like 'search%';』 와 같은 쿼리문 수행
		// 업무 정책에 따라 
		// ~~~~~~~~~ 『where column like '%search%';』 와 같은 쿼리문을 수행하는 것도 가능
		//→ 그에 따른 결과 수신
		
		
		// 위와같이 조회한 결과를 가지고 자료구조 활용
		ArrayList<WordDTO> list = new ArrayList<WordDTO>();
		
		if (search.equals("가"))
		{
			list.add(new WordDTO("가사"));
			list.add(new WordDTO("가지"));
			list.add(new WordDTO("가위"));
			list.add(new WordDTO("가방"));
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 매듭"));
			list.add(new WordDTO("가방끈 매듭 만드는방법"));
			
		}
		else if (search.equals("가사")) 
		{
			list.add(new WordDTO("가사"));
			list.add(new WordDTO("가사 듣기"));
			list.add(new WordDTO("가사 말하기"));
			list.add(new WordDTO("가사 외우기"));
			list.add(new WordDTO("가사 만드는 법"));
			
		}
		else if (search.equals("가위")) 
		{
			list.add(new WordDTO("가위"));
			list.add(new WordDTO("가위 갈기"));
			list.add(new WordDTO("가위 날카롭게 만드는 법"));
			list.add(new WordDTO("가위 안전하게 버리는 방법"));
			list.add(new WordDTO("가위 휴대"));
			
		}
		else if (search.equals("가방")) 
		{
			list.add(new WordDTO("가방"));
			list.add(new WordDTO("가방 손질하기"));
			list.add(new WordDTO("가방 구매"));
			list.add(new WordDTO("가방 추천"));
			list.add(new WordDTO("가방 잃어버리지 않는법"));
			
		}
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test06Ok.jsp");
		dispatcher.forward(request, response);
		
		
	}

}
