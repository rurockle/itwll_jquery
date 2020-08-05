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
<title>개인정보수정</title>
</head>

<script>
 	// 비밀번호 변경 시, 재확인을 위한 check()함수
	function check() {

		if (document.fr.newPass.value != document.fr.rePass.value) {
			alert("변경된 비밀번호를 잘못 입력하셨습니다.");
			document.fr.rePass.focus();
			return;
		}

		document.fr.submit();

	}
</script>

<body>
	<h1>JSP4_test/updateForm.jsp</h1>

	<%
	//세션값 가져오기
	String id = (String) session.getAttribute("id");
	String gender = request.getParameter("gender");

	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	// 2단계
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
	String dbName = "jspid";
	String dbPass = "jsppass";

	Connection con = DriverManager.getConnection(dbUrl, dbName, dbPass);

	//3단계
	String sql = "SELECT * FROM member WHERE id = ?";

	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		gender="남";
		
		if(rs.getString("gender")!=null);{
			gender=rs.getString("gender");
		}
	%>



	<form action="updatePro.jsp" method="post" name="fr">
		<fieldset style="width: 350px; height: 290px">
			<legend><%=id%>님의 정보는 다음과 같습니다<br>
			</legend>
			<table>

				<tr>
					<th align="right"><label for="id">아이디</label></th>
					<td><input type="text" name="id" value=<%=id%> id="id"
						readonly></td>
				</tr>

				<tr>
					<th align="right"><label>현재 비밀번호</label></th>
					<td><input type="password" name="pass"
						placeholder="비밀번호를 입력하세요"></td>
				</tr>

				<tr>
					<th align="right"><label for="newPass">비밀번호 수정</label></th>
					<td><input type="password" name="newPass" id="newPass"
						placeholder="새로운 비밀번호 입력" value=""></td>
				</tr>

				<tr>
					<th align="right"><label for="rePass">비밀번호 수정 재확인</label></th>
					<td><input type="password" name="rePass" id="rePass"
						placeholder="수정한 비밀번호 확인" value=""></td>
				</tr>


				<tr>
					<th align="right"><label for="name">닉네임</label></th>
					<td><input type="text" name="name"
						value=<%=rs.getString("name")%> id="name">
				<tr>
					<th align="right"><label for="age">나이</label></th>
					<td><input type="text" name="age"
						value=<%=rs.getString("age")%> id="age"></td>
				</tr>


				<tr> <%// 선택값이 있을 시, 체크되어 있게 설정 %>
					<th align="right"><label for="gender">성별</label></th>
					<td><input type="radio" name="gender" value="남"
						<%if (gender.equals("남")) {%> checked <%}%>>남자
						<input type="radio" name="gender" value="여"
						<%if (gender.equals("여")) {%> checked <%}%>>
						여자 <input type="radio" name="gender" value="기타"
						<%if (gender.equals("기타")) {%> checked <%}%>>
						기타</td>
				</tr>

				<tr>
					<th align="right"><label for="email">E-mail</label></th>
					<td><input type="email" name="email"
						value=<%=rs.getString("email")%> id="email"></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="button" value="정보수정" onclick="check()"> 
					<input type="reset"	value="다시입력"> 
					<input type="button" value="이전페이지로" onclick="history.go(-1)"></td>
				</tr>
			</table>
		</fieldset>



	</form>

	<%
		}
	%>
</body>
</html>