<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/testForm3.jsp</h1>
<form action="testPro3.jsp" method="post" name="fr">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name"><br>
성별 : <input type="radio" name="gender" value="남">남자
       <input type="radio" name="gender" value="여">여자<br>
취미 :<input type="checkbox" name="hobby" value="여행">여행
    <input type="checkbox" name="hobby" value="게임">게임
    <input type="checkbox" name="hobby" value="독서">독서<br>
회원등급 : <select name="grade">
		   <option value="">회원 등급선택하세요</option> 
		   <option value="1">1등급</option>
		   <option value="2">2등급</option>
		   <option value="3">3등급</option>
        </select><br>
자기소개 : <textarea name="intro" rows="10" cols="20"></textarea><br>   
<input type="submit" value="회원가입">
</form>
</body>
</html>





