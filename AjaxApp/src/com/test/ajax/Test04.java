/*======================
 	Test04.java
======================*/
package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test04 extends HttpServlet
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
		// 이전페이지(AjaxTest04.jsp)로 부터  데이터 수신
		//-- id
		 String id = request.getParameter("id");
		 
		 // id 가 "mcw" 일경우
		 // Model → DB 액션 처리 요청 → DAO (처리요청)
		 //								----------------
		 //								Connection, DTO 객체 등 활용
		 //	→ SELECT COUNT(*) AS COUNT  → COUNT 수신 처리
		 //    FORM TBL_MEMBER
		 //	   WHERE ID="mcw";
		 
		 // ※ DB 구성을 별도로 하지 않았기 때문에 컬렉션 자료구조로 대체(대신함)
		 // 여기 복습할 부분~!!!! 자료구조 생성하고 .add(" ") 해서 넣고 
		 // 결과값 반환할 변수 선언후 .add("데이터") 데이터 넣은걸 반복문안에서
		 // 조건문으로 비교 .equals(수신데이터 변수명)
		 ArrayList<String> db = new ArrayList<String>();
		 db.add("admin");
		 db.add("superman");
		 
		 int result = 0;
		 
		 for (String item : db)
		 {
			if (item.equals(id))
			{
				result = 1;
			}
		 }
		 //  최종 result 에 1이 있으면... 이미 존재하는 아이디
		 // 1 로 바뀌지 않고 0 이 계속 남아있으면... 존재하지 않는 아이디 → 사용 가능한 상황
		 
		 request.setAttribute("result", result);
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher("Test04Ok.jsp");
		 dispatcher.forward(request, response);
		 
		 
		 
	}

}
