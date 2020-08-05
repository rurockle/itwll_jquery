<%@page import="java.sql.PreparedStatement"%>
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
<h1>jsp3/deletePro.jsp</h1>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// int num , String name <= request 파라미터 가져와서 저장
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 드라이버를 이용해서 디비연결 => Connection con 연결정보 저장
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
//  sql update 테이블이름 set 이름수정 where 조건
// 3단계 연결정보에 prepareStatement(sql) 메서드호출 
//       sql 만들고 실행할수 있는 => PreparedStatement pstmt 생성
String sql="delete from student where num=? and name=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.setString(2, name);
// 4단계 실행
pstmt.executeUpdate();
%>
학생삭제성공<%=pstmt %>
</body>
</html>






