<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function sendIt()
	{
		// alert("함수 호출확인~!");
		
		var f = document.forms[0];
		
		// alert(f.name.value);
		//-->> 아무것도 없음

		
		/*
		 var male = document.getElementById(male);
		 var female = document.getElementById(female);
		 
		 var div02 = document.getElementById(div02);
		 var div01 = document.getElementById(div01);

		 
		 if (!male.value)
		 {
			 div01.style.display = "inline";
			 return;
		 }
		 if (!female.value)
		 {
			 div02.style.display = "inline";
			 return;
		 }
		 */
		 f.submit();
	}
	
	function checkGender(obj)
	{
		// var gender = docuemnt.getElementById("gender");
		// 이 구문을 넣으면 실행이 안된다.
		
// 		alert(obj);
		//--==>> [object HTMLInputElement]
// 		alert(obj.form);
		//--==>> [object HTMLFormElement]
// 		alert(obj.value);
		//--==>> 남성 || 여성
		
		var div01 = document.getElementById("div01");
		var div02 = document.getElementById("div02");
		
		
		div01.style.display = "none";
		div02.style.display = "none";
		
		if (obj.value == "남성")
		{
			div01.style.display = "inline";
		}
		else 
		{
			div02.style.display = "inline";
		}
		
		
	}


</script>


<style type="text/css">
	#div01 {display: none;}   
	#div02 {display: none;}
</style>

</head>
<body>

<div>
	<h1>JSP 액션 태그 실습</h1>
</div>

<div>
	<p>데이터 등록</p>
	
	<form action="Friend_ok_1.jsp" method="get" name="myForm">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" class="txt" name="name"> 
				</td>
			</tr>
			
			<tr>
				<th>나이</th>
				<td>
					<input type="text" class="txt" name="age"> 
				</td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" name="gender" id="male" value="남성" onclick="checkGender(this)">
						남자 
					</label>
					<label>
						<input type="radio" name="gender" id="female" value="여성" onclick="checkGender(this)">
						여자 
					</label>
				</td>
			</tr>
			
			<tr>
				<th>친구이상형</th>
				<td>
					
					<div id="div01">
						<label>
							<input type="checkbox" name="idelType" id="idelType1" value="아이유">
							아이유
						</label>
						<label>
							<input type="checkbox" name="idelType" id="idelType2" value="카리나">
							카리나
						</label>
						<label>
							<input type="checkbox" name="idelType" id="idelType3" value="전효성">
							전효성
						</label>
					</div>
					
					
					<div id="div02">
						<label>
							<input type="checkbox" name="idelType" id="idelType4" value="손석구">
							손석구
						</label>
						<label>
							<input type="checkbox" name="idelType" id="idelType5" value="김영광">
							김영광
						</label>
						<label>
							<input type="checkbox" name="idelType" id="idelType6" value="김석진">
							김석진
						</label>
					</div>
					
					
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn"
					style="width: 100%; font-size: 16pt;" >등록</button>
				</td>
			</tr>
		</table>
	</form>
</div>



</body>
</html>