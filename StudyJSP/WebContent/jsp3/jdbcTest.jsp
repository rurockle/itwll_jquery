<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp3/jdbcTest.jsp</h1>
<%
// JDBC(Java DataBase Connectivity) 프로그램 설치
// WebContent - WEB-INF - lib - mysql-connector-java-5.1.49.jar
// 1단계 JDBC프로그램안에 Driver프로그램 가져오기
//  \com\mysql\jdbc\Driver.class
// String,Class  java.lang기본위치
Class.forName("com.mysql.jdbc.Driver");
// import="java.sql.DriverManager"
// 디비접속주소, 디비접속아이디, 디비접속비밀번호
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="root";
String dbPass="1234";
// 2단계 Driver프로그램을 이용해서 디비연결(디비주소,디비접속아이디,디비접속비밀번호) => 디비연결정보 저장
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
%>
<%="연결성공" %>
</body>
</html>



