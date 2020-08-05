<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
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
<h1>board/content.jsp</h1>
<%
// int num = num파라미터 가져오기
int num =Integer.parseInt(request.getParameter("num"));
// BoardDAO bdao 객체 생성
BoardDAO bdao=new BoardDAO();

// 리턴값없음 updateReadcount(num) 메서드 만들고 호출
bdao.updateReadcount(num);
// BoardBean bb   = getBoard(num) 메서드 만들고 호출
BoardDTO bb=bdao.getBoard(num);
%>
	<table border="1">
<tr><td>글번호</td><td><%=bb.getNum() %></td>
    <td>조회수</td><td><%=bb.getReadcount() %></td></tr>
<tr><td>글쓴이</td><td><%=bb.getName() %></td>
    <td>작성일</td><td><%=bb.getDate() %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
<tr><td>파일</td>
    <td colspan="3"><a href="../upload/<%=bb.getFile() %>"><%=bb.getFile() %></a>
    <img src="../upload/<%=bb.getFile() %>" width="100" height="100"/>
    </td></tr>
<tr><td>글내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
<tr><td colspan="4">
<input type="button" value="글수정" 
onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
<input type="button" value="글삭제" 
onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'">
<input type="button" value="답글쓰기"                        
onclick="location.href='reWriteForm.jsp?num=<%=bb.getNum()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'"> 
                                                           
<input type="button" value="글목록" 
onclick="location.href='list.jsp'"></td></tr>
</table>
</body>
</html>





