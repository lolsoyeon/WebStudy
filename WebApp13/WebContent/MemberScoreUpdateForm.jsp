<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(MemberScoreSelect.jsp)로부터 데이터 수신
	//-- sid
	request.setCharacterEncoding("UTF-8");
	
	String sid = request.getParameter("sid");
	String name = "";
	int kor = 0;
	int eng = 0;
	int mat = 0;
	
	// sid를 제외한 나머지 속성값들을 조회하기 위해 dao 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		// 이전 페이지로 부터 수신한 sid 를통해 name 얻어내기
		MemberScoreDTO score = dao.search(sid);
		name = score.getName();
		kor = score.getKor();
		eng = score.getEng();
		mat = score.getMat();
		
	}
	catch(Exception e)
	{
		System.out.print(e.toString());
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
<title>MemberScoreInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/memberSelect.css">

<script type="text/javascript">

	function memberScoreSubmit()
	{
		// alert("함수 호출 확인~!!");
		
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
	
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		// Number(kor.value>100
		if (kor.value=="" || isNaN(kor.value) || Number(kor.value)<0 || Number(kor.value)>100)
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
			// → 뜻은 종료
		}
		
		if (eng.value=="" || isNaN(eng.value) || Number(eng.value)<0 || Number(eng.value)>100)
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		
		if (mat.value=="" || isNaN(mat.value) || Number(mat.value)<0 || Number(mat.value)>100)
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		// 최종적으로  form 을 직접 지정하여 submit 액션 수행
		memberScoreForm.submit();
		
	}
	
	function memberScoreReset()
	{
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		// var eng = document.getElementById("eng");
		// var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		// form 을 직접 지정하여  reset(); 액션 수행
		memberScoreForm.reset();
		
		// reset(); 되면 span 이 사라져야한다.
		// 이름에 포커스가 들어온다.
		kor .focus();
		// eng .focus();
		// mat .focus();
		
	}
	

</script>


</head>
<body>

<div>
	<h1>회원 성적 관리 및 입력 페이지</h1>
	<hr>
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button" class="btn">회원 성적 관리</button></a>
</div>
<br>

<div>
	<!-- 회원 성적 데이터 입력 폼 구성 -->
	<form action="MemberScoreUpdate.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
		<table class="table">
			<tr>
				<th>번호</th>
				<td>
			<!-- 1 -->
				<%=sid %>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
			<!-- 민찬우 -->
				<%=name %>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txtScore" value="<%=kor%>">
				</td>
				<td>
					<span class="errMsg" id="korMsg">
						0 ~ 100 사이의 국어 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txtScore" value="<%=eng%>">
				</td>
				<td>
					<span class="errMsg" id="engMsg">
						0 ~ 100 사이의 영어 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txtScore" value="<%=mat%>">
				</td>
				<td>
					<span class="errMsg" id="matMsg">
						0 ~ 100 사이의 수학 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
			
		</table>
		<br><br>
		
		<a href="javascript:memberScoreSubmit()"><button type="button">수정하기</button></a>
		<a href="javascript:memberScoreReset()"><button type="button">원래대로</button></a>
		<a href="MemberScoreSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>



</body>
</html>