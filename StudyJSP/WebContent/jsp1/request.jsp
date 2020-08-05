<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/request.jsp</h1>
서버:<%=request.getServerName() %><br>
서버포트번호:<%=request.getServerPort() %><br>
요청주소:<%=request.getRequestURL() %><br>
요청URI주소:<%=request.getRequestURI() %><br>
프로토콜:<%=request.getProtocol() %><br>
요청방식:<%=request.getMethod() %><br>
사용자IP주소:<%=request.getRemoteAddr() %><br>
서버애플리케이션(컨텍스트)경로:<%=request.getContextPath() %><br>
서버물리적인 경로 :<%=request.getRealPath("/") %><br>
http헤더정보:<%=request.getHeader("accept-language") %><br>
http헤더정보:<%=request.getHeader("user-agent") %><br>
http헤더정보:<%=request.getHeader("connection") %><br>
</body>
</html>






