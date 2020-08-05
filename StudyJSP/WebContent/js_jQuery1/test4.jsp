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
	// 대상.함수()   .attr() 태그 속성 :(img 태그의 src, width, height 등등)
	var s = $('img').attr('src');
// 	alert(s);
	//  img width 변경
	$('img').attr('width',300)
	// 첫번째 이미지 width 100 | 두번째 이미지 width 200 | 세번쨰 이미지 300
// 	var wid = [100, 200, 300];
// 	$('img').attr('width',function(index){
		
// 		return wid[index];	
// 	});
	
	$('img').attr('width',function(index){
		
		return (index+1)*100;	
	});
	
	//[1] img 속성 width 500 height 300
	
// 	var wid = [500, 500, 500];
// 	var hei = [300, 300, 300];
// 	$('img').css({
// 		width:function(index){
// 			return wid[index];
// 		},
// 		height:function(index){
// 			return hei[index];
// 		}
		$('img').attr({
			width:500,
			height:300
		});
		
		// [1]width 200, 300, 400 height 100 200 300
// 		var wid = [200, 300, 400];
// 		var hei = [100, 200, 300];
// 		$('img').attr({
// 			width:function(index){
// 				return wid[index];
// 			},
// 			height:function(index){
// 				return hei[index];
// 			}
					 
// 		});
		// [2]
		$('img').attr({
			width:function(index){
				return (index+2)*100;
			},
			height:function(index){
				return (index+1)*100;
			}
		});
		
	
	
});




</script>


</head>
<body>
<img src="../js2/1.jpg" width="200" height="100"/>
<img src="../js2/2.jpg" width="200" height="100"/>
<img src="../js2/3.jpg" width="200" height="100"/>
</body>
</html>
