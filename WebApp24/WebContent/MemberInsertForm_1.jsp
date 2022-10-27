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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>이름과 전화번호를 입력 해주세요</h1>
	<hr>
</div>



<form action="MemberInsert_1.jsp" method="post">
      <table>
      <c:forEach var="num" begin="1" end="5" step="1">
         <tr>
            <th>이름</th>
            <td>
               <input type="text" class="txt" name="name">
            </td>
         </tr>
         <tr>
            <th>전화번호</th>
            <td>
               <input type="text" class="txt" name="tel">
            </td>
         </tr>
         <tr>
            <th>주소</th>
            <td>
               <input type="text" class="txt" name="addr">
            </td>
         </tr>
      </c:forEach>
         <tr>
            <td colspan="2">
               <button type="submit">정보 입력</button>
            </td>
         </tr>   
      </table>
   </form>



</body>
</html>