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
			<th >작성자</th>
			<th >일정명</th>
			<th>조회수</th>
			<th>등록날짜</th>
		</tr>
		</thead>
		
		<tbody align="center">
		<tr>
			<td>2</td>
			<td>관리자</td>
			<td>남산서울타워 전망대를 가보지 않은 그대에게</td>
			<td>581</td>
			<td>2021.10.01</td>
		</tr>
		
		<tr>
			<td>2</td>
			<td>관리자</td>
			<td>남산서울타워 전망대를 가보지 않은 그대에게</td>
			<td>581</td>
			<td>2021.10.01</td>
		</tr>
		
		<tr>
			<td>2</td>
			<td>관리자</td>
			<td>남산서울타워 전망대를 가보지 않은 그대에게</td>
			<td>581</td>
			<td>2021.10.01</td>
		</tr>
		</tbody>
		
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