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
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// 1단계 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
// 3단계 sql select  id=?
String sql="select * from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
// 4단계 rs=실행 결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 rs.next() 다음행 이동 데이터있으면 
if(rs.next()){
	%>
<h1>jsp4/updateForm.jsp</h1>
<form action="updatePro.jsp" method="post">
아이디:<input type="text" name="id" value=<%=id %> readonly><br>
비밀번호:<input type="password" name="pass"><br>
이름:<input type="text" name="name" value="<%=rs.getString("name")%>"><br>
<input type="submit" value="회원수정">
</form>
	<%
}
%>

</body>
</html>


