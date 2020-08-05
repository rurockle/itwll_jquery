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
<h1>member/info.jsp</h1>
<%
	// String id=(String)세션값 가져오기(페이지 상관없이 값이 유지됨)
String id=(String)session.getAttribute("id");

//MemberDAO mado 객체 생성
MemberDAO mado = new MemberDAO();

// getMember(id) 함수 만들기

// 리턴값 저장할 변수 MemberBean mb = getMember(id) 호출결과 저장 
// 이 id에 대한 id, pass, name, reg_date를 받아오고 싶다라는 요청
MemberDTO mb = mado.getMember(id);
// mb는 MemberDAO에서 리턴되서 오고(바구니) 여기에는 mb.set() 메서드로 값이 할당되어 있음
%>


<% //바구니에 든 내용물을 하나씩 꺼내기 위해 mb.get()메서드 이용 %>
아이디 : <%=mb.getId() %><br>
비밀번호 :<%=mb.getPass() %><br>
이름 :<%=mb.getName() %><br>
가입날짜:<%=mb.getReg_date() %><br>

<a href="main.jsp">메인으로 이동!</a>

<%
// // 1단계 드라이버 불러오기
// Class.forName("com.mysql.jdbc.Driver");
// // 2단계 디비연결 => 연결정보 저장
// String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
// String dbUser="root";
// String dbPass="1234";
// Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
// //  sql    select  id에 해당하는 회원정보 가져오기
// // 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
// String sql="select * from member where id=?";
// PreparedStatement pstmt=con.prepareStatement(sql);
// pstmt.setString(1, id);
// // 4단계 실행 결과 => ResultSet rs  
// ResultSet rs=pstmt.executeQuery();
// //  if rs에 처음위치에서 다음행으로 이동  데이터가 있으면  True
// //  출력 아이디 : 비밀번호 : 이름 : 가입날짜:
// 	if(rs.next()){
%>
<%-- 		아이디 : <%=rs.getString("id") %><br> --%>
<%-- 		비밀번호 :<%=rs.getString("pass") %><br> --%>
<%-- 		이름 :<%=rs.getString("name") %><br> --%>
<%-- 		가입날짜:<%=rs.getTimestamp("reg_date") %><br> --%>
<%-- 		<% --%>

<%-- %> --%>
</body>
</html>




