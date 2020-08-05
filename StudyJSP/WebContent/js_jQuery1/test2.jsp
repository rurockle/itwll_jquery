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
	// 대상.함수	
	// 대상선택
	//this는 따옴표로 묶지 않고, 나머지는 모두 따옴표(따옴표 종류는 무관)로 묶어줌 
	// * 는 모든 태그
	
// 	$('*').css('속성','값');
	$('*').css('color','red');
	//태그 대상 선택
	$('h1').css('color','blue');
	// #이름 대상선택 id="이름"
	$('#ta').css('color', 'green');
	// .이름 대상선택 class="이름"
	$(".ta").css('color','pink');
	// 태그[속성=값]: 같다     // 태그[속성~=값]: 포함
	// 태그[속성^=값]: 시작값  // 태그[속성$=값]: 종료값
// 	$('태그[속성=값]')
	$('input[type=text]').css('color','yellow');
	$('input[type=password]').css('color','orange');
	// 태그:odd 홀수 // 태그:even 짝수 // 태그:first 처음 // 태그: last 마지막 // 태그: next 다음
	// 태이블에 사용, 컬럼명이 있는 첫줄 인덱스번호는 0 (즉 신경쓸 필요 없음)
	
	$('tr:odd').css('background','yellow');
	$('tr:even').css('background','pink');
	$('tr:first').css('background','skyblue');

});

</script>


</head>
<body>
<h1>js_jQuery1/test2.jsp</h1>

<table border="1">
<tr><td>번호</td><td>제목</td></tr> 
<tr><td>1</td><td>헤리포터</td></tr>
<tr><td>2</td><td>반지제왕</td></tr>
<tr><td>3</td><td>아마겟돈</td></tr>
<tr><td>4</td><td>인터스텔라</td></tr>
</table>


<input type="text" value="아이디" >
<input type="password" value="123">

<h1 id="ta">제목1</h1>
<h1 class="ta">제목2</h1>
내용

</body>
</html>
