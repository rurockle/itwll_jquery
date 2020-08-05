<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/scopeProPro.jsp</h1>
<%
// 변수=request에 저장된 파라미터 "id" 가져오기
String id=request.getParameter("id");
//변수=request에 저장된 파라미터 "pass" 가져오기
String pass=request.getParameter("pass");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext저장된 값:<%=pageContext.getAttribute("page") %><br>
request저장된값:<%=request.getAttribute("req") %><br>
session저장된값:<%=session.getAttribute("ses") %><br>
application저장된값:<%=application.getAttribute("app")%><br>
</body>
</html>




