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
	
	// 대상.append() 대상 뒷부분에 추가
// 	$('body').append('추가내용[태그가능]');
	$('body').append('<h3>내용추가</h3>');
	
	// 'table' 태그 뒷부분에 1 안녕하세요 (향후 each()함수를 사용하여 append()를 반복
	$('table').append('<tr><td>1</td><td>안녕하세요</td></tr>')
	
	$('table').append('<tr><td>2</td><td>반갑습니다</td></tr>')
	
	// 2초마다 반복
	setInterval(function() {
		// div 태그 대상에 첫번째 이미지를 뒷부분에 추가 $('img').first() <<-첫번째 이미지를 지정
		// 롤링배너 효과가 부여됨
		$('div').append($('img').first());
	}, 2000);
	
});


</script>

</head>
<body>
<div>
<img src="../js2/1.jpg"/>
<img src="../js2/2.jpg"/>
<img src="../js2/3.jpg"/>
<img src="../js2/4.jpg"/>
<img src="../js2/5.jpg"/>


</div>
<h1>js_jQuery1/test6.jsp</h1>

<table border="1">

<tr><td>번호</td><td>제목</td></tr>

</table>



</body>
</html>