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
// request에 저장된 쿠키값 여러개 가져오기
Cookie cookies[]=request.getCookies();
// 쿠키값이 없으면
// for  if  쿠키값.이름.equals("clang") 찾기
//        출력  쿠키값.값
// 쿠키값이 없을때 없을때 "korea"기본값 설정
String lang="korea";
if(cookies != null){
	for(int i=0;i < cookies.length;i++){
		if(cookies[i].getName().equals("clang")){
			out.println("쿠키이름 : "+cookies[i].getName());
			out.println("쿠키값 : "+cookies[i].getValue());
			lang=cookies[i].getValue();
		}
	}
}
// lang변수에 저장된 값  "korea"이면     <h1>안녕하세요</h1>
//                         아니면  <h1>Hello</h1>
if(lang.equals("korea")){
	out.println("<h1>안녕하세요</h1>");
	%><h1>안녕하세요</h1><%
}else{
	out.println("<h1>Hello</h1>");
	%><h1>Hello</h1><%
}
%>
<h1>jsp2/cookieMain.jsp</h1>
<form action="cookiePro.jsp" method="post">
<input type="radio" name="lang" value="korea" <%if(lang.equals("korea")){%> checked <%}%>>한국어페이지 보기
<input type="radio" name="lang" value="english" <% if(lang.equals("english")){%> checked <% } %>>영어페이지 보기
<input type="submit" value="언어설정">
</form>
</body>
</html>




