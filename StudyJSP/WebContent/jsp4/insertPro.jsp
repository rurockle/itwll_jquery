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
<h1>jsp4/insertPro.jsp</h1>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");
// request   String  id, pass, name 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
Timestamp reg_date=new Timestamp(System.currentTimeMillis());

// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결 => 연결정보 저장
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 insert
String sql="insert into member(id,pass,name,reg_date) values(?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(sql);
// ?값 넣기    set형(물음표 순서,값)
pstmt.setString(1, id);
pstmt.setString(2, pass);
pstmt.setString(3, name);
pstmt.setTimestamp(4, reg_date);
// 4단계 객체(sql구문) 실행 insert
pstmt.executeUpdate();
// "회원가입성공"  loginForm.jsp 이동
%>
<script type="text/javascript">
	alert("회원가입성공");
	location.href="loginForm.jsp";
</script>
</body>
</html>





