<%@page import="member.MemberDTO"%>
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
	<h1>member/updatePro.jsp</h1>
	<%
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		//id 세션값 가져오기
		String id = (String) session.getAttribute("id");
		//pass,name 파라미터 값 가져오기
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");

		// MemberDAO mado 객체 생성 

		MemberDAO mado = new MemberDAO();

		// 
		int check = mado.userCheck(id, pass);

		// MemberBean mb 객체 생성 

		MemberDTO mb = new MemberDTO();

		//멤버변수 <= 파라미터값
		mb.setId(id);
		mb.setName(name);
		mb.setPass(pass);

		// check == 1 => void updateMember(mb) 함수 호출  => main.jsp이동// 

		if (check == 1) {

			mado.updateMember(mb);
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