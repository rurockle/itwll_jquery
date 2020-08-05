<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.js"></script>



<script>
// https://jquery.com/
// jQuery: javascript를 이용해서 기능을 함수들로 정의(일종의 내장함수)
// Download the uncompressed, development jQuery 3.5.1
// js/jQuery-3.5.1.js

// 1. jQuery 사용
// 2. 대상선택.함수() 대상선택
// 3. 함수().css()[모양] .attr() [속성] .html() [모양에 데이터 넣기] .append[모양에 내용 추가]
// 4. .each()[배열] .click(), .mouseover [이벤트]
// 5. 효과 hide() show() toggle()
// 6. 비동기방식 ajax() .getJSON()

jQuery(document).ready(function(){// 문서에 jQuery 쓸 준비가 되어있다.(jQuery쓰기 위해 반드시 필요)
	alert("준비1");
});


$(document).ready(function(){
	alert("준비2");
});

$(function(){
	alert("준비3");
});


</script>
</head>
<body>
<h1>js_jQuery1/test1.jsp</h1>


</body>
</html>