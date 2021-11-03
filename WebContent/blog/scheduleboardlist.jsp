<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>  

<%@ page import="java.util.List" %>
<%@ page import="com.mvc.dto.blogDto" %>
 <%@ page import="com.mvc.dao.BlogDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

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
thead{
background-color:#DCE2F0;
 color:#50586C; 
 border:0px solid;">
}

</style>
<body style="font-family: 'Jeju Gothic', sans-serif;">

	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>

	<br>
	<br>
	<h1 style="margin-left:50px;"><strong>이달의 인기일정&nbsp;🎈</strong></h1>
	<br>
	<br>
	
	<table class="table table-bordered" style="width:800px; margin-left:250px;">
		<col width="100"><col width="100"><col width="500"><col width="100"><col width="100">
		<thead align="center">
		<tr align="center">
			<th >번호</th>
			<th >유저명</th>
			<th >일정명</th>
			<th>여행시작일</th>
			<th>여행종료일</th>
		</tr>
		</thead>
<%
	BlogDao dao = new BlogDao();
	List<blogDto> list = dao.scheduleboardlist();
	for(int i=0; i<list.size(); i++){
%>
		<tr align="center">
		<td><%=list.get(i).getBlog_seq()%></td>
		<td><%=list.get(i).getUser_id()%></td>
		<td><a href="<%=request.getContextPath() %>/blog.do?command=selectone&user_id=<%=list.get(i).getUser_id()%>&blogseq=<%=list.get(i).getBlog_seq()%>"><%=list.get(i).getTitle() %></a></td>
		<td><%=list.get(i).getMindate() %></td>
		<td><%=list.get(i).getMaxdate() %></td>
	</tr>
		
<%
	}
%>		
		
		
	</table>
		<input type = "button" value="돌아가기" onclick="location.href='blog_main.jsp'" 
				style="margin-left:970px; background-color: #7b9acc; color:#FCF6F5; width:70px; height:30px; font-size:12px; border:0px;">
		<br>
		<br>
	
		<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
	
	
	
</body>
</html>