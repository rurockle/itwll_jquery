<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
rdBean"%>
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
<h1>board/updatePro.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//int num, String name pass subject content 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

// BoardBean bb 객체생성<= 파라미터값 
BoardDTO bb=new BoardDTO();
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);

// BoardDAO bdao
BoardDAO bdao=new BoardDAO();
// int check  = numCheck(bb)
int check=bdao.numCheck(bb);
// check==1  updateBoard(bb)  list.jsp 이동
// check==0  "비밀번호틀림" 뒤로이동
// check==-1  "num없음" 뒤로이동
if(check==1){
	// updateBoard(bb)
	bdao.updateBoard(bb);
	// list.jsp 이동
	response.sendRedirect("list.jsp");
}else if(check==0){
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("num 없음");
		history.back();
	</script>
	<%
}

%>
</body>
</html>


