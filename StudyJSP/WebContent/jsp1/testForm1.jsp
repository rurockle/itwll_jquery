<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 태그주석 -->
<%--  jsp 주석 --%>
<%
//java한줄주석

/* 
java 
여러줄 주석 
*/
%>
<h1>jsp1/testForm1.jsp</h1>
<form action="testPro1.jsp" method="post">
이름:<input type="text" name="name"><br>
좋아하는 숫자:<input type="text" name="num"><br>
<input type="submit" value="전송">
</form>
</body>
</html>





