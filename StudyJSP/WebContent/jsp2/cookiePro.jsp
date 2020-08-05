<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/cookiePro.jsp</h1>
<%
//변수 = request안에   lang 파라미터 가져오기 
String lang=request.getParameter("lang");
// 쿠키값 생성 "clang",쿠키값변수
Cookie cookie=new Cookie("clang",lang);
// 시간 설정 30분
cookie.setMaxAge(1800); //1800초
// 쿠키 처리결과  클라이언트에 저장
response.addCookie(cookie);
// "언어설정 성공"  cookieMain.jsp이동
%>
<script type="text/javascript">
	alert("<%=lang%>언어설정 성공");
	location.href="cookieMain.jsp";
</script>
</body>
</html>



