<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 캘린더API -->
 <link href='<%=request.getContextPath()%>/fullcalendar/main.css' rel='stylesheet' />
<script src='<%=request.getContextPath()%>/fullcalendar/main.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth'
    });
    calendar.render();
  });

</script>
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
	.blank_list{
		text-align: center;
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
			<li><a href="#">채팅하기</a></li>	
		</ul>
	</div>
	
	
	<!-- 메인 -->
	<div id="right" class="flex_container" style="margin-left:300px;">
		<!-- 달력 -->	
		<div style='float:center;width:400px;height:500px;font-size:0.6em;' id='calendar'></div>
		<br><hr><br>
	
		<!-- 나의여행 목록 -->
		<div class="t_list">
			<h3>나의여행<a href="<%=request.getContextPath()%>/user/my_travel.jsp"><img src="<%=request.getContextPath()%>/img/plus_icon.png" width="30" height="30"></a></h3>
			<table class="table" style="width:750px;">
				<col width="60px">
				<col width="60px">
				<col width="500px">
				
				<tr>
					<th>날짜</th>
					<th>　♡</th>
					<th>여행지</th>
				</tr>
				<tr>
					<td colspan="3" class="blank_list">여행일정이 없습니다.</td>

					
			</table>
		</div>
		
		<!-- 찜목록 -->
		<div class="t_list">
			<h3>내가 찜한 여행지 & 일정<a href="<%=request.getContextPath()%>/user/save_travel.jsp"><img src="<%=request.getContextPath()%>/img/plus_icon.png" width="30" height="30"></a></h3>
			<table class="table" style="width:750px;">
				<col width="60px">
				<col width="60px">
				<col width="500px">
				<tr>
					<th>날짜</th>
					<th>　♡</th>
					<th>여행지</th>
				</tr>
				<tr>
					<td> 9/30</td>
					<td>♥13</td>
					<td onclick="#">부산</td>
				</tr>
			</table>
		</div>
		
		<!-- 약속일정 -->
		<div class="t_list">
			<h3>나의 약속<a href="<%=request.getContextPath()%>/user/my_companion.jsp"><img src="<%=request.getContextPath()%>/img/plus_icon.png" width="30" height="30"></a></h3>
			<table class="table" style="width:750px;">
				<col width="30px">
				<col width="70px">
				<col width="70px">
				<col width="450px">
				
				<tr>
					<th>&nbsp;V</th>
					<th>날짜</th>
					<th>시간</th>
					<th>약속장소</th>
				</tr>
				<tr>
					<td colspan="4" class="blank_list">약속이 없습니다.</td>
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