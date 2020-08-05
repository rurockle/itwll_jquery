<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/testPro3.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String hobby[]=request.getParameterValues("hobby");
// String hobby[]={"여행","게임","독서"};
String grade=request.getParameter("grade");
String intro=request.getParameter("intro");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
이름 : <%=name %><br>
성별 : <%=gender %><br>
취미 개수:<%//=hobby.length %><br>
취미 :<%=hobby %>,<%//=hobby[0] %>,<%//=hobby[1] %>,<%//=hobby[2] %>
<%
if(hobby != null){
	for(int i=0;i < hobby.length;i++){
		%><%=hobby[i] %><%
	}
}	
%>
<table border="1">
<tr><td>번호</td><td>취미</td></tr>
<%
if(hobby!=null){
	for(int i=0;i<hobby.length;i++){
		%>
		<tr><td><%=i %></td><td><%=hobby[i] %></td></tr>
		<%
	}
}
%>
</table>
<br>
회원등급 : <%=grade %><br>
자기소개 : <%=intro %><br>
</body>
</html>


