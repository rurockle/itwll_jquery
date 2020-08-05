<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/application.jsp</h1>
<%
// application내장객체 - 웹컨테이너 제공하는 객체 
//                     웹애플리케이션 서버의 정보,자원을 저장
//                    웹 애플리케이션 서버 하나 객체 생성
//                    웹애플리케이션 서버 자원하나 공유(방문자수,통계..)
//                    서버 start 생성 , 서버 stop 사라짐 
%>
서버정보 : <%=application.getServerInfo() %><br>
파일타입정보 : <%=application.getMimeType("test1.html") %><br>
<%
// 첨부파일 타입형식 
// getServletContext().getMimeType(sFilePath);
%>
물리적인 경로: <%=application.getRealPath("/") %><br>
<%
// p192 pageContext : 현페이지 정보 저장하는 내장객체
//                  : 페이지가 바뀌면  저장되는 값도 변경
%>
현페이지 세션값 :<%=pageContext.getSession() %><br>
현페이지 ServletContext :<%=pageContext.getServletContext() %><br>
<%
//p201 out 내장객체 : 출력정보를 저장하고 출력하는 내장객체
out.println("출력내장객체");
%>
출력 버퍼(기억장소) 크기 : <%=out.getBufferSize() %> 바이트<br>
사용하고 남은 기억장소 크기 : <%=out.getRemaining() %> 바이트<br>
<%
// 출력기억장소를 닫기
out.close();
out.println("다시출력");
// config 설정내장객체 , page, exception 내장객체
%>
</body>
</html>







