<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoadingTest020.jsp</title>
<style type="text/css">
	.txt
	{
		width: 100px;
	}

	.btn 
	{
	    position: relative;
	    border: none;
	    min-width: 200px;
	    min-height: 50px;
	    background: linear-gradient(
	        90deg,
	        rgba(129, 230, 217, 1) 0%,
	        rgba(79, 209, 197, 1) 100%
	    );
	    border-radius: 1000px;
	    color: darkslategray;
	    cursor: pointer;
	    box-shadow: 12px 12px 24px rgba(79, 209, 197, 0.64);
	    font-weight: 700;
	    transition: 0.3s;
	}

	.btn:hover 
	{
    	transform: scale(1.2);
	}

	.btn:hover::after 
	{
	    content: "";
	    width: 30px;
	    height: 30px;
	    border-radius: 100%;
	    border: 6px solid #00ffcb;
	    position: absolute;
	    z-index: -1;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    animation: ring 1.5s infinite;
	}
</style>

<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
// 			alert("dsd");
			
			var params = "name=" + $("#name").val() + "&pre=" + $("#pre").val() 
			+ "&telM=" + $("#telM").val() + "&telL=" + $("#telL").val() +"&city=" + $("#city").val();
			
// 				alert(params);
			
			$.ajax(
			{
				type : "POST"
				, url : "LoadingTest20ok.jsp"
				, data : params
				, datatype : "json"
				, success : function(args)
				{
					var out = "";
					
					for (var idx=0; idx < args.length; idx++)
					{
						
						var name = args[idx].name;
						var pre = args[idx].pre;
						var telM = args[idx].telM;
						var telL = args[idx].telL;
						var city = args[idx].city;
						
// 						alert(name);
						
						out += "<br>이름 : " + name;
						out += "<br>전화번호 : "+ pre + telM + telL;
						out += "<br>지역 : " + city;
						
					}
					
					$("#resultDiv").html(out);
					
					$("#name").val("");
					$("#pre").val("");
					$("#telM").val("");
					$("#telL").val("");
					$("#city").val("");
					$("#name").focus();
					
				}
				, beforeSend : showRequest
				, error : function(e)
				{
					alert(e.responseText);
				}
			});
		});
		
		$(document).ajaxStart(function()
		{
			// AJAX 시작시..
			$("#resultDiv").hide();
			$("#loading").show();
			
			
		}).ajaxComplete(function()
		{	
			// AJAX 종료시...
			$("#resultDiv").show();
			$("#loading").hide();
			
		});
		
	});
	
	function showRequest()
   {
      if (!$.trim($("#name").val()))
      {
         alert("이름을 입력해야 합니다.");
         $("#name").focus();
         return false;
      }
      
      if (!$.trim($("#telM").val()))
      {
         alert("전화번호 중간자리를 입력해야 합니다.");
         $("#content").focus();
         return false;
      }
      
      if (!$.trim($("#telL").val()))
      {
         alert("전화번호 마지막자리를 입력해야 합니다.");
         $("#content").focus();
         return false;
      }
      return true;
   }
   
	
	
</script>

</head>
<body>

<!-- 이름, 전화번호,              지역 -->
<!-- []    [010▼]-[   ]-[   ]  [    ▼]    -->

<div>
<form action="" id="">
	이름 <input type="text" id="name" class="txt" /><br>
	<label>
	전화 번호 
	<select id="pre">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="018">018</option>
		<option value="019">019</option>
	</select>
	</label>
	- <input type="text" id="telM" class="txt" />
	- <input type="text" id="telL" class="txt" />
	<select id="city">
		<option value="seoul">서울</option>
		<option value="ulsan">울산</option>
		<option value="busan">부산</option>
		<option value="deagu">대구</option>
		<option value="tokoy">도쿄</option>
	</select>
	<br><br>
	<input type="button" value="확인" id="sendBtn" class="btn" />
	
</form>

<div id="loading" style="text-align: center; display: none;">
	<img alt="loading" src="images/loading18.gif" style="text-align: center;">
</div>

</div>

<div id="resultDiv">

</div>


</body>
</html>