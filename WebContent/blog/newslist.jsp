<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

 <%@ page import="com.mvc.dto.BlognewsboardDto" %> 
 <%@ page import="com.mvc.dao.BlogDao" %>
 <%@ page import="java.util.List" %>
 <%@ page import="java.util.Vector" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>

<style type="text/css">
.table{
font-size:13px;
}
</style>
</head>
<body style="font-family: 'Jeju Gothic', sans-serif;">

<%
	int pageSize =10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
	int count = 0;
	int number = 0;
	int currentPage = Integer.parseInt(pageNum);
	BlogDao dao = new BlogDao();
	count = dao.getAllCount();
	
	 int startRow = (currentPage - 1) * pageSize + 1;
     int endRow = currentPage * pageSize;

     Vector<BlognewsboardDto> vec = dao.getAllBoard(startRow, endRow);

     number = count - (currentPage - 1) * pageSize;
%>	
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>

	<br>
	<br>
	<h1 style="margin-left:50px;"><strong>여묻 소식&nbsp;📢</strong></h1>
	<br>
	<br>
	
		<table class="table table-bordered" style="width:800px; margin-left:250px;">
			<thead style="background-color:#DCE2F0; color:#50586C; border:0px solid;">
				<tr align="center" height="40" >
					<td width="50" >번호</td>
					<td width="100" >작성자</td>
					<td width="400" >제목</td>
					<td width="150" >작성일</td>
					<td width="80">조회수</td>
				</tr>
			</thead>
<%
	List<BlognewsboardDto> list = dao.selectAll();
	if(list.size()==0){
%>
	<tr>
		<td colspan="5" >-----글이 존재하지 않습니다.-----</td>
	</tr>		
<%
	}else{
		for(BlognewsboardDto blognews : list){
%>	
	<tr align="center">
		<td><%=blognews.getSeq() %></td>
		<td><%=blognews.getWriter() %></td>
		<td><a href="selectone.jsp?seq=<%=blognews.getSeq()%>"><%=blognews.getTitle() %></a></td>
		<td><%=blognews.getRegdate() %></td>
		<td><%=blognews.getViewcnt() %></td>
	</tr>
<%
		}
	}
%>	
		</table>
		
		<div style="margin-left:900px;">
			<input type = "button" value="돌아가기" onclick="location.href='blog_main.jsp'" 
				style="background-color: #7b9acc; color:#FCF6F5; width:70px; height:30px; font-size:12px; border:0px;">
			<input type = "button" value="글쓰기" onclick="location.href='insert.jsp'" 
				style="background-color: #7b9acc; color:#FCF6F5; width:70px; height:30px; font-size:12px; border:0px;">
		</div>
		
	<br>
            <div style="font-size:12px;"align="center">
            <!-- 페이지 카운터링 소스를 작성 -->
            <%
                if (count > 0) {
                    int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); //카운터링 숫자를 얼마까지 보여줄건지 결정
 
                    //시작 페이지 숫자를 설정
                    int startPage = 1;
 
                    if (currentPage % 10 != 0) {
                        startPage = (int) (currentPage / 10) * 10 + 1;
 
                    } else {
                        startPage = ((int) (currentPage / 10) - 1) * 10 + 1;
                    }
 
                    int pageBlock = 10; //카운터링 처리 숫자
                    int endPage = startPage + pageBlock - 1; //화면에 보여질 페이지의 마지막 숫자
 
                    if (endPage > pageCount){
                    	endPage = pageCount;
                    }
                        
 
                    //이전이라는 링크를 만들건지 파악
                    if (startPage > 10) {
            %>
            <a href="newslist.jsp?pageNum=<%=startPage - 10%>"> [이전] </a>
            <%
                }
 
                    //페이징 처리
                    for (int i = startPage; i <= endPage; i++) {
            %>
            <a href="newslist.jsp?pageNum=<%=i%>" > [<%=i%>]</a>
            <%
                }
 
                    //다음이라는 링크를 만들건지 파악
                    if (endPage < pageCount) {
            %>
            <a href="newslist.jsp?pageNum=<%=startPage + 10%>"> [다음] </a>
            <%
                }
 
                }
            %>
		</div>

			
	<br>	
	<br>
		<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
	
	
	
</body>
</html>
           