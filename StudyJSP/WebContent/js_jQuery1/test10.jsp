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
	//효과 show(): 보이게 / hide(): 숨기고 / toggle()왔다갔다
    //     slideDown()   slideUp()    slideToggle()
    //     fadeIn()      fadeOut()    fadeToggle()
	// h2 클릭했을 때
	
	$('h2').click(function(){
		// 대상.next() 대상의 다음 태그 선택
						// toggle의 속성: 
		$(this).next().toggle('slow',function(){
			alert('효과 끝');
			
		});
		
	});
	
	
});


</script>


</head>
<body>
<h1>js_jQuery1/test10.jsp<br>각종 효과</h1>
<h2>열고 닫기1</h2>
<div>
<h2>제목1</h2>
<p>내용1</p>
</div>

<h2>열고 닫기2</h2>
<div>
<h2>제목2</h2>
<p>내용2</p>
</div>

</body>
</html>