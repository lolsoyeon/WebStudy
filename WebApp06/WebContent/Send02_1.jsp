<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send02_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<!-- ○ 데이터 송수신 관련 실습 02
	 - 이름과 국어점수, 영어점수, 수학점수를 서버로 전송하여
	 	(Send02.jsp)
	 	
	 	총점, 평균에 대한 결과를 받을 수 있는 jsp 페이지를 작성한다. 
	 	
	 	
	 - 페이지 레이아웃
	   -----------------------------------
	   
	   이름		 [        ]
	   국어점수  [        ]
	   영어점수  [        ]
	   수학점수  [        ]

		< 성적 처리 >
		
	   -------------------------------------
	  - 성적 처리 버튼 클릭시
		『엄소연님, 성적 처리가 완료 되었습니다.
		  회원님의 점수는 국어:xx점, 영어:xx점, 수학:xx점 입니다.
		  총점은 xxx점 평균은 xx.x점 입니다』
		  라는 내용을 출력하는 JSP 페이지를 작성한다.
		  (Receive02.jsp)
		  

		  
		 - 사용자의 최초 요청 페이지는 
		 『localhost:8090/WebApp06/Send01.html』로 한다.	 
	 -->
	 

<div>
	<h1>데이터 송수신 관련 실습 02</h1>
	<hr>
</div>

<div>
	<h2>성적 처리 버튼 클릭시 Receive02.jsp 페이지 출력</h2>
	
	<form action="Receive02_1.jsp" method="post">
		이름 <input type="text" name="userName" class="txt"><br>
		국어점수<input type="text" name="userKor" class="txt"><br>
		영어점수<input type="text" name="userEng" class="txt"><br>
		수학점수<input type="text" name="userMat" class="txt"><br>
		<button>성적 처리</button>
	
	</form>

</div>
	
</body>
</html>