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
<h1>jsp4/updatePro.jsp</h1>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");
//id 세션값 가져오기
String id=(String)session.getAttribute("id");
//pass,name 파라미터 값 가져오기
String pass=request.getParameter("pass");
String name=request.getParameter("name");

//1단계 드라이버로더
Class.forName("com.mysql.jdbc.Driver");
//2단계 디비연결 => Connection con
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
//sql    select id에 해당하는 회원정보 가져오기
//3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
String sql="select * from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
//4단계 실행 결과 => ResultSet rs 
ResultSet rs=pstmt.executeQuery();
//5단계 rs에 저장된 데이터 있는 확인 .next() 다음행으로 이동 데이터 있으면 True
//                      // 아이디 있음  //없으면 False //아이디 없음
	// if 폼에서 가져온 비밀번호 디비에서 가져온 비밀번호 비교  .equals()
	//  맞으면 "비밀번호 맞음" 틀리면 "비밀번호 틀림"
	// 비밀번호 맞으면   3단계 수정 sql 4단계 실행 
if(rs.next()){
	out.println("아이디있음");
	// if 폼에서 가져온 비밀번호 디비에서 가져온 비밀번호 비교  .equals()
	//  맞으면 "비밀번호 맞음" 틀리면 "비밀번호 틀림"
	if(pass.equals(rs.getString("pass"))){
		out.println("비밀번호 맞음");
		// 3단계 sql update만들고 실행할수 있는 객체생성
		sql="update member set name=? where id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		// 4단계 실행
		pstmt.executeUpdate();
		// main.jsp 이동
		response.sendRedirect("main.jsp");
	}else{
		out.println("비밀번호 틀림");
		%>
		<script type="text/javascript">
			alert("비밀번호 틀림");
			history.back();
		</script>
		<%
	}
}else{
	out.println("아이디없음");
	%>
	<script type="text/javascript">
		alert("아이디없음");
		history.back();
	</script>
	<%
}	
%>
</body>
</html>