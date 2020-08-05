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
<h1>jsp5/deletePro.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//int num, String name pass subject content 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl ="jdbc:mysql://localhost:3306/jspdb5"; 
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPass);
// 3단계  sql select where num=?
String sql="select * from board where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
// 4단계 rs = 실행	
ResultSet rs=pstmt.executeQuery();
// 5단계  rs 다음행 이동 데이터 있으면 
//      폼 , 디비 비밀번호 비교  맞으면  3단계 delete 4단계 실행 list.jsp
//                        틀리면  "비밀번호 틀림" 뒤로이동
//                       없으면   "num 없음" 뒤로이동
if(rs.next()){
	if(pass.equals(rs.getString("pass"))){
		// 3단계 sql delete만들고 실행할수 있는 객체생성
		sql="delete from board where num=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num);
		// 4단계 실행
		pstmt.executeUpdate();
		// list.jsp 이동
		response.sendRedirect("list.jsp");
	}else{
		// "비밀번호 틀림" 뒤로이동
		%>
		<script type="text/javascript">
			alert("비밀번호 틀림");
			history.back();
		</script>
		<%
	}
}else{
	//"num 없음" 뒤로이동
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