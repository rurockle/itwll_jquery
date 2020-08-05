<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/test3.jsp</h1>
<%
// String str="문자열";
String a=str+100;
out.println(a);
// String str="문자열";
// 함수정의 => 에러 발생
// public void prn(){
// 	System.out.println("출력");
// 	return;
// }
// 함수 호출
prn();
%>
<%!
// 전역변수 :  페이지 전 영역에서 사용하는 변수 설정 
//          페이지 동작할때 맨처음 변수 기억장소 할당
String str="문자열";
// 자바의 함수(메서드) 정의 가능 
public void prn(){
	System.out.println("출력");
	return;
}
%>
</body>
</html>





