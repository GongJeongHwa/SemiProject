<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	ul {
		list-style-type : none;
	    margin: 0px;
	    padding: 0px;
	    width: 200px;
	    background-color: white;
	}
	li a {
	    display: block;
	    color: #000;
	    padding: 8px 16px;
	    text-decoration: none;
	}
	li a:hover {
	    background-color: green;
	    color: white;
	    position : 
	}
	.flex-container{
		display: flex;
		float:right;
		flex-direction: column;	
		
	}
	.header, .sidebar,
	.footer, .flex-container {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	.sidebar {
	  width: 15%;
	  float: left;
	  height: 50%;
	}

	.t_list{
		margin: 20px;
	}
	h3 {
		padding: 0;
		margin: 0;
	}
	body {
		margin: 0;
		padding: 0;
	}
	.date{
		margin-left: 480px;
	}
	.table th, .table td{
		border:1px solid black;
	}
</style>
<script type="text/javascript">
	function popup(){
		window.open("unregister_1.jsp","_blank","width=300px, height=150px");
	}
	
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
	

	<br>
	<div style="text-align: center;">마이페이지</div>
	<br>

	<!-- 사이드바 -->
	<div id="left" class="sidebar">
		<ul>
			<li><a href="<%=request.getContextPath()%>/user/mypage.jsp">내여행</a></li>
			<hr>
			<li><a href="<%=request.getContextPath()%>/user/info_update.jsp">정보수정</a></li>
			<hr>
			<li><a href="#" onclick="popup();">회원탈퇴</a></li>	
			<hr>
			<li><a href="Companion.do?command=message">채팅하기</a></li>	
		</ul>
	</div>
	
	
	<!-- 메인 -->
	<div id="right" class="flex_container" style="margin-left:250px; height:400px;">
	
		<!-- 나의약속 목록 -->
		<div class="t_list">
			<h3>나의여행</h3>
			
			<!-- 날짜검색 -->
			<div class="date">
				<%@ include file="datepicker.jsp"%>
			</div>
			
			<table class="table" style="width:750px;">
				<col width="60px">
				<col width="60px">
				<col width="450px">
				<col width="30px">
				<tr>
					<th>날짜</th>
					<th>♡</th>
					<th>여행지</th>
					<th>　</th>
				</tr>
			</table>
		</div>
	</div>

	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
</body>
</html>