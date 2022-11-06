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
<title>AjaxXmlTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

$(function()
		{
			$("#sendBtn").click(function()
			{
				//alert("버튼 클릭 확인~!!!");
				
				var params = "name=" + $("#name").val() + "&content=" + $("#content").val();
				
				$.ajax(
				{
					type : "POST"
					, url : "AjaxJsonTest01ok.jsp"
					, data : params
					, dataType : "json"		//-- check~!!!
					, success : function(args)
					{
						var out = "";
						
						var num = args.num;
						var name = args.name;
						var content = args.content;
						
						out += "<br>============================";
						out += "<br>번호 : " + num;
						out += "<br>이름 : " + name;
						out += "<br>내용 : " + content;
						out += "<br>============================";
						
						$("#resultDiv").html(out);
						
						$("#name").val("");
						$("#content").val("");
						$("#name").focus();
					}
					, beforeSend : showRequest
					, error : function(e)
					{
						alert(e.responseText);
					}
					
				});
			});	
		});
	
	function showRequest()
	   {
	      if (!$.trim($("#title").val()))
	      {
	         alert("제목을 입력해야 합니다.");
	         $("#title").focus();
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
	<h1>jquery 의 ajax() 관련 실습</h1>
	<p>xml control</p>
	<hr />
</div>

<div>
	제목 <input type="text" id="title" class="txt" />
	<br>
	
	내용 <input type="text" id="content" class="txt" />
	<br>
	<input type="button" id="sendBtn" value="전송확인" />
</div>
<br><br>

<div id="resultDiv">

</div>

</body>
</html>