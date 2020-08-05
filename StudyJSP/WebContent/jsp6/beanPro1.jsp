<%@page import="bean.BeanDAO1"%>
<%@page import="bean.BeanTest1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp6/beanPro1.jsp</h1>
<%
//한글 처리
request.setCharacterEncoding("utf-8");
// name 파라미터 가져오기
String name=request.getParameter("name");
// 자바파일에 전달할 데이터를 하나의 공간에 담아서 하나만 전달 => 자바빈 p245
// 패키지 bean 파일이름 BeanTest1.java 
// BeanTest1 사용하기위해서 기억장소 할당 => 객체생성  참조변수 bt1
BeanTest1 bt1=new BeanTest1();
// 메서드 호출 setName() name 값 저장
// bt1.name=name;  private 데이터 은닉
bt1.setName(name);
out.println("BeanTest1자바빈에 저장된 name값 :"+bt1.getName());

// 디비 1드라이버,2디비연결,3insert ,4실행  name => 자바파일 분리
// 데이터베이스 작업을 하는 자바 파일 
// 패키지 bean 파일이름 BeanDAO1.java
// BeanDAO1 사용하기위해서 기억장소 할당 => 객체생성  참조변수 bdao1
BeanDAO1 bdao1=new BeanDAO1();
// 메서드 호출 insertMember() 
bdao1.insertMember(bt1);
%>
</body>
</html>




