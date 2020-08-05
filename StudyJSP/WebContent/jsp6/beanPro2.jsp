<%@page import="bean.BeanDAO2"%>
<%@page import="bean.BeanTest2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp6/beanPro2.jsp</h1>
<%
//한글 처리
request.setCharacterEncoding("utf-8");
//int  num String  name 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");

// 패키지 bean 파일이름 BeanTest2.java 
// BeanTest2 사용하기위해서 기억장소 할당 => 객체생성  참조변수 bt2
BeanTest2 bt2=new BeanTest2();
// 메서드 호출 setNum() num 값 저장
// 메서드 호출 setName() name 값 저장
bt2.setNum(num);
bt2.setName(name);

// 패키지 bean 파일이름 BeanDAO2.java
// BeanDAO2 사용하기위해서 기억장소 할당 => 객체생성  참조변수 bdao2
BeanDAO2 bdao2=new BeanDAO2();
// 메서드 호출 insertStudent(학생정보를 저장한 주소)
bdao2.insertStudent(bt2);
%>
</body>
</html>