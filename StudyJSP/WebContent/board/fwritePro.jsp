<%@page import="board.BoardDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
<h1>board/fwritePro.jsp</h1>
<%
// 한글처리
// request.setCharacterEncoding("utf-8");
// 파일업로드  1.파일을 웹서버 폴더에 올리고 파일이름을 디비에 저장
//          2. 파일을 디비에 저장
// 파일업로드 프로그램 설치(API)
// http://www.servlets.com
//  COS File Upload Library
// download  cos-20.08.zip  압축해제  lib  cos.jar
//  WebContent - WEB-INF - cos.jar
// MultipartRequest 파일 객체 생성  파일업로드
// MultipartRequest multi=new MultipartRequest(request,업로드경로,업로드파일크기,한글처리,동일이름변경);
//  업로드경로 웹서버  WebContent - upload 폴더만들기
//  upload 폴더 물리적인 경로 넣기
String uploadPath=request.getRealPath("/upload");
//콘솔창에 물리적 경로 출력
System.out.println(uploadPath);
// 업로드파일크기 10M 
int maxSize = 10*1024*1024;
//  한글 "utf-8"
// 동일이름변경 DefaultFileRenamePolicy()
MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

// p310 name pass subject content 파라미터 가져오기
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
// int readcount=0 ,  Timestamp date  = 현시스템날짜
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());
// file 업로드된 파일 이름 가져오기
String file=multi.getFilesystemName("file");

// 패키지 board  파일이름 BoardBean  만들기  멤버변수 set() get()
// file set() get() 추가
// BoardBean bb 객체생성  
BoardDTO bb=new BoardDTO();
// 멤버변수 <= 파라미커 값 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setReadcount(readcount);
bb.setDate(date);
// file 이름 저장 set메서드호출
bb.setFile(file);

// 패키지 board 파일이름 BoardDAO 만들기
// 리턴값없음 insertBoard(bb) 메서드 만들기
// BoardDAO bdao 객체 생성
BoardDAO bdao=new BoardDAO();
// insertBoard(bb) 메서드 호출 
bdao.insertBoard(bb);

// list.jsp 글목록 이동
response.sendRedirect("list.jsp");



%>

</body>
</html>






