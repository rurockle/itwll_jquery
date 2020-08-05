<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/sessionDel.jsp</h1>
<%
// 세션값 하나만 지우기
session.removeAttribute("ses2");

//이동  "세션값 ses2하나삭제" sessionTest.jsp 이동
%>
<script type="text/javascript">
	alert("세션값 ses2 하나삭제");
	location.href="sessionTest.jsp";
</script>
</body>
</html>





