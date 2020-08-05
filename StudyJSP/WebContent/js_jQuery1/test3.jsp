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
	// 대상.함수() .css()
	var col = $('h3').css('color');
// 	alert(col);
	
	// h3의 글자색 'yellow'변경
	$('h3').css('color','yellow');
	
	// h3대상 0번째, 1번째, 2번째 선택해서 글자색을 변경
	// 배열 변수
	var color = ['red','green','blue'];
	$('h3').css('color',function(index){ //인덱스 번호는 0번부터 시작 
// 		alert(color[index]); 'red','green','blue'
		return color[index]; //배열 변수들을 function()함수안에 index순으로 입력
							 // 결과적으로 $('h3').css('color',index[i])가 완성됨
	});
	
	//[1] color background 두개 속성 적용(되도록이면 사용하지 않는 편이 좋다)
	$('h3').css('color','red').css('background','pink');
	
// 	[2] color background 두개 속성 적용
	$('h3').css({
		color: 'blue',
		background: 'skyblue'
	})
    
	
	// color backgroud 두개 속성 적용
	var color1 = ['red','green','blue'];
	var back=['blue','orange','red'];
	$('h3').css({
		color:function(index){
			return color1[index];
		},
		background:function(index){
			return back[index];
		}
				 
	});
	
});


</script>

</head>
<body>
<h1>js_jquery1/test3.jsp</h1>
<h3>head-0</h3>
<h3>head-1</h3>
<h3>head-2</h3>

</body>
</html>