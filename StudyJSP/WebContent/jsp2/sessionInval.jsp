<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/sessionInval.jsp</h1>
<%
// 세션 전체 삭제
session.invalidate();
//이동  "세션값 전체삭제" sessionTest.jsp 이동
%>
<script type="text/javascript">
	alert("세션값 전체삭제");
	location.href="sessionTest.jsp";
</script>
</body>
</html>





