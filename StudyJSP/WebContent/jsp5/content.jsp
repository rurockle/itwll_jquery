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
<h1>jsp5/content.jsp</h1>
<%
// int num = num파라미터 가져오기
int num =Integer.parseInt(request.getParameter("num"));
// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);

// 3단계 조회수 +1증가 update readcount= readcount+1 조건
String sql="update board set readcount=readcount+1 where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
// 4단계 실행
pstmt.executeUpdate();

// 3단계 sql select  where num=?
sql="select * from board where num=?";
pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
// 4단계 rs = 실행 결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 rs 다음행 이동  num readcount name date subject content
if(rs.next()){
%>
	<table border="1">
<tr><td>글번호</td><td><%=rs.getInt("num") %></td>
    <td>조회수</td><td><%=rs.getInt("readcount") %></td></tr>
<tr><td>글쓴이</td><td><%=rs.getString("name") %></td>
    <td>작성일</td><td><%=rs.getTimestamp("date") %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=rs.getString("subject") %></td></tr>
<tr><td>글내용</td><td colspan="3"><%=rs.getString("content") %></td></tr>
<tr><td colspan="4">
<input type="button" value="글수정" 
onclick="location.href='updateForm.jsp?num=<%=rs.getInt("num")%>'">
<input type="button" value="글삭제" 
onclick="location.href='deleteForm.jsp?num=<%=rs.getInt("num")%>'">
<input type="button" value="글목록" 
onclick="location.href='list.jsp'"></td></tr>
</table>
	<%
}
%>

</body>
</html>





