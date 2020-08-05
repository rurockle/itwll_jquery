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
<h1>jsp5/updateForm.jsp</h1>
<%
// int num  num파라미터 가져오기
int num =Integer.parseInt(request.getParameter("num"));
//1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
//2단계 디비연결
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
//3단계 sql select  where num=?
String sql="select * from board where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
//4단계 rs = 실행 결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 rs 다음행으로 이동 name,subject,content
if(rs.next()){
	%>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<table border="1">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=rs.getString("name")%>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=rs.getString("subject")%>"></td></tr>
<tr><td>내용</td>
<td><textarea rows="10" cols="20" name="content"><%=rs.getString("content")%></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
</table>
</form>	
	<%
}
%>

</body>
</html>