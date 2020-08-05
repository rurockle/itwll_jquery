<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/session.jsp</h1>
<%
// session :클라이언트와 서버의  연결정보를 서버에 저장 내장객체
//            :페이지 상관없이 연결만 되어있으면 값 유지
// 세션값이 삭제 될때  1. 브라우저 창 모두 닫을때
//               2. 30분이상 작업하지 않았을때
//               3. 로그아웃버튼(세션값 삭제 명령)
%>
세션ID : <%=session.getId() %><br>
세션 생성 시간 : <%=session.getCreationTime() %><br>
세션 마지막 접근 시간 :<%=session.getLastAccessedTime() %><br>
세션 유지 시간: <%=session.getMaxInactiveInterval() %>초(30분)<br>
세션유지시간 3600초 변경:
<%
session.setMaxInactiveInterval(3600);
%><br>
세션 유지 시간 변경: <%=session.getMaxInactiveInterval() %>초<br>
<%
//세션객체 전체 삭제(로그아웃)
session.invalidate();
%>
</body>
</html>






