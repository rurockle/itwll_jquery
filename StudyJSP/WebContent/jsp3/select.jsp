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
<%
// 1단계 드라이버로더
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결 => Connection con
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
// sql    select 모든 학생 가져오기
// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
String sql="select * from student";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 실행 결과 => ResultSet rs  
ResultSet rs=pstmt.executeQuery();
// 5단계 rs 내용을 table태그 출력
%>
<h1>jsp3/select.jsp</h1>
<table border="1">
<tr><td>학생번호</td><td>학생이름</td></tr>
<%
while(rs.next()){
	// rs에 처음위치에서 다음행으로 이동  데이터가 있으면  True
	//출력 <tr><td>1</td><td>김길동</td></tr>
	%>
	<tr><td><%=rs.getInt("num") %></td>
	    <td><%=rs.getString("name") %></td></tr>
	<%
}
%>
</table>
</body>
</html>






