<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>board/reWritePro.jsp</h1>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// name pass subject content 파라미터 가져오기
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// int readcount=0 ,  Timestamp date  = 현시스템날짜
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());
// 답글 추가
int num=Integer.parseInt(request.getParameter("num"));
int re_ref=Integer.parseInt(request.getParameter("re_ref"));
int re_lev=Integer.parseInt(request.getParameter("re_lev"));
int re_seq=Integer.parseInt(request.getParameter("re_seq"));

// 패키지 board  파일이름 BoardBean  만들기  멤버변수 set() get()
// BoardBean bb 객체생성
BoardDTO bb=new BoardDTO();
// 멤버변수 <= 파라미커 값 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setReadcount(readcount);
bb.setDate(date);
//답글
bb.setNum(num);
bb.setRe_ref(re_ref);
bb.setRe_lev(re_lev);
bb.setRe_seq(re_seq);

// 패키지 board 파일이름 BoardDAO 만들기
// 리턴값없음 insertBoard(bb) 메서드 만들기
// BoardDAO bdao 객체 생성
BoardDAO bdao=new BoardDAO();
// reInsertBoard(bb) 메서드 호출 
bdao.reInsertBoard(bb);

// list.jsp 글목록 이동
response.sendRedirect("list.jsp");



%>

</body>
</html>






