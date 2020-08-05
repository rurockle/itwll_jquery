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
<title>회원정보목록</title>
</head>
<body>
	<h1>JSP4_test/info.jsp</h1>

	<%
	//admin 이외에는 list.jsp를 보지 못하게 하는 코드
	String id = (String) session.getAttribute("id");

	//if 세션값이 없으면 loginForm.jsp로 이동
	if (id == null) {
		response.sendRedirect("loginForm.jsp");
	} else {
		//else 있으면 if 세션값이 admin이 아니면 main.jsp
		if (!(id.equals("admin"))) {
			response.sendRedirect("main.jsp");
		} else {
		}
	}

	//1단계 드라이버 불러오기
	Class.forName("com.mysql.jdbc.Driver");

	//2단계 디비연결 => 연결정보 저장

	String url = "jdbc:mysql://localhost:3306/jspdb5";
	String user = "jspid";
	String dbPass = "jsppass";

	Connection con = DriverManager.getConnection(url, user, dbPass);

	//3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체 생성

	String sql = "SELECT * from member";

	PreparedStatement pstmt = con.prepareStatement(sql);

	//4단계 실행 결과 => ResultSet rs
	//if rs에 처음위치에서 다음행으로 이동 데이터가 있으면 true
	//출력아이디: 비밀번호: 이름: 가입날짜
	ResultSet rs = pstmt.executeQuery();
	%>

	<table border="1">

		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>가입날짜</td>
			<td>나이</td>
			<td>성별</td>
			<td>E-mail</td>
		</tr>
		<%
			// if로 바꿔도 상관없음
		while (rs.next()) {
		%><tr>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("pass")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getTimestamp("reg_date")%></td>
			<td><%=rs.getInt("age")%></td>
			<td><%=rs.getString("gender")%></td>
			<td><%=rs.getString("email")%></td>

		</tr>
		<%
			}
		%>
	</table>


</body>
</html>