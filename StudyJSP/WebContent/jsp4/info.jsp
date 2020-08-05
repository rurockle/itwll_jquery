<%@page import="java.sql.ResultSet"%>
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
<h1>jsp4/info.jsp</h1>
<%
// String id=(String)세션값 가져오기
String id=(String)session.getAttribute("id");
// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결 => 연결정보 저장
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
//  sql    select  id에 해당하는 회원정보 가져오기
// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
String sql="select * from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
// 4단계 실행 결과 => ResultSet rs  
ResultSet rs=pstmt.executeQuery();
//  if rs에 처음위치에서 다음행으로 이동  데이터가 있으면  True
//  출력 아이디 : 비밀번호 : 이름 : 가입날짜:
	if(rs.next()){
		%>
		아이디 : <%=rs.getString("id") %><br>
		비밀번호 :<%=rs.getString("pass") %><br>
		이름 :<%=rs.getString("name") %><br>
		가입날짜:<%=rs.getTimestamp("reg_date") %><br>
		<%
	}
%>
</body>
</html>




