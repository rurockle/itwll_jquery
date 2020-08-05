<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/sessionTest.jsp</h1>
세션값1:<%=session.getAttribute("ses1") %><br>
세션값2:<%=session.getAttribute("ses2")%><br>
<input type="button" value="세션값 저장" 
       onclick="location.href='sessionSet.jsp'">
<input type="button" value="세션값 하나삭제" 
       onclick="location.href='sessionDel.jsp'">
<input type="button" value="세션값 전체저장" 
       onclick="location.href='sessionInval.jsp'">       
</body>
</html>



