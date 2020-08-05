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
<%
	// 세션값 가져오기
String id = (String)session.getAttribute("id");

// MemberDAO mado 객체 생성
MemberDAO mado = new MemberDAO();


// MemberBean mb = getMember(id) 메서드 호출
MemberDTO mb = mado.getMember(id);
%>
<h1>member/updateForm.jsp</h1>



<form action="updatePro.jsp" method="post">
								<%// id값은 세션값을 그대로 쓰거나, id // getId로 가져오면 됨 %>
아이디:<input type="text" name="id" value=<%=mb.getId() %> readonly><br>
비밀번호:<input type="password" name="pass"><br>
이름:<input type="text" name="name" value="<%=mb.getName()%>"><br>
가입날짜:<input type="text" name="name" value="<%=mb.getReg_date()%>" readonly><br>
<input type="submit" value="회원수정">
</form>


</body>
</html>


