<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>JSP4_test/insertPro.jsp</h1>


	<%
	// request int num, String name 가져오기
	// request 한글처리

	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	
	String gender = request.getParameter("gender");
	System.out.println(gender);
	
	// 성별 미입력시 '미입력'으로표기
	if(gender == null){
		gender = "미입력";
	}
	
	String email = request.getParameter("email");

	//java 단에서 시간을 가져오는 구문
	Timestamp reg_date = new Timestamp(System.currentTimeMillis());

	//1 단계 드라이버 불러오기 
	Class.forName("com.mysql.jdbc.Driver");

	//2 단계 디비연결 => 연결정보 저장
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
	String dbUser = "jspid";
	String dbPass = "jsppass";

	//DB연결 정보를 저장하는 역할 DriverManager 드라이버를 관리하는 프로그램
	//String, Class 클래스는 java.lang에 있어서 import가 필요없음
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

	//3 단계 연결정보를 이용해서 SQL구문을 만들고 실행할 객체 생성
	// String sql = "INSERT INTO student(컬럼1, 컬럼2) VALUES(값1, 값2)"
	String sql = "INSERT INTO member(id, pass, name, reg_date, age, gender, email) VALUES(?,?,?,?,?,?,?)";

	//prepareStatement 메서드: 리턴값 = PreparedStatement sql구문을 만들고 실행할 수 있는 객체
	PreparedStatement pstmt = con.prepareStatement(sql);

	// ? 값 넣기

	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	pstmt.setTimestamp(4, reg_date);
	pstmt.setInt(5, age);
	pstmt.setString(6, gender);
	pstmt.setString(7, email);

	//4 단계 객체(SQL구문) 실행 : INSERT / UPDATE / DELETE 
	// SELECT의 경우 pstmt.excuteQuery();
	pstmt.executeUpdate();

	// "회원가입 성공" loginForm.jsp 이동
	%>

	<script type="text/javascript">
		alert("회원가입성공! 로그인 화면으로 이동합니다");
		location.href = "loginForm.jsp";
	</script>

</body>
</html>