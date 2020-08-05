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
// 세션:연결정보를 저장하는 내장객체
//    : 페이지 상관없이 값을 서버에서 저장 유지
//    : 보안상 중요한 데이터 저장 유지 , 로그인 인증
// 쿠키 : 페이지 상관없이 값을 사용자 컴퓨터에 저장 유지 
//     : 서버에 부하를 줄이고자 사용, 보안상 중요하지 않은 데이터 저장

// 쿠키값  클라이언트 -> 서버 요청 가져옴 => 서버에 요청정보 저장 request
Cookie cookies[]=request.getCookies();
// 여러개 쿠키값 중에 "cook"이름을 가진 쿠키값 찾기
// 쿠키값이 있으면
if(cookies != null){
	for(int i=0;i < cookies.length;i++){
		if(cookies[i].getName().equals("cook")){
			out.println(i);
			out.println("쿠키이름 : "+cookies[i].getName());
			out.println("쿠키값 : "+cookies[i].getValue());
		}
	}
}
%>
<h1>jsp2/cookieTest.jsp</h1>
<input type="button" value="쿠키값 저장" 
       onclick="location.href='cookieSet.jsp'">
<input type="button" value="쿠키값 하나삭제" 
       onclick="location.href='cookieDel.jsp'">
</body>
</html>









