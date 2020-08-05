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
	// 이벤트: 태그에 직접넣기 보다는 jquery를 이용하여 js파일로 분리
	// 이벤트: bind() click() mouseover()
	// h3을 이벤트로 연결(bind), 이벤트는 click, 그때 수행할 기능 
	
	//[1] bind() 함수 사용
// 	$('h3').bind('click', function(){
// 		alert('클릭');
// 	});
	
	//[2] h3 click 클릭했을 때, 클릭한 대상을 'click이벤트' 변경
	// $('대상').이벤트종류(function(){이벤트 시작시 들어갈 기능});
	
// 	$('h3').click(function(){
// 		$(this).html('click이벤트');
// 		alert('클릭이벤트');
		
// 		//[3] 이벤트를 한 번만 수행 후 종료
// 		$(this).unbind();
// 	});
	
	
	//[3] h3 click 시, h3안의 내용을 가져와서 기존내용*추가(2중함수 구성)
// 	$('h3').click(function(){
// 		$(this).html(function(index,oldhtml){
// 			return oldhtml+"*";
// 		});
// 	});
		
	//[4] 이미지 대상에 mouseover 시, src값을 2.jpg로 변경 
	//                  mouseout했을 때 src를 1.jpg로 변경 (롤오버)
	
// 	$('img').mouseover(function(){
// 		$(this).attr('src','../js2/2.jpg');
// 	});
	
// 	$('img').mouseout(function(){
// 		$(this).attr('src','../js2/1.jpg');
// 	});
	// 중복을 피하는 게 좋기 때문에 아래와 같이 작성 가능
	$('img').mouseover(function(){
		$(this).attr('src','../js2/2.jpg');
	}).mouseout(function(){
		$(this).attr('src','../js2/1.jpg');
	});
	
});



</script>

</head>
<body>
<img src="../js2/1.jpg">
<h1>js_jQuery1/test8.jsp</h1>

<!--자바스크립트를 경우 이벤트를 넣을 때 비권장-->
<h3>head_0</h3>
<h3>head_1</h3>
<h3>head_2</h3>


</body>
</html>