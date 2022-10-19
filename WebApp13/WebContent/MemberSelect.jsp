<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	StringBuffer str = new StringBuffer();
	
	MemberDAO dao = new MemberDAO();
	
	
	try
	{
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th class='numTh'>번호</th>");
		str.append("<th class='nameTh'>이름</th>");
		str.append("<th class='telTh'>전화번호</th>");
		str.append("<th style='width: 200px;''>회원관리</th>");
		str.append("</tr>");
		
		for (MemberDTO member : dao.list())
		{
			str.append("<tr>");
/*
			str.append("<tr>                                                           ");
			str.append("<td>1</td>                                                 ");
			str.append("<td>조현하</td>                                               ");
			str.append("<td>010-1111-1111</td>                                     ");
			str.append("<td>                                                       ");
			str.append("	<a><button type='button' class='btn01'>수정</button></a> ");
			str.append("	<a><button type='button' class='btn02'>삭제</button></a> ");
			str.append("	</td>                                                      ");
			str.append("</tr>                                                          ");
			str.append("</tr>");
*/		
			
			// String sid = member.getSid();
			// String name = member.getName();
			
			str.append("<tr> ");
			str.append("<td>"+ member.getSid()+"</td>");
			str.append("<td>"+ member.getName() +"</td>");
			str.append("<td>"+ member.getTel() +"</td> ");
			str.append("<td>");
// 			str.append("	<a href='MemberUpdateForm.jsp?sid=1'>"); 정적으로 1을 전달하는것이 아니라 Member.getSid()

			str.append("<a href='MemberUpdateForm.jsp?sid=" + member.getSid() +"'>");
			str.append("<button type='button' class='btn01'>수정</button>");
			str.append("</a>");
			
//			str.append("<a href='javascript:memberDelete(" + member.getSid() + ", 20)'>");
//			str.append("<a href='javascript:memberDelete(" + member.getSid() + ", 홍길동)'>");
			//--==>> 에러 발생
//			str.append("	<a href='javascript:memberDelete(" + member.getSid() + ", + ""\"홍길동 +" \")'>");
//			str.append("<a href='javascript:memberDelete("+member.getSid()+ ", 『" +홍길동 +"』)'>");
			str.append("<a href='javascript:memberDelete(" + member.getSid() + ", \"" + member.getName() + "\")'>");

// 			str.append("<a href='javascript:memberDelete(sid, name)'>");
//			str.append("<a href='javascript:memberDelete(member.getSid(), member.getName())'>");
//			str.append("<a href='javascript:memberDelete(member.getSid(), member.getName())'>");
// 			str.append("<a href='javascript:memberDelete(member.getSid(), member.getName())'>");
			str.append("<button type='button' class='btn01'>삭제</button>");
			str.append("</a>");
			
			str.append("</td>");
			str.append("</tr>");
		}
		
		
		str.append("</tr>");
		str.append("</table>");
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberSelect.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/memberSelect.css">

<script type="text/javascript">
	function memberDelete(sid, name)
	{
// 		alert("힘수");

		var res = confirm("번호 : " + sid + ", 이름 : " + name + "\n이 회원의 정보를 삭제 하시겠습니까??");
		
		// 테스트 
		// alert(res);
		// -- confirm() 은 true(→ 확인) 또는 false(→ 취소)를 반환한다.
		
		if (res)	// res가 ture 라면... → 사용자가 확인버튼을 클릭 했다면 (삭제 의사)
		{
			// MemberDelete.jsp 페이지를 요청 할 수 있도록 처리
			// 이 과정에서 sid 전달
			window.location.href="MemberDelete.jsp?sid=" + sid;
		}
		
	}

</script>

</head>
<body>

<div>
	<h1>회원 명단 관리 및 출력 페이지</h1>
	<hr>
</div>


<div>
	<a href="MemberScoreSelect.jsp"><button class="btn">회원 성적 관리</button></a>
	<a href="MemberInsertForm.jsp"><button class="btn">신규 회원 등록</button></a>
</div>


<div>
	<!-- 리스트 출력 -->
<!-- 	<table class="table"> -->
<!-- 		<tr> -->
<!-- 			<th class="numTh">번호</th> -->
<!-- 			<th class="nameTh">이름</th> -->
<!-- 			<th class="telTh">전화번호</th> -->
<!-- 			<th style="width: 200px;">회원관리</th> -->
<!-- 		</tr> -->
		
<!-- 		<br><br> -->
		
<!-- 		<tr> -->
<!-- 			<td>1</td> -->
<!-- 			<td>조현하</td> -->
<!-- 			<td>010-1111-1111</td> -->
<!-- 			<td> -->
<!-- 				<a><button type="button" class="btn01">수정</button></a> -->
<!-- 				<a><button type="button" class="btn02">삭제</button></a> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>2</td> -->
<!-- 			<td>임시연</td> -->
<!-- 			<td>010-2222-2222</td> -->
<!-- 			<td> -->
<!-- 				<a><button type="button" class="btn01">수정</button></a> -->
<!-- 				<a><button type="button" class="btn02">삭제</button></a> -->
<!-- 			</td> -->
<!-- 		</tr> -->
	
	
<!-- 	</table> -->

<%=str.toString() %>

	
</div>

</body>
</html>