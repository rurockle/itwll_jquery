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
// 폼에서 post방식으로 전송하면  request정보를 사용하기 전에 한글처리
request.setCharacterEncoding("utf-8");
// java,jsp 명령 
// http가 폼에 있는 요청내용을 들고오면 - 웹서버 - 
// 웹애플리케이션서버 - request,response 생성 - request 요청정보 저장
// request내장객체.함수()    request.getParameter("파라미터이름")
//  변수 = request.getParameter("파라미터이름")
String sname=request.getParameter("name");
// int num=request.getParameter("num");
// request에서 가져온 값은 String 문자열 
String snum=request.getParameter("num");
%>
<h1>jsp1/testPro1.jsp</h1>
이름:<%=sname %><br>
좋아하는 숫자:<%=snum %><br>
좋아하는 숫자+100 : <%=snum+100 %><br>
좋아하는 숫자(문자)를 정수형으로 변경해서 +100 : <%=Integer.parseInt(snum)+100 %><br>
</body>
</html>




