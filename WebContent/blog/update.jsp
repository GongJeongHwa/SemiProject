<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %> 

<%@ page import="com.mvc.dto.BlognewsboardDto" %> 
 <%@ page import="com.mvc.dao.BlogDao" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>

<style type ="text/css">

</style>
</head>
<body style="font-family: 'Jeju Gothic', sans-serif;">
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
<%
	int seq= Integer.parseInt(request.getParameter("seq"));
	BlogDao dao = new BlogDao();
	BlognewsboardDto blognews =dao.selectOne(seq);
%>

<form action="update_res.jsp" method="post">
	<input type="hidden" name="seq" value="<%=blognews.getSeq() %>">
	<table class="table" style="align:center; font-size:15px; width:1000px; height: 500px; margin-left:auto; margin-right:auto;">
		<tr>
			<th >작성자</th>
			<td><%=blognews.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td width="50"><input type="text" name="title" value="<%=blognews.getTitle() %>"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="20" cols="100" name="content"><%=blognews.getContent() %></textarea></td>
		</tr>
	</table>
</form>
		<div style="margin-left:600px;">
				<input type="submit" value="수정" 
				style="background-color: #7b9acc; color:#FCF6F5; width:70px; height:30px; font-size:12px; border:0px;">
				<input type="button" value="취소" onclick="history.back()" 
				style="background-color: #7b9acc; color:#FCF6F5; width:70px; height:30px; font-size:12px; border:0px;">
		</div>
	<br>
	<br>
		<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>



</body>
</html>