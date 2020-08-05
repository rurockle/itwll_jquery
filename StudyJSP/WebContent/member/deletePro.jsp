<%@page import="member.MemberDAO"%>
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
<title>Insert title here</title>
</head>
<body>
<h1>member/deletePro.jsp</h1>
<%

// id 세션값 가져오기
String id=(String)session.getAttribute("id");
// pass 파라미터 값 가져오기
String pass=request.getParameter("pass");

// MemberDAO mado 객체 생성

MemberDAO mado = new MemberDAO();

int check = mado.userCheck(id, pass);

// 1일때, deleteMember(id) ; 세션값 초기화, main.jsp이동

	if (check == 1) {

		mado.deleteMember(id);
		session.invalidate();%>
		
		<script>
		alert("계정이 삭제되었습니다. 이용해주셔서 감사합니다.");
		location.href="main.jsp";
		</script>
		
	<%} else if (check == 0) {
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




