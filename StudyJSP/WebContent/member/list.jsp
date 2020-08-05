<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
String id=(String)session.getAttribute("id");
// if 세션값이 없으면  loginForm.jsp 이동
// else         있으면    if  세션값이 admin 아니면 main.jsp
if(id == null){
	response.sendRedirect("loginForm.jsp");
}else{
	if(!(id.equals("admin"))){
		response.sendRedirect("main.jsp");
	}
}
// MemberDAO mdao 객체 생성
MemberDAO mdao=new MemberDAO();
// List  memberList    = getMemberList() 메서드 정의하고 호출
List memberList=mdao.getMemberList();
%>
<h1>member/list.jsp</h1>
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>가입날짜</td></tr>
<%
	for(int i=0;i<memberList.size();i++){
	 MemberDTO mb=(MemberDTO)memberList.get(i);
%>
<tr><td><%=mb.getId() %></td>
    <td><%=mb.getPass() %></td>
    <td><%=mb.getName() %></td>
    <td><%=mb.getReg_date() %></td></tr>	
	<%
}
%>

</table>
</body>
</html>