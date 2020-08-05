<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<script>
// 필수 입력을 위한 check() 함수
	function Check() {

		if (document.fr.id.value == "") {
			alert("아이디를 입력하세요!");
			document.fr.id.focus();
			return;
		}
		

		if (document.fr.pass.value == "") {
			alert("비밀번호를 입력하세요!");
			document.fr.pass.focus();
			return;
		}

	
		if (document.fr.name.value == "") {
			alert("이름을 입력하세요!");
			document.fr.name.focus();
			return;
		}
		if (document.fr.email.value == "") {
			alert("이메일을 입력하세요!");
			document.fr.email.focus();
			return;
		}
		if (document.fr.age.value == "") {
			alert("나이를 입력하세요!");
			document.fr.age.focus();
			return;
		}
		
		
		document.fr.submit();

	}
</script>


<body>
	<h1>JSP4_test/insertForm.jsp</h1>

	<form action="insertPro.jsp" method="post" name="fr" id="fr">
		<fieldset style="width: 350px; height: 250px">
			<legend> 회원 가입 </legend>
			<table>
				<tr>
					<th align="right"><label for="id">아이디 </label>
					<td><input type="text" name="id" id="id" required
						placeholder="영문/숫자 사용가능"></td>
				</tr>
				<tr>
					<th align="right"><label for="pass">비밀번호</label>
					<td><input type="password" name="pass" id="pass" required
						placeholder="영문/특문/숫자 사용가능"></td>
				</tr>
				<tr>
					<th align="right"><label for="name"> 이름</label>
					<td><input type="text" name="name" id="name" required></td>
				</tr>
				<tr>
					<th align="right"><label for="email">이메일 주소</label>
					<td><input type="email" name="email" id="email" required></td>
				</tr>
				<tr>
					<th align="right"><label for="age"> 나이</label></th>
					<td><input type="number" name="age" id="age" required></td>
				</tr>
				<tr>
					<th align="right"><label for="gender">성별</label>
					<td><input type="radio" name="gender" value="남">남자 <input
						type="radio" name="gender" value="여"> 여자 <input
						type="radio" name="gender" value="기타"> 기타</td>
				</tr>
				<tr>
					<td colspan="2"><br></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="회원가입" onclick="Check()">
						<input type="reset" value="다시작성"></td>
				</tr>
			</table>
		</fieldset>


	</form>


</body>
</html>