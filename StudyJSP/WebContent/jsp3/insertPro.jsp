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
<h1>jsp3/insertPro.jsp</h1>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// request  int num  ,  String  name 가져오기
String snum=request.getParameter("num");
int num=Integer.parseInt(snum);
String name=request.getParameter("name");
out.println(num) ;
out.println(name) ;

// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결 => 연결정보 저장
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);

// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성
// String sql="insert into student(num,name) values(2,'홍길동')";
// String sql="insert into student(num,name) values("+num+",'"+name+"')";
String sql="insert into student(num,name) values(?,?)";
PreparedStatement pstmt=con.prepareStatement(sql);
// ?값 넣기    set형(물음표 순서,값)
pstmt.setInt(1, num);
pstmt.setString(2, name);
		
// 4단계 객체(sql구문) 실행 insert,update,delete
pstmt.executeUpdate();
%>
학생등록성공<%=pstmt %>
</body>
</html>





