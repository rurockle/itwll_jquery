<%@page import="member.MemberDAO"%>
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
	<h1>member/loginPro.jsp</h1>
	<%
		// 아이디 패스워드 비교를 위한 신호값 정하기 
	// 1 아이디 비밀번호 일치 / 0 비밀번호 틀림 / -1 아이디가 없을 때
	int check = -1;

	// String id pass 파라미터 가져오기
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	// MemberDAO mado 객체 생성
	// int check = userCheck(id, pass) 함수 만들고 호출 

	MemberDAO mado = new MemberDAO();

	check = mado.userCheck(id, pass);

	
	if (check == 1) {
		session.setAttribute("id", id);
		// main.jsp 이동
		response.sendRedirect("main.jsp");
	} else if (check == 0) {
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림"); //0
		history.back();
	</script>
	<%
		} else {
	%>
	//check=-1;
	<script type="text/javascript">
		alert("아이디없음"); //-1
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>




