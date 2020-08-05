<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/scopeForm.jsp</h1>
<%
// 영역                     영역내장객체                   유효범위
// page          pageContext        해당 페이지
// request       request            사용자의 요청이 처리되는 동안
// session       session            사용자가 서버에 연결되어있는 동안
// application   application        웹애플리케이션이 실행되고 있는 동안

// 내장객체 값 저장    내장객체.setAttribute(키이름,값)  
//                      내장객체안에 키이름으로 값저장
// 내장객체 값 가져오기 내장객체.getAttribute(키이름)
//                      내장객체안에 키이름에 해당하는 값 가져오기 

%>
<form action="scopePro.jsp" method="get">
아이디:<input type="text" name="id"><br>
비밀번호:<input type="password" name="pass"><br>
<input type="submit" value="전송">
</form>
</body>
</html>





