<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/sessionSet.jsp</h1>
<%
//세션값 저장   setAttribute("ses1","session value1")
//세션값 저장   setAttribute("ses2","session value2")
session.setAttribute("ses1","session value1");
session.setAttribute("ses2","session value2");

//이동  "세션값 생성" sessionTest.jsp 이동
%>
<script type="text/javascript">
	alert("세션값 생성");
	location.href="sessionTest.jsp";
</script>
</body>
</html>



