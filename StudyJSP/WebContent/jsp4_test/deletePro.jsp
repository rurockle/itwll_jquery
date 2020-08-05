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
<title>계정 삭제</title>
</head>
<body>
	<h1>jsp4_test/deletePro.jsp</h1>
	<%
		// id 세션값 가져오기
	String id = (String) session.getAttribute("id");

	// pass 파라미터 값 가져오기
	String pass = request.getParameter("pass");

	//1단계 드라이버로더
	Class.forName("com.mysql.jdbc.Driver");

	// 2단계 디비연결 => Connection con
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
	String dbName = "jspid";
	String dbPass = "jsppass";

	Connection con = DriverManager.getConnection(dbUrl, dbName, dbPass);

	// sql    select id에 해당하는 회원정보 가져오기
	String sql = "SELECT * FROM member WHERE id=?";
	// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
	PreparedStatement pstmt = con.prepareStatement(sql);

	// 4단계 실행 결과 => ResultSet rs
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();

	// 5단계 rs에 저장된 데이터 있는 확인 .next() 다음행으로 이동 데이터 있으면 True

	if (rs.next()) {
		//아이디 있는지 확인
		out.print("아이디가 있습니다");
		//있다면 DB의 비밀번호와 비교
		if (pass.equals(rs.getString("pass"))) {
			out.print("비밀번호가 맞습니다");
			//비교해서 맞다면 del sql문 적용 
			String del = "DELETE FROM member WHERE id=?";

			PreparedStatement pstmt2 = con.prepareStatement(del);
			pstmt2.setString(1, id);
			pstmt2.executeUpdate();

			//세션값 초기화
			session.invalidate();
	%>
	<script>
		alert("아이디가 삭제되었습니다. 이용해주셔서 감사합니다.");
		location.href = "main.jsp";
	</script>
	<%
		} else {
	%>
	<script>
		alert("아이디 또는 비밀번호가 틀렸습니다! 다시 입력해주세요");
		history.back();
	</script>
	<%
		}
	}
	%>

</body>
</html>




