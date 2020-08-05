<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.high_0{background: yellow;}
	.high_1{background: orange;}
	.high_2{background: blue;}
</style>

<script src="../js/jquery-3.5.1.js"></script>
<script>

$(document).ready(function(){
	//each() 반복
	// 1. 여러 개 태그 대상 (오늘 완료!)
	// 2. 배열변수 대상(다음시간)
	// 3. 파일결과 대상(ajax[html, xml], json[여러개 데이터])(다음시간)
	$('h3').each(function(index){
		// 딱히 기능은 없고, 반복만 진행
// 		alert(index);
		//.addClass(): class 주소값을 적용하는 함수
		// h3중 각 회차 인덱스일 때 그 태그를 가리키는 변수 this
		$(this).addClass('high_'+index);
		
	});

	
	// 2. 배열변수 대상
	
	// [1] 배열 변수 선언
	var arr = [ 
		{name: 'naver',link:"http://www.naver.com"}, //1행 1열
		{name: 'daum',link:"http://www.daum.net"}, //2행 1열
		{name: 'jquery',link:"http://www.jquery.com"}
	];
	
	// [2] 배열은 반복문과 함께 쓰는데, jQuery에서는 .each가 반복
	// [2] 배열 반복 => 테이블 출력
	//                 인덱스, 아이템 //2차원 배열
	$.each(arr,function(index,item){
// 				alert(index);		
// 				alert(item.name); // index는 각 행별  내용을 가져오고, 
// 				alert(item.link); // item은 변수(name, link)에 해당하는 열의 값을 가져옴
//              table 태그 뒤부분에 naver http://www.naver.com 추가
				// 자바스크립트의 배열 => JSON이라는 형태로 만들어짐
			$('table').append('<tr><td>'+item.name+'</td><td>'+item.link+'</td></tr>')
	});
	


	
});




</script>

</head>
<body>
<h1>js_jQuery1/test7.jsp</h1>

<!--[2] 내용을 넣기 위한 테이블 생성  -->
<table border="1">
<tr><td>사이트이름</td><td>사이트주소</td></tr>

</table>


<h3>head-0</h3>
<h3>head-1</h3>
<h3>head-2</h3>



</body>
</html>