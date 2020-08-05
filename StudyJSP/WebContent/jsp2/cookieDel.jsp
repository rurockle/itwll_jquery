<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/cookieDel.jsp</h1>
<%
// 쿠키값 설정시간 지나면 쿠키값 삭제, 임의로 쿠키값 시간을 0설정 =>쿠키값 삭제
//  요청정보에 저장되어있는 쿠키값 가져오기
Cookie cookies[]=request.getCookies();
// 쿠키값이 있으면  for  if 쿠키값.getName() "cook"
//  찾은 쿠키값을 시간을 0으로 설정
//  서버에서 클라이언트로 쿠키값을 저장
if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("cook")){
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
	}
}

// "쿠키값 삭제"  cookieTest.jsp이동 
%>
<script type="text/javascript">
	alert("쿠키값 삭제");
	location.href="cookieTest.jsp";
</script>
</body>
</html>





