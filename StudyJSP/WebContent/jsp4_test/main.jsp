<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	<%
	// 세션값 가져오기 //session값은 String타입으로 다운 클래스가 필요
	String id = (String) session.getAttribute("id");
	// if(세션값이 없으면) loginForm.jsp 이동 
	if (id == null) {
		response.sendRedirect("loginForm.jsp");
	}
	%>
	<h1>jsp4_test/main.jsp</h1>
	<%=id%>님 로그인 하셨습니다.
	<input type="button" value="로그아웃" onclick="location.href='logOut.jsp'">
	<br>
	<a href="info.jsp">회원정보조회</a>
	<a href="updateForm.jsp">회원정보수정</a>
	<a href="deleteForm.jsp">회원정보삭제</a>

	<%
		// 관리자(admin)계정이 아닐 시 <회원목록> 페이지는 노출되지 않게 지정
	if (id != null) {
		if (id.equals("admin")) {
	%><a href="list.jsp">회원목록</a>
	<%
		}
	}
	%>

</body>
</html>




