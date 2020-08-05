<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// if 세션값이 없으면  loginForm.jsp 이동
// else         있으면    if  세션값이 admin 아니면 main.jsp
if(id == null){
	response.sendRedirect("loginForm.jsp");
}else{
	if(!(id.equals("admin"))){
		response.sendRedirect("main.jsp");
	}
}

//1단계 드라이버로더
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결 => Connection con
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
// sql    select 모든 회원정보 가져오기
// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
String sql="select * from member";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 실행 결과 => ResultSet rs
ResultSet rs=pstmt.executeQuery();
// 5단계 rs 내용을 table태그 출력
%>
<h1>jsp4/list.jsp</h1>
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>가입날짜</td></tr>
<%
while(rs.next()){
	%>
<tr><td><%=rs.getString("id") %></td>
    <td><%=rs.getString("pass") %></td>
    <td><%=rs.getString("name") %></td>
    <td><%=rs.getTimestamp("reg_date") %></td></tr>	
	<%
}
%>

</table>
</body>
</html>