<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/scopePro.jsp</h1>
<%
// 변수=request에 저장된 파라미터 "id" 가져오기
String id=request.getParameter("id");
//변수=request에 저장된 파라미터 "pass" 가져오기
String pass=request.getParameter("pass");
// 내장객체 값 저장
// 해당 페이지 값저장
pageContext.setAttribute("page", "pageContext value");
// 사용자의 요청 값저장
request.setAttribute("req", "request value");
// 연결정보를 저장하는 session기억장소에 값저장
session.setAttribute("ses", "session value");
// 웹애플리케이션이 실행되고 있는 동안(웹서버 start되는 동안) 값 저장
application.setAttribute("app", "application value");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext저장된 값:<%=pageContext.getAttribute("page") %><br>
request저장된값:<%=request.getAttribute("req") %><br>
session저장된값:<%=session.getAttribute("ses") %><br>
application저장된값:<%=application.getAttribute("app")%><br>
<!-- http://localhost:8080/StudyJSP/jsp1/scopePro.jsp?id=kim -->
<a href="scopeProPro.jsp?id=<%=id%>&pass=<%=pass%>">scopeProPro.jsp 이동</a>
<script type="text/javascript">
// 	alert("scopeProPro.jsp이동");
<%-- 	location.href="scopeProPro.jsp?id=<%=id%>&pass=<%=pass%>"; --%>
</script>
<%
// response.sendRedirect("scopeProPro.jsp?id="+id+"&pass="+pass);

// 액션태그 : 태그처럼 사용할수 있는 jsp문법
// forward액션태그  : 페이지 이동 
//                 1. Pro.jsp 에서 ProPro.jsp 이동 
//                    주소줄에 Pro.jsp  실행화면 ProPro.jsp
//                 2. Pro.jsp에 있는 request값을 모두들고  ProPro.jsp감
%>
<%-- <jsp:forward page="scopeProPro.jsp"/> --%>
</body>
</html>



