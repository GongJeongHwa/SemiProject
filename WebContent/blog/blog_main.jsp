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

.image{
float: left; 
padding: 10px; 
margin-left: 30px;
}

.clear{
clear: left;
}

.leftslidebutton{
float: left;
position : relative;
top:100px;
left: 40px;
}

.rightslidebutton{
float: left;
position : relative;
top:100px;
right: 10px;
}


</style>

<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
	
	<!--  이달의 인기 일정/여행지 -->
	<br>
	<br>
	<h5><strong>이달의 인기 일정/여행지</strong></h5>
	<br>
	<br>
	
	<div class="leftslidebutton">
	<button><<</button>
	</div>
	
	<div class="image">
		<figure>
				<a href="blog_detail.jsp"><img src = 'jeju.jpg' width="220" height="220" hspace="10" ></a>
			<figcaption>&nbsp;&nbsp;&nbsp;제주도 2박3일
								<img src='heart.png' width= "20" height ="20" align="middle">
			</figcaption>
		</figure>
	</div>
	
	<div class="image">
		<figure>
				<a href="blog_detail.jsp"><img src = 'lake.jpg' width="220" height="220" hspace="10"></a>
			<figcaption>&nbsp;&nbsp;&nbsp;서울 1박 2일
								<img src='heart.png' width= "20" height ="20" align="middle">
			</figcaption>
		</figure>
	</div>
		
	<div class="image">
		<figure>
					<a href="blog_detail.jsp"><img src = 'pink.jpg' width="220" height="220" hspace="10"></a>
			<figcaption>
					&nbsp;&nbsp;&nbsp;경주 핑크뮬리
					<img src='heart.png' width= "20" height ="20" align="middle">
			</figcaption>
		</figure>
	</div>
	
	<div class="image">
		<figure>
				 <a href="blog_detail.jsp"><img src = 'tree.jpg' width="220" height="220" hspace="10"></a>
			<figcaption>
					&nbsp;&nbsp;&nbsp;서울 당일치기
				<img src='heart.png' width= "20" height ="20" align="middle"></figcaption>
			</figure>
	</div>	
	
	<div class="rightslidebutton">
	<button >>></button>
	</div>
	
	<div class="clear">
	<a href='scheduleboardlist.jsp'><button style="float: right">More</button></a>
	</div>

<!-- ----------------------------------------------------------------------------------------------------------------------- -->	
	
	<!--  여묻 소식 -->
	<br>
	<h5><strong>여묻 소식</strong></h5>
	<br>
	
	
	<table style="margin-left: auto; margin-right: auto;" >
		<col width="100"><col width="500"><col width="100">
		<tr >
			<th>번호</th>
			<th>제목</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td>2</td>
			<td><a href="blog_detail.jsp">남산서울타워 전망대를 가보지 않은 그대에게</a></td>
			<td>581</td>
		</tr>
		
		<tr>
			<td>15</td>
			<td><a href="blog_detail.jsp">거북섬에 불어온 서핑의 혁명, 웨이브파크</a></td>
			<td>51</td>
		</tr>
		
		<tr>
		<td>4</td>
		<td><a href="blog_detail.jsp">분홍빛으로 물드는 계절, 핑크뮬리스폿</a></td>
		<td>45,250</td>
		</tr>
	</table>
	
	<div class="clear">
	<a href='newslist.jsp'><button style="float: right">More</button></a>
	</div>

<!-- ----------------------------------------------------------------------------------------------------------------------- -->
	
	<br>
	<h5><strong>나의 일정</strong></h5>
	<br>
	<br>
	<div style=
	"margin-left:auto; margin-right:auto;  background:lightgray; height: 200px; width: 700px; text-align:center;
	line-height:100px;" >
	아직 저장된 일정이 없습니다. 
	<br>
	<a href="">로그인</a>후 더 많은 일정을 공유하세요.
	</div>
	
	<br>
	<br>

<!-- ----------------------------------------------------------------------------------------------------------------------- -->
	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>


</body>
</html>