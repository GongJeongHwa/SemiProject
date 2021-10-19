<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">

table{
border : 1px solid gray;
margin-left: auto; 
margin-right: auto;
border-collapse:collapse;
}
thead{
background-color : lightgray;
text-align : center;
border:1px solid black; 
}
tbody{
text-align : center;
border:1px solid black; 
}
</style>
<body>

	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>

	<br>
	<br>
	<h5><strong>여묻 소식</strong></h5>
	<br>
	<br>
	
	<table>
		
		<col width="100"><col width="100"><col width="500"><col width="100"><col width="100">
		<thead>
		<tr >
			<th>번호</th>
			<th>작성자</th>
			<th>일정명</th>
			<th>조회수</th>
			<th>등록날짜</th>
		</tr>
		</thead>
		
		<tbody>
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
	
		<br>
		<br>
	
		<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
	
	
	
</body>
</html>