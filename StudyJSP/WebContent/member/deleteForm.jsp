<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>member/deleteForm.jsp</h1>
<form action="deletePro.jsp" method="post">
아이디:<input type="text" name="id" value="<%=session.getAttribute("id")%>" readonly><br>
비밀번호:<input type="password" name="pass"><br>
<input type="submit" value="회원삭제">
</form>
</body>
</html>






