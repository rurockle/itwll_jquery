<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="colorset.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=col1%>">
<h1>jsp1/include.jsp</h1>
<table border="1" width="600" height="600">
<tr><td colspan="2" height="100">
    <jsp:include page="top.jsp"/></td></tr>
<tr><td width="100"><jsp:include page="left.jsp"/></td>
    <td>본문</td></tr>
<tr><td colspan="2" height="100">
    <jsp:include page="bottom.jsp"/></td></tr>
</table>
</body>
</html>




