<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<h1>JSP4_test/logOut.jsp</h1>


	<%
		//세션값 전체 삭제
	session.invalidate();
	%>
	<script>
		//로그아웃 메시지 출력 후, main.jsp로 이동
		alert("로그아웃에 성공하셨습니다!!");
		location.href = "main.jsp";
	</script>


</body>
</html>