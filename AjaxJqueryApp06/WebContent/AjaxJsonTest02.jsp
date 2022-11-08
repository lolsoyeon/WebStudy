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
<title>AjaxJsonTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
// 			alert("버튼 클릭확인");
		
			var params = "name=" + $("#name").val()
					+ "&content=" + $("#content").val();
			
			$.ajax(
			{
				type : "POST"
				, url : "AjaxJsonTest02ok.jsp"
				, data : params
				, dataType : "json"		// check~~!!!
				, success : function(args)
				{
					var out = "";
					
					//복습 부분 
					for (var idx = 0; idx < args.length; idx++)
					{
						var num = args[idx].num;
						var name = args[idx].name;
						var content = args[idx].content;
						
						out += "<br>================"
						out += "<br>번호 : " + num;
						out += "<br>이름 : " + name;
						out += "<br>내용 : " + content;
						out += "<br>================"
					}
					
					
					$("#resultDiv").html(out);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
					
					
				}
			   , brforeSend : showRequest
			   , error : function(e)
				{
					alert(e.responseText);
				}
				   
				   
			});

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
	      
	      if (!$.trim($("#content").val()))
	      {
	         alert("내용을 입력해야 합니다.");
	         $("#content").focus();
	         return false;
	      }
	      return true;
	   }
	   

</script>

</head>
<body>

<div>
	<h1>jquery의 ajax() 메소드 실습</h1>
	<p>json control</p>
</div>

<div>
	이름 <input type="text" id="name" class="txt" />
	<br>
	
	내용 <textarea rows="3" cols="50" id="content"></textarea>

	<br>

	<input type="button" value="등록하기" id="sendBtn" class="btn"/>

</div>

<div id="resultDiv">

</div>

</body>
</html>