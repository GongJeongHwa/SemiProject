<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>   
    
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

<body style="font-family: 'Jeju Gothic', sans-serif;">
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
	<br>
	<br>
	<br>

<form action="insert_res.jsp" method="post">
	<table class="table" style="align:center; font-size:15px; width:900px; height: 500px; margin-left:auto; margin-right:auto;">
		<tr>
			<th>작성자</th>
			<td><input type="text" name="myname"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="mytitle"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="20" cols="100" name="mycontent"></textarea></td>
		</tr>
	</table>
	
		<div style="margin-left:920px;">
			<input type="submit" value="입력" 
			style="background-color: #7b9acc; color:#FCF6F5; width:70px; height:30px; font-size:12px; border:0px;">
			<input type="button" value="취소" onclick="location.href='newslist.jsp'"
			style="background-color: #7b9acc; color:#FCF6F5; width:70px; height:30px; font-size:12px; border:0px;">
		</div>
		
</form>

	<br>
	<br>
		<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
</body>
</html>