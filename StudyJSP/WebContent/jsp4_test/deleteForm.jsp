<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 삭제</title>
</head>
<body>
	<h1>JSP4_test/deleteForm.jsp</h1>

	<form action="deletePro.jsp" method="post">

		<fieldset style="width: 250px; height: 100px">
			<legend>계정 삭제</legend>
			<table>

				<tr>
					<th align="left"><label for="pass">비밀번호</label></th>
					<td><input type="password" name="pass" id="pass"></td>
				</tr>
				<tr>
				<td><br></td></tr>
				<tr>
					<td colspan="2" align="right"><input type="submit"
						value="회원삭제"></td>
				</tr>
			</table>
		</fieldset>


	</form>



</body>
</html>