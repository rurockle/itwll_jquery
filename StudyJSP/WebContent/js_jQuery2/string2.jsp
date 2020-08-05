<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <h1>string2.jsp/js_jQuery2</h1> -->
<%
// name age 파라미터가져오기
String name = request.getParameter("name");
String age = request.getParameter("age");
%>
이름:<%=name %>,나이:<%=age %>