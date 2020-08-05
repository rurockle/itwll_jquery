<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// js_jQuery2/json2.jsp
// 데이터를 ==> JSON으로 변경해주는 프로그램 설치

//1단계 드라이버로더
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결 => Connection con
String dbUrl ="jdbc:mysql://localhost:3306/jspstudy"; 
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
// sql    select 모든 회원정보 가져오기
// 3단계 연결정보를 이용해서 sql구문 만들고 실행할 객체생성 => PreparedStatement
String sql="select * from member";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 실행 결과 => ResultSet rs
ResultSet rs=pstmt.executeQuery();
// 5단계 rs 내용을 table태그 출력

//리스트 선언
// List memberList = new ArrayList();

// while(rs.next()){
// 	// 한 사람의 정보 저장
// 	MemberDTO mb = new MemberDTO();
// 	mb.setId(rs.getString("id"));
// 	mb.setPass(rs.getString("pass"));
// 	mb.setName(rs.getString("name"));
	
// 	// 배열 한 칸에 한 사람의 정보 저장
// 	memberList.add(mb);
// }

// List memberList = new ArrayList();
JSONArray memberList = new JSONArray();

while(rs.next()){
	// 한 사람의 정보 저장
// 	MemberDTO mb = new MemberDTO();
	JSONObject mb = new JSONObject();
// 	mb.setId(rs.getString("id"));
	mb.put("id",rs.getString("id"));
// 	mb.setPass(rs.getString("pass"));
	mb.put("pass",rs.getString("pass"));
// 	mb.setName(rs.getString("name"));
	mb.put("name",rs.getString("name"));
	
	// 배열 한 칸에 한 사람의 정보 저장
	memberList.add(mb);
}
%>
<%=memberList %>


