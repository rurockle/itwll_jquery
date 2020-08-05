<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
*{margin: 0px; padding: 0px;}
ul{list-style: none;}
img{width: 500px;height: 350px;}

</style>




<script src="../js/jquery-3.5.1.js"></script>
<script src="../js/jquery.innerfade.js"></script>
<script>
// 속도가 빠르고 가벼워짐 => 플래시가 사양됨

$(document).ready(function(){
	$('#inner_fade').innerfade({
		animationtype: 'fade',
		speed: 1000,
		timeout: 1000,
		type: 'random',
		containerheight: '350px'
	});
});


</script>


</head>
<body>
<h1>js_jQuery1/test11.jsp<br>.innerfade(외부에서 만든 jquery사용)</h1>

<ul id="inner_fade" >
 <li><img src="../js2/1.jpg"></li>
 <li><img src="../js2/2.jpg"></li>
 <li><img src="../js2/3.jpg"></li>
 <li><img src="../js2/4.jpg"></li>
 <li><img src="../js2/5.jpg"></li>


</ul>

</body>
</html>