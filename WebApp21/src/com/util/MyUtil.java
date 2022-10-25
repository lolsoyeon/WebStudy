/*=====================
 	MyUtil.java
 	- 게시판 페이징 처리
 =====================*/
// check~!!!
// 지금 같이 확인해보고자 하는 페이징 처리 기법은
// 다양한 방법들 중 한가지(그나마 가장 기본적으로 쉬은 것을 골라..)이다.
// 학습을 마친 이후에..
// 꼭!~!~!~ 추가적으로 개념을 정리하고, 확장시키고, 다른 방법들도 찾아보고 공부해야한다.



package com.util;

public class MyUtil
{
	// ■ 전체 페이지 수를 구하는 메소드
	// numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
	// dataCount : 전체 데이터(게시물) 수
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;
		
		
		pageCount = dataCount/numPerPage;
		
		if (dataCount % numPerPage != 0)
			pageCount++;
		
		
		return pageCount;
		
	}
	//-- 한 페이지에 10 개의 게시물을 출력 할때 
	//   총 32 개의 게시물을 페이지로 구성하기 위해서는
	// 『32 / 10』의 연산을 수행하여 결과 3을 얻을 수 있다.
	// → 『pageCount = dataCount/numPerPage;』
	// 그런데 이 때, 나머지 2개의 게시물을 출력해 주기 위해서는
	// 페이지가 하나 더 필요하다.
	// → 『pageCount++;』
	
	
	// ■ 페이징 처리 기능의 메소드
	// currentPage : 현재 표시할 페이지
	// totalPage : 전체 페이지 수
	// listUrl : 링크 설정할 URL    zzzz,tttt
	public String getIndexList(int currentPage, int totalPage, String listUrl)
	{
		// 실제 페이징을 문자열 형태로 저장할 StringBuffer 변수
		StringBuffer strList = new StringBuffer();
		
		int numPerBlock = 10;
		//-- 페이징 처리 시 게시물 리스트 하단의 숫자를 10개(n개)씩 보여주겠다.
		
		int currentPageSetup;
		//-- 현재 페이지(이 페이지를 기본으로 구성하여 보여주는 숫자가 달라져야 하기 때문에...)
		int page;
		
		int n;
		//-- 이전 페이지 블럭과 같은 처리에서 이동하기 위한 변수
		//   (얼마만큼 이동해야 하는지...) 22 → next→ 32
		
		// 페이지 처리가 별도로 필요하지 않는경우
		//-- 데이터가 존재하지 않거나...
		//   데이터 수가 1페이지도 못채우는 경우는
		//   별도로 페이징 처리를 할 필요가 없다.
		if (currentPage == 0)
			return "";
		
		
		
		// 페이지 요청을 처리하는 과정에서
		// URL 경로의 패턴에 관한 처리
		/*
		 - List.jsp
		    →List.jsp + 『?』
		    
		 - List.jsp?키=값1
		 - List.jsp?키=값1&키2=값
		   → List.jsp?키1=값1 + 『&』
		   → List.jsp?키1=값1&키2=값2 + 『&』
		 */
		if (listUrl.indexOf("?") != -1)			// 링크를 설정할 URL에 『?』가 들어있으면
			listUrl = listUrl + "&";
		else
			listUrl = listUrl + "?";			// 링크를 설정할 URL에 『?』가 들어있지 않으면.....
		//-- 예를 들어
		//   검색값이 존재하면 이미 request 값에
		//   searchKey 와 searchValue가 들어있는 상황이므로
		//   『&』을 붙여서 추가해 주어야한다.
		
		// ┌ 복습할 부분
		// currentPageSetup = 표시할 첫 페이지 -1 
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		//-- 만약,
		//   현재 페이지가 5페이지이고 (currentPage=5)
		//   List.jsp가 보여줄 페이지 갯수가 10 이면(numPerBlock=10)
		//  『5 / 10 = (몫) 0』 이며..여기에 *10 (10을 곱해도) 0 이다.
		//   하지만, 현재페이지가 11페이지라면 (currentPage=11)
		//   『11 / 10 = 1』이며..여기에 *10 (10을 곱하면) 10 이다.
		//   『23 / 10 = 2』이며..여기에 *10 (10을 곱하면) 20 이다.
		//   그러면	currentPageSetup 은 10이 되는 것이다.
		
		
		if (currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
		// 20 = 20 - 10 ; 시작페이지가 10이어야 하기때문
		//-- 만약 위처리에서(라인 93)
		//   현재 페이지가 20페이지였다면 (curreuntPage=20)
		//   『20 / 10 = 2』 이며... 여기에 *10 (10을 곱해서) 20이 되는데
		//    이런 상황이라면 다시 10을 빼서 10으로 만들어준다.
		
		// 1 페이지
		if ((totalPage > numPerBlock) && (currentPageSetup > 0))
			strList.append(" <a href='" + listUrl + "pageNum=1'>1</a>");
		//-- listUrl 은 전처리가 이미 끝난상황이기 때문에
		//   『...』 『..?』 상태
		//   또는
		//   『...?...』 『...?...&』인 상태이다.
		//   이로 인해 결과는
		//   『?pageNum=1』이거나
		//   『...&pageNum=1』 이 되는 상황이다. 
		
		
		// Prev 이전 페이지
		n = currentPage - numPerBlock;
		//-- n : 해당 페이지만큼 앞으로 가기 위한 변수
		if ( (totalPage > numPerBlock) && (currentPageSetup > 0) )
			strList.append(" <a href='" + listUrl + "pageNum=" + n + "'>Prev</a>");
		//-- currentPageSetup 이 0 보다 큰경우 
		//   이미 페이지가 10 페이지 이상이라는 의미이며
		//   이 때, 현재 페이지(currentPage)가 11페이지 이상일 경우
		//   Prev 를 붙이기 위한 내용
		//-- 『Prev』 를 클릭할 경우
		//   n 변수 페이지로 이동하게 되는데
		//   12 에서 『Prev』 할 경우 2 페이지가 되고
		//   22 에서 『Prev』할경우 12페이지가 될 수있도록
		//   처리하는 방식
	
		// 페이지 바로가기
		page = currentPageSetup + 1;
		//-- 『+1』을 하는 이유는
		// 앞에서 currentPageSetup 에서 10을 가져왔다면
		// 실제 그려주어야 하는 바로가기 페이지는 11부터 시작해야 하기 때문이다.
		// 시작 값 
		
		
		while ( (page <= totalPage) && (page <= currentPageSetup + numPerBlock) )
			// 11 <=77 && 51<=50+10
		{
			if (page==currentPage)
				strList.append(" <span style='color:orange; font-weigth:bold;'>" + page + "</span>");
			else
				strList.append(" <a href='" + listUrl + "pageNum=" + page + "'>" + page + "</a>");
			
			page++;
			
			// currentPageSetup : 20
			// currentPage : 23
			//→ <a>21</a> <a>22</a> <span>23</span> <a>24</a> <a>25</a>
			//   <a>26</a> <a>27</a> <a>28</a> <a>29</a> <a>30</a>
		}
		
		// Next 
		n = currentPage + numPerBlock;
		//   Next 누르면 다음페이지는 33 page로간다. 33 = 23 + 10 ;
		if ( (totalPage - currentPageSetup) > numPerBlock )  
			strList.append(" <a href='" + listUrl + "pageNum=" + n + "'>Next</a>");
		
		// 마지막 페이지
		if ( (totalPage > numPerBlock) && (currentPageSetup + numPerBlock) < totalPage ) // 54 > 10 && 40+10<54
			strList.append( " <a href='" + listUrl + "pageNum=" + totalPage + "'>" + totalPage + "</a>");
			
		
		// 순서대로 구성된 저장된 페이징을 문자열 형태로 반환
		return strList.toString();
		
	}//end getIndexList(int currentPage, int totalPage, String listUrl)
	
	
}
