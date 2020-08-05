<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>jsp4_test/loginForm.jsp</h1>
	<form action="loginPro.jsp" method="post">
		<fieldset style="width: 250px; height: 100px">
			<legend>Log-in</legend>
			<table>
				<tr>
					<th><label for="id">아이디</label></th>
					<td><input type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<th><label id="pass">비밀번호</label></th>
					<td><input type="password" name="pass" id="pass"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="로그인">
						<input type="button" value="회원가입"
						onclick="location.href='insertForm.jsp'"></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>


