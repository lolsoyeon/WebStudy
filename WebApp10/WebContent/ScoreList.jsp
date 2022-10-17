<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 결과값으로 처리할 변수
	String str = "";
	
	// 데이터 베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 slelect 쿼리문
	String sql = "SELECT SID, NAME, KOR, ENG, MAT,"
	+ " (KOR+ENG+MAT) AS 총점, (KOR+ENG+MAT)/3 AS 평균 FROM TBL_SCORE ORDER BY 1";
	
	// 작업 객체 생성 및 준비된 쿼리문 수행
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	str += "<table class='table'>";
	str += "<tr>";
	str += "<th class='numSid'>번호</th>   ";
	str += "<th class='numName'>이름</th>  ";
	str += "<th class='numKor'>국어점수</th> ";
	str += "<th class='numEng'>영어점수</th> ";
	str += "<th class='numMat'>수학점수</th> ";
	str += "<th class='numTot'>총점</th>   ";
	str += "<th class='numAvg'>평균</th>   ";
	str += "</tr>";
	
	
	// ResultSet 처리 반복문 구성
	while (rs.next())
	{
		str += "<tr>";
		str += "<td>" + rs.getInt("SID")  + "</td>";
		str += "<td>" + rs.getString("NAME")  + "</td>";
		str += "<td>" + rs.getInt("KOR")  + "</td>";
		str += "<td>" + rs.getInt("ENG")  + "</td>";
		str += "<td>" + rs.getInt("MAT")  + "</td>";
		str += "<td>" + rs.getInt("총점")  + "</td>";
		str += "<td>" + rs.getDouble("평균")  + "</td>";
		str += "</tr>";
	}
	
	str += "</table>";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	.errorMsg {color: red; display: none;}
	
</style>

<script type="text/javascript">

	function formCheck()
	{
		
		// 받은데이터
		var name = document.getElementById("name");
		var vName = document.getElementById("nameID");
		
		var korStr = document.getElementById("kor");
		var vKor = document.getElementById("korID");
		
		var engStr = document.getElementById("eng");
		var vEng = document.getElementById("engID");
		
		var matStr = document.getElementById("mat");
		var vMat = document.getElementById("matID");
		
		var kor = Integer.parseInt(korStr.value);
		var eng = Integer.parseInt(engStr.value);
		var mat = Integer.parseInt(matStr.value);

		nameID.style.display = "none";
		vKor.style.display = "none";
		vEng.style.display = "none";
		vMat.style.display = "none";
		
		if (name.value == "")
		{
			nameID.style.display = "inline";
			// 다음 페이지(ScoreInsert.jsp로 못가게)
			return false;
		}
		
		// 국영수 점수
		if (korStr.value == "" ||kor<0 || kor>100)
		{
			vKor.style.display = "inline";
			return false;
		}
		if (engStr.value == ""||eng<0 || eng>100)
		{
			vEng.style.display = "inline";
			return false;
		}
		if (matStr.value == ""||mat<0 || mat>100)
		{
			vMat.style.display = "inline";
			return false;
		}
		
		
		return true;
	}

</script>

</head>
<body>

<div>
	<form action="ScoreInsert.jsp" method="get" onsubmit="return formCheck()" >
	<div>
	== 성적 처리 ==
	<br>
	이름(*) <input type="text" id="name" name="userName">
			<span class="errorMsg" id="nameID">이름 입력은 필수입니다.</span>
	</div>
	
	<div>
		국어점수 <input type="text" id="kor" name="userKor">
		<span class="errorMsg" id="korID">0 ~ 100 사이만 입력 가능합니다.</span>
	</div>
	
	<div>
		영어점수 <input type="text" id="eng" name="userEng">
		<span class="errorMsg" id="engID">0 ~ 100 사이만 입력 가능합니다.</span>
	</div>
	
	<div>
		수학점수 <input type="text" id="mat" name="userMat">
		<span class="errorMsg" id="matID">0 ~ 100 사이만 입력 가능합니다.</span>
	</div>
	
	<div>
	<button type="submit" class="btn">성적 데이터 등록</button>
	</div>
</div>

<div>
<!-- 데이터가 출력 될 장소 -->

<!-- 
<table class="table">
		<tr>
			<th class="numSid">번호</th>
			<th class="numName">이름</th>
			<th class="numKor">국어점수</th>
			<th class="numEng">영어점수</th>
			<th class="numMat">수학점수</th>
			<th class="numTot">총점</th>
			<th class="numAvg">평균</th>
		</tr>
	
		<tr>
			<td>1</td>
			<td>박원석</td>
			<td>90</td>
			<td>90</td>
			<td>90</td>
			<td>270</td>
			<td>90</td>
		</tr>
	-->	
	<%=str %>
	
	
	</table>

	</form>
</div>



</body>
</html>