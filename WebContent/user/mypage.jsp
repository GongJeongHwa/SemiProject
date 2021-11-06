<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	  margin-left:100px;
	}
	.t_list{
		margin: 20px 0px;
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
		window.open("user/unregister_1.jsp","_blank","width=300px, height=150px");
		
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
			<li><a href="<%=request.getContextPath()%>/mypage.do?command=mypage">내여행</a></li>
			<hr>
			<li><a href="<%=request.getContextPath()%>/mypage.do?command=infoUpdate">정보수정</a></li>
			<hr>
			<li><a href="javascript:popup();">회원탈퇴</a></li>	
			<hr>
			<li><a href="<%=request.getContextPath()%>/Companion.do?command=message">채팅하기</a></li>	
		</ul>
	</div>
	
	
	<!-- 메인 -->
	<div id="right" class="flex_container" style="margin-left:350px;">
		<!-- 달력 -->	
		<div style='float:center;width:400px;height:500px;font-size:0.6em;' id='calendar'></div>
		<br><hr style="width:800px">
	
		<!-- 나의여행 목록 -->
		<div class="t_list">
			<h3>나의여행<a href="mypage.do?command=myTravel"><img src="<%=request.getContextPath()%>/img/plus_icon.png" width="30" height="30"></a></h3>
			<table class="table" style="width:750px;">
				<col width="100px">
				<col width="60px">
				<col width="400px">
				
				<tr>
					<th>날짜</th>
					<th style="text-align:center">♡</th>
					<th>여행지</th>
				</tr>
				<c:choose>
					<c:when test="${empty travel_list }">
						<tr>
							<td colspan="3" class="blank_list"> 여행일정이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${travel_list }" var="blogDto" end="4">
							<tr>
								<td>${blogDto.blog_create_date }</td>
								<td style="text-align:center">♥${blogDto.heart_count }</td>
								<td><a href="blog.do?command=selectone&blogseq=${blogDto.blog_seq}&user_id=${blogDto.user_id}">${blogDto.areaname }</a></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>	
					
			</table>
		</div>
		<br><hr style="width:800px">
		
		<!-- 찜목록 -->
		<div class="t_list">
			<h3>내가 찜한 여행지 & 일정<a href="mypage.do?command=wishedTravel"><img src="<%=request.getContextPath()%>/img/plus_icon.png" width="30" height="30"></a></h3>
			<table class="table" style="width:750px;">
				<col width="100px">
				<col width="160px">
				<col width="300px">
				<tr>
					<th>국가</th>
					<th>장소이름</th>
					<th>위도 / 경도</th>
				</tr>
				<c:choose>
					<c:when test="${empty wished_list }">
						<tr>
							<td colspan="3" class="blank_list"> 여행일정이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${wished_list }" var="HeartDto" end="4">
							<tr>
								<td>${HeartDto.nation }</td>
								<td>${HeartDto.place_name }</td>
								<td>${HeartDto.latitude } / ${HeardDto.longtitude }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>	
			</table>
		</div>
		<br><hr style="width:800px">
		
		<!-- 약속일정 -->
		<div class="t_list">
			<h3>나의 약속<a href="mypage.do?command=myCompanion"><img src="<%=request.getContextPath()%>/img/plus_icon.png" width="30" height="30"></a></h3>
			<table class="table" style="width:750px;">
				<col width="100px">
				<col width="80px">
				<col width="400px">
				
				<tr>
					<th>날짜</th>
					<th>시간</th>
					<th>comment</th>
				</tr>
				<c:choose>
					<c:when test="${empty companion_list }">
						<tr>
							<td colspan="3" class="blank_list" end="4"> 약속이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${companion_list }" var="PromiseDto">
							<tr>
								<td>${PromiseDto.p_time }</td>
								<td>${PromiseDto.p_loc }</td>
								<td>${PromiseDto.p_comment }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>	
			</table>
		
		</div>
	</div>

	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
</body>
</html>