<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.js"></script>
<script>

$(document).ready(function(){
	// [2] submit 이벤트가 발생하면
	$('#my_form').submit(function(){
		// 아이디, 비밀번호 변수(id, pass)에 가져오기
		var id = $('#id').val();
		var pass = $('#pass').val();
		
		// [4] 아이디가 비어 있으면 "아이디 입력하세요 출력! focus()
		// 큰 따옴표/ 작은따옴표 여부는 상관없음 .. java가 아니므로 null로 비교 안 됨
		if(id==""){
// 			alert("아이디를 입력하세요");
			//[6] 아이디 미 등록 시, 화면에 나타나게
			$('#divid').html('아이디를 입력하세요');
			$('#id').focus();
			// submit은 전체 대상이므로 this로 가져올 수 없고 id값으로 가져와야 함
				return false;	
			
		}
		if(pass==""){
			alert("비밀번호를 입력하세요!");
			$('#pass').focus();
			return false;
		}
		
		// [3] submit 기능을 중지
// 		return false;
		
		//  [5] 성별 선택안하면 '성별 선택하세요' 포커스
		// .is(":checked"): 체크시 true
// 		alert($('#man').is(":checked"));	
		if($('#man').is(":checked")==false && $('#woman').is(":checked")==false){
			alert("성별을 체크하세요!");
			return false;
		}
		
	});
});


</script>

</head>
<body>
<h1>js_jQuery1/test9.jsp<br>jQuery를 활용한 화면제어</h1>
<!--[1] 폼하나 형성  -->
<form action="a.jsp" method="post" id="my_form">

아이디: <input type="text" name="id" id="id"><div id="divid"></div><br>
비밀번호: <input type="password" name="pass" id="pass"><br>
성별: <input type="radio" name="gender" id="man" value="남"> 남 
      <input type="radio" name="gender" id="woman" value="여">여<br>
<input type="submit" value="회원가입">
</form>


</body>
</html>