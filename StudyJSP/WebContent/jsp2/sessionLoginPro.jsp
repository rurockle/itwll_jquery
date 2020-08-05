<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/sessionLoginPro.jsp</h1>
<%
// request 요청정보 파라미터 "id" "pass" 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
%>
폼에서 가져온 아이디 : <%=id %><br>
폼에서 가져온 비밀번호 : <%=pass %><br>
<%
// 데이터베이스에 저장되어있는 아이디 "admin"  비밀번호 "p123"
String dbId="admin";
String dbPass="p123";
%>
데이터베이스에 저장되어있는 아이디 : <%=dbId %><br>
데이터베이스에 저장되어있는 비밀번호 : <%=dbPass %><br>
<%
// 아이디 비교    폼아이디.equals(디비아이디)
if(id.equals(dbId)){
	out.println("아이디 일치");// 아이디 일치
	if(pass.equals(dbPass)){
		out.println("비밀번호 일치"); // 비밀번호 일치
		// 세션값 생성  "id",id
		session.setAttribute("id", id);
		// sessionMain.jsp 이동
		response.sendRedirect("sessionMain.jsp");
	}else{
		out.println("비밀번호 틀림"); // 비밀번호 틀림
	}
}else{
	out.println("아이디 틀림"); // 아이디 틀림
}
%>
</body>
</html>





