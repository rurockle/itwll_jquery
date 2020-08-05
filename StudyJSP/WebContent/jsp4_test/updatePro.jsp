<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
</head>
<body>
	<h1>JSP4_test/updatePro.jsp</h1>


	<%
    //한글 인코딩
	request.setCharacterEncoding("utf-8");
	//id는 session 또는 request 모두 가능
	String id = (String) session.getAttribute("id");
	//pass, name은 모두 parameter로 가져와야 함(변경해야 하므로)
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String newPass = request.getParameter("newPass");

	// updateForm에서 새로운 비밀번호(newPass) 입력값이 없을 때, 기존 비밀번호(pass)를 저장 
	System.out.print(newPass);
	if (newPass.equals("")) {

		newPass = pass;
	}


	// parameter는 String형으로 가져오기 때문에, int형으로 바꾸는 작업 필요
	int age = Integer.parseInt(request.getParameter("age"));

	String gender = request.getParameter("gender");

	String email = request.getParameter("email");

	// 1단계: 데이터베이스 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");

	// 2단계: 데이터베이스 연결
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
	String dbName = "jspid";
	String dbPass = "jsppass";

	Connection con = DriverManager.getConnection(dbUrl, dbName, dbPass);

	// 3단계: 연결 정보를 이용해서 sql구문의 '쿼리분석>컴파일>실행'처리를 도와주는 PreparedStatement객체 생성
	// 가져온 id session값이 동일한 데이터베이스를 조회하는 작업 수행
	String sql = "SELECT * FROM member WHERE id = ?";

	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);

	// 4단계: 실행 결과를 ResultSet rs에 저장
	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		//아이디 있는지 확인
		out.print("아이디가 있습니다");
		//있다면 DB 내 저장된  비밀번호와 비교
		if (pass.equals(rs.getString("pass"))) {
			out.print("비밀번호가 맞습니다");

			// '이름, 비밀번호, 나이, 성별, 이메일' update를 위한 sql구문 생성
			String udt = "UPDATE member SET name=?, pass=?, age=?, gender=?, email=? WHERE id=?";
			// sql구문을 분석, 실행할 객체 PreparedStatement구문 작성 
			// 53 줄에서 작성한 pstmt 변수를 그대로 사용해도 되지만 구분을 위해 pstmt2로 새로 작성함
			PreparedStatement pstmt2 = con.prepareStatement(udt);

			pstmt2.setString(1, name);
			pstmt2.setString(2, newPass);
			pstmt2.setInt(3, age);
			pstmt2.setString(4, gender);
			pstmt2.setString(5, email);
			pstmt2.setString(6, id);
			pstmt2.executeUpdate();
	%>
	<script>
		alert("정보가 수정 되었습니다!");
		location.href = "main.jsp";
	</script>
	<%
		} else {
	%>
	<script>
		alert("비밀번호가 틀렸습니다. 다시 입력하세요.");
		history.back();
	</script>

	<%
		}
	} else {
	%>
	<script>
		alert("아이디가 없습니다");
		history.back();
	</script>

	<%
		}
	%>


</body>
</html>