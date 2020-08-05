<%@page import="member.MemberDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>member/insertPro.jsp</h1>

<%
	request.setCharacterEncoding("utf-8");

// id, pass, name 파라미터 가져오기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
Timestamp reg_date = new Timestamp(System.currentTimeMillis());

// 패키지 member 자바빈 MemberBean 
// 자바빈 파일 만들어서 객체생성 mb 파라미터값 멤버 변수

// 객체를 생성해야 기억 장소가 만들어짐
//   (좌변) stack = (우변) heap
MemberDTO mb = new MemberDTO();

// 저장할 때는 set메서드로 호출해야 함
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setReg_date(reg_date);

// 패키지 member 자바빈 MemberDAO
// 디비작업 파일 만들어서 객체생성 mdao insertMember(자바빈주소)만들어서 호출

MemberDAO mbdo = new MemberDAO();
mbdo.insertMember(mb); //MemberBean 형을 저장한 주소값만 저장됨

//loginForm.jsp로 이동
response.sendRedirect("loginForm.jsp");
%>

</body>
</html>