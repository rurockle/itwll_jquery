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
<title>로그인</title>
</head>
<body>
	<h1>jsp4_test/loginPro.jsp</h1>

	<%
	// String id pass 파라미터 가져오기
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String gender = request.getParameter("gender");

	//1단계 드라이버로더
	Class.forName("com.mysql.jdbc.Driver");

	//2 단계 디비연결 => 연결정보 저장
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
	String dbName = "jspid";
	String dbPass = "jsppass";

	Connection con = DriverManager.getConnection(dbUrl, dbName, dbPass);

	//3단계 연결정보를 이용해서 Sql구문 만들고 실행할 객체 생성 PreparedStatement
	//sql  select id에 해당하는 회원정보 가져오기
	//db 단에 id가 존재하는지 확인이 선행
	String sql = "SELECT * FROM member WHERE id=?";

	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setString(1, id);

	//4단계 실행결과 ResultSet rs
	ResultSet rs = pstmt.executeQuery();

	//5단계 rs에 저장된 데이터 있는지 확인 .next()다음행으로 이동

	// 폼아이디,비밀번호 디비에저장된 아이디 비밀번호 일치하면 =>
	// 로그인 인증 => 모든 페이지 상관없이 값이 유지되는 세션값 생성
	// 세션값 생성 "id",id

	if (rs.next()) {
		out.print("아이디가 있습니다");
		//if 폼에서 가져온 비밀번호 디비에서 가져온 비밀번호 비교.equals()
		//rs = 입력된 값  rs.getString("pass(디비에서 가져온 값)")
		if (pass.equals(rs.getString("pass"))) {
			//비밀번호 일치 
			out.println("★★★★★비밀번호 맞음<br>");
			// 세션값 생성: "id"에 id값 부여
			session.setAttribute("id", id); // value는 계속 바뀔 수 있기 때문에 변수 값을 사용
			session.setAttribute("gender", gender);
			// 로그인이 성공하면 'main.jsp'로 이동
			response.sendRedirect("main.jsp");

		} else {
	%>
	<script>
		//보안의 이유로, 아이디나 비밀번호 특정하지 않음
		alert("아이디 또는 비밀번호가 일치하지 않습니다!!");
		history.back();
	</script>
	<%
		}
	} else {
	%>
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다!!");
		history.back();
	</script>

	<%
		}
	%>




</body>
</html>




