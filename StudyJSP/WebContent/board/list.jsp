<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
// 게시판 전체 글 개수 가져오기   select count(*) from board
// int count =  getBoardCount()
int count=bdao.getBoardCount();
// 한페이지 보여줄 글개수 설정
int pageSize=10;
// 현페이지 번호 가져오기  
//  http://localhost:8080/StudyJSP/board/list.jsp
//  http://localhost:8080/StudyJSP/board/list.jsp?pageNum=2
//  pageNum 파라미터 가져오기
String pageNum= request.getParameter("pageNum");
// pageNum 파라미터값이 없으면  "1"로 설정
if(pageNum==null){
	pageNum="1";
}
// pageNum -> 정수형 
int currentPage=Integer.parseInt(pageNum);
// 시작하는 행번호 구하기 - 알고리즘
//  페이지번호 currentPage  한화면보여줄글개수 pageSize => 시작하는행번호 
//         1                        10          => 0*10+1=> 0+1 =>  1
//         2                        10          => 1*10+1=> 10+1 => 11
//         3                        10          => 2*10+1=> 20+1 => 21
int startRow= (currentPage-1)*pageSize+1;
// 마지막 행번호 구하기 - 알고리즘
//  페이지번호 currentPage   한화면보여줄글개수 pageSize=> 마지막 행번호
//         1                        10          =>   10
//         2                        10          =>   20
//         3                        10          =>   30
int endRow=currentPage*pageSize;


// List boardList  =  getBoardList()  메서드 만들고 호출
// List<BoardBean> boardList=bdao.getBoardList();
// select * from board order by num desc limit 시작행-1,개수
List<BoardDTO> boardList=bdao.getBoardList(startRow,pageSize);

%>
<h1>board/list.jsp  [전체 글개수 : <%=count %>]</h1>
<h3><a href="writeForm.jsp">글쓰기</a></h3>
<table border="1">
<tr><td>글번호</td><td>제목</td><td>작성자</td>
    <td>날짜</td><td>조회수</td></tr>
    <%
    // 5단계 while 다음행 이동  num,subject,name,date,readcount 열 가져오기
    for(int i=0;i<boardList.size();i++){
    	BoardDTO bb=boardList.get(i);
    	%>
   <tr><td><%=bb.getNum() %></td>
       <td>
       <%
       //들여쓰기 / 답글 순서 로 판별 가능
       //이미지 width 계산 lev 1 => 10px 2 => 20px 3 = 30px
       int wid=0;
       if(bb.getRe_lev()>0){
    	   wid=bb.getRe_lev()*10;
    	   %>
    	   <img src="level.gif" width="<%=wid%>" height="15">
    	   <img src="re.gif">
    	   <%
       }
       
       %>
       <a href="content.jsp?num=<%=bb.getNum()%>">
       <%=bb.getSubject() %></a></td>
       <td><%=bb.getName() %></td>
       <td><%=bb.getDate() %></td>
       <td><%=bb.getReadcount() %></td></tr> 
    	<%
    }
    %>
  
</table>
<%
// 전체 페이지 수 구하기  - 알고리즘
// 전체 글개수  50  한화면에 보여줄 글개수 10  => 전체페이지수 5 +0 => 5
// 전체 글개수  57  한화면에 보여줄 글개수 10  => 전체페이지수 5 +1 => 6
int pageCount= count/pageSize+(count%pageSize==0?0:1);
// 한화면에 보여지는 페이지개수 설정 
int pageBlock=3;
// 시작하는 페이지번호 구하기 -알고리즘
//  현페이지번호currentPage   한화면페이지개수pageBlock   => 시작하는 페이지 번호 
//     1~10                    10                  => 0*10+1=>0+1=>1
//     11~20                   10                  => 1*10+1=>10+1=>11
//     21~30                   10                  => 2*10+1=>20+1=>21
int startPage= (currentPage-1)/pageBlock*pageBlock+1;
// 끝나는 페이지번호 구하기 - 알고리즘
//  시작하는 페이지번호startPage   한화면페이지개수pageBlock   => 끝나는 페이지 번호 
//     1                      10                  => 10
//     11                     10                  => 20
//     21                     10                  => 30
int endPage= startPage + pageBlock -1;
// 끝나는 페이지 10   전체 페이지 5  => 끝나는 페이지 5변경
if(endPage > pageCount){
	endPage=pageCount;
}
// 이전  
if(startPage > pageBlock){
	%><a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a><%
}

// 1  2   3  4 .... 10 
// list.jsp?pageNum=2
for(int i=startPage;i<=endPage;i++){
	%> <a href="list.jsp?pageNum=<%=i%>"><%=i%></a> <%
}

//다음  끝페이지번호   전체페이지번호
if(endPage < pageCount){
	%><a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
}
%>


</body>
</html>






