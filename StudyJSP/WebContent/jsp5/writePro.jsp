<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp5/writePro.jsp</h1>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// name pass subject content 파라미터 가져오기
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// int readcount=0 ,  Timestamp date  = 현시스템날짜
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());

// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 데이터베이스 연결
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
// num 게시판 글번호 구하기=> 게시판 글번호 중에 가장 큰번호를 구해와서+1
//  select * from board;  Empty set (0.00 sec)
// select num from board;  Empty set (0.00 sec)
// select max(num) from board;  
// max(num) 
// +----------+
// |     NULL
int num=0;
// 3단계 max(num) sql
String sql="select max(num) from board";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 실행
ResultSet rs=pstmt.executeQuery();
// 5단계  첫행(다음행)으로 이동 데이터 있으면  rs에서 max(num) +1 가져와서 num저장
if(rs.next()){
	num=rs.getInt("max(num)")+1;
}
// 3단계 sql insert
sql="insert into board(num,name,pass,subject,content,readcount,date) values(?,?,?,?,?,?,?)";
pstmt=con.prepareStatement(sql);
// ?값 넣기    set형(물음표 순서,값)
pstmt.setInt(1, num);
pstmt.setString(2, name);
pstmt.setString(3, pass);
pstmt.setString(4, subject);
pstmt.setString(5, content);
pstmt.setInt(6, readcount);
pstmt.setTimestamp(7, date);
// 4단계 실행 
pstmt.executeUpdate();
// list.jsp 글목록 이동
response.sendRedirect("list.jsp");
%>

</body>
</html>






