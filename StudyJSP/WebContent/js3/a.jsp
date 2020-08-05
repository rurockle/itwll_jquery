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
// http가 요청한정보를 들고 와서 서버에 내장객체인 request에 저장
// request.함수()    request.getParameter("태그이름,파라미터이름")
//                request에 저장된 태그이름에 해당하는 value 가져오는 함수
%>
<h1>js3/a.jsp</h1>
아이디 : <%=request.getParameter("id") %><br>
비밀번호 : <%=request.getParameter("pass") %><br>
이름 : <%=request.getParameter("name") %><br>
성별 : <%=request.getParameter("gender") %><br>
취미 : <%=request.getParameter("hobby") %><br>
회원등급 : <%=request.getParameter("grade") %><br>
자기소개 : <%=request.getParameter("intro") %><br>
</body>
</html>




