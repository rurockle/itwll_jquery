<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 세션값 가져오기(계속 값을 유지)
String id=(String)session.getAttribute("id");
// if(세션값이 없으면) loginForm.jsp 이동 
if(id == null){
	response.sendRedirect("loginForm.jsp");
}
%>
<h1>jsp4/main.jsp</h1>
<%=id %>님 로그인 하셨습니다.
<input type="button" value="로그아웃" 
         onclick="location.href='logout.jsp'">
<br>
<a href="info.jsp">회원정보조회</a>
<a href="updateForm.jsp">회원정보수정</a>
<a href="deleteForm.jsp">회원정보삭제</a>
<%
// 회원목록 관리자(admin) 볼수 있게 처리
// if  세션값이 있으면
//    if  세션값이 "admin"같으면  회원목록 
if(id!=null){
	if(id.equals("admin")){
		%><a href="list.jsp">회원목록</a><%
	}
}
%>

</body>
</html>




