<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
// 3단계 sql select 게시판 모든 글 가져오기 (num 기준으로 내림차순) 
String sql="select * from board order by num desc";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계  ResultSet rs = 실행 결과 저장
ResultSet rs=pstmt.executeQuery();
%>
<h1>jsp5/list.jsp</h1>
<table border="1">
<tr><td>글번호</td><td>제목</td><td>작성자</td>
    <td>날짜</td><td>조회수</td></tr>
    <%
    // 5단계 while 다음행 이동  num,subject,name,date,readcount 열 가져오기
    while(rs.next()){
    	%>
   <tr><td><%=rs.getInt("num") %></td>
       <td><a href="content.jsp?num=<%=rs.getInt("num")%>"><%=rs.getString("subject") %></a></td>
       <td><%=rs.getString("name") %></td>
       <td><%=rs.getTimestamp("date") %></td>
       <td><%=rs.getInt("readcount") %></td></tr> 
    	<%
    }
    %>
  
</table>
</body>
</html>






