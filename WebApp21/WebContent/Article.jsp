<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	 Connection conn = DBConn.getConnection();
	 BoardDAO dao = new BoardDAO(conn);

	 // 이전 페이지(List.jsp)부터 데이터 수신
	 //-- 게시물 번호
	 //-- 페이지 번호(안쥐고있으면 1페이지로 가므로...)
	 
	 String pageNum = request.getParameter("pageNum"); 	//-- 페이지 번호
	 String strNum = request.getParameter("num");		//-- 게시물 번호
	 
	 int num = Integer.parseInt(strNum);
	 
	 // 해당 게시물의 조회수 증가
	 dao.updateHitCount(num);
	 
	 // 게시물 상세 내용 가져오기
	 BoardDTO dto =  dao.getReadData(num);
	 
	 // 이전 게시물과 다음 게시물 번호 확인  복습하기
	 int beforeNum = dao.getBeforeNum(num);
	 int nextNum = dao.getNextNum(num);
	 
	 
	 BoardDTO dtoBefore = null;
	 BoardDTO dtoNext = null;
	 
	 if (beforeNum != -1)
		 dtoBefore = dao.getReadData(beforeNum);
	 if (nextNum != -1)
	 	dtoNext = dao.getReadData(nextNum);
	 
	 
	 // 로드 한 후에 삭제하면 null 이되고 그럼 다시 List 페이지로 오게 요청
	 if (dto==null)
	 	response.sendRedirect("List.jsp");
	 
	 //---- 여기로 내려왔다는건 내가 열람할 게시물이 DB에 남아있다.
	 
	 // 게시물 본문의 라인 수 확인
	 int lineSu = dto.getContent().split("\n").length;
	 
	 // 게시물 내용 처리 replaceAll 한거 담아준다.
	 dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	 
	 DBConn.close();
	 
	 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">

</head>
<body>

<div id="bbs">
	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div><!-- #bbs_title -->
	
<div id="bbsArticle">
	<div id="bbsArticle_header">
		<!-- 게시물 제목 -->
		<%=dto.getSubject() %>
	</div>
	
	<div class="bbsArticle_bottomLine">
		<dl>
			<dt>작성자</dt>
<!-- 			<dd>엄소연</dd> -->
			<dd><%=dto.getName() %></dd>
			<dt>라인수</dt>
<!-- 			<dd>1</dd> -->
			<dd><%=lineSu %></dd>
		</dl>
	</div><!-- .bbsArticle_bottomLine -->
	
	<div class="bbsArticle_bottomLine">
		<dl>
			<dt>등록일</dt>
<!-- 			<dd>2022-10-25</dd> -->
			<dd><%=dto.getCreated() %></dd>
			<dt>조회수</dt>
<!-- 			<dd>234</dd> -->
			<dd><%=dto.getHitCount() %></dd>
		</dl>
	</div><!-- .bbsArticle_bottomLine -->

	<div id="bbsArticle_content">
		<table style="width: 600">
			<tr>
			
			<!--	<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150;" >
				어쩌구 저쩌구의 게시물의 내용입니다. -->
				<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150;" >
				<%=dto.getContent() %>
				</td>
			</tr>
		</table>
	</div><!-- #bbsArticle_content -->
	
	
<%-- 	onclick="javascript:location.href='<%=cp%>/List.jsp'"> --%>
	
	<div class="bbsArticle_bottomLine">
<!-- 		 이전글 : <a href="test.com">(771)취미 분야 게시물</a> -->
<%-- 		 이전글 : <a href="test.com">(<%=beforeNum %>)<%=dto.setSubject(dto.getSubject()) %></a> --%>

			<%
			if (beforeNum != -1)
			{
			%>
			이전글 : 
			<a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&num=<%=beforeNum%>">
			(<%=beforeNum %>)<%=dtoBefore.getSubject() %>
			</a>
			<%
			}
			else
			{
			%>
				이전글 : 없음
			<%
			}
			%>
		</div><!-- .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_noLine">
			<%
			if (nextNum != -1)
			{
			%>
			다음글 : 
			<a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&<%=nextNum%>">
			(<%=nextNum %>)<%=dtoNext.getSubject() %>
			</a>
			<%
			}
			else
			{
			%>
				다음글 : 없음
			<%
			}
			%>
		
	</div><!-- .bbsArticle_noline -->

</div><!--#bbsArticle  -->	

	<div class="bbsArticle_noline" style="text-align: right;">
<!-- 		From : 211.238.142.52 -->
		From : <%=dto.getIpAddr() %>
	</div><!-- .bbsArticle_noline -->
	
	<div id="bbsArticle_footer">
	
		<div id="leftfooter">
			<input type="button" value="수정" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Update.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Delete_ok.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
		</div>
		
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2"
			onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum%>'">
		</div>
		
	</div><!-- #bbsArticle_footer -->

</div><!--#bbs -->


</body>
</html>