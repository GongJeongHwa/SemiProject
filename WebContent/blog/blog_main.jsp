<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>   

 <%@ page import="com.mvc.dto.BlognewsboardDto" %> 
 <%@ page import="com.mvc.dao.BlogDao" %>
 <%@ page import="java.util.List" %>
 
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
.image{
float: left; 
padding: 20px; 
margin-left: 35px;
margin-rignt: 35px;
font-size: 15px;
}

.clear{
clear: left;
}

.title{
margin-left:30px;
color:#50586C;
}

.button{
background-color: #7b9acc; 
color:#FCF6F5; 
width:70px; 
height:30px; 
font-size:12px; 
border:0px;
margin-left:1150px;
}

.table{ 
font-size:15px;
}
</style>

	


<body style="font-family: 'Jeju Gothic', sans-serif;">
		<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
	
	<!--  이달의 인기 일정/여행지 -->
	
	<br><br><br><br>
	<h1 class="title" ><strong>이달의 인기 일정/여행지&nbsp;🎈</strong></h1>
	<br><br>

	<div class="image">
		<figure>
				<a href="blog_detail.jsp"><img src = 'jeju.jpg' width="220" height="220" hspace="10" ></a>
			<figcaption>&nbsp;&nbsp;제주도 2박3일&nbsp;&nbsp;&nbsp;
								<img src='heart.png' width= "20" height ="20" align="middle">
			</figcaption>
		</figure>
	</div>
	
	<div class="image">
		<figure>
				<a href="blog_detail.jsp"><img src = 'lake.jpg' width="220" height="220" hspace="10"></a>
			<figcaption>&nbsp;&nbsp;서울 1박 2일&nbsp;&nbsp;&nbsp;
								<img src='heart.png' width= "20" height ="20" align="middle">
			</figcaption>
		</figure>
	</div>
		
	<div class="image">
		<figure>
					<a href="blog_detail.jsp"><img src = 'pink.jpg' width="220" height="220" hspace="10"></a>
			<figcaption>
					&nbsp;&nbsp;경주 핑크뮬리&nbsp;&nbsp;&nbsp;
					<img src='heart.png' width= "20" height ="20" align="middle">
			</figcaption>
		</figure>
	</div>
	
	<div class="image">
		<figure>
				 <a href="blog_detail.jsp"><img src = 'tree.jpg' width="220" height="220" hspace="10"></a>
			<figcaption>
					&nbsp;&nbsp;서울 당일치기&nbsp;&nbsp;&nbsp;
				<img src='heart.png' width= "20" height ="20" align="middle"></figcaption>
			</figure>
	</div>	
	
	<div class="clear">
		<a href='scheduleboardlist.jsp'><button  class="button" >더보기</button></a>
	</div>

<!-- ----------------------------------------------------------------------------------------------------------------------- -->	
	
	<!--  여묻 소식 -->
	<br>
	<br>
	<br>
	<h1 class="title"><strong>여묻 소식 TOP 5&nbsp;📢</strong></h1>
	<br>
	<br>
	<br>
	
	<table class="table " style="width:900px; height: 250px; margin-left:200px;">
		<col width="20"><col width="300"><col width="20">
		<thead style="background-color:#DCE2F0; color:#50586C; border:0px solid;">
		<tr align="center">
			<th>번호</th>
			<th>제목</th>
			<th>조회수</th>
		</tr>
		</thead>
<%
	BlogDao dao = new BlogDao();
	List<BlognewsboardDto> list = dao.toprank();
	
	for(int i=0; i<5; i++){
		
	
%>
		<tr align="center">
			<td><%=list.get(i).getSeq()%></td>
			<td><a href="selectone.jsp?seq=<%=list.get(i).getSeq()%>"><%=list.get(i).getTitle() %></a></td>
			<td><%=list.get(i).getViewcnt() %></td>
		</tr>
<%
	}
%>		
	</table>
	
	<br>
	<br>
	<div class="clear">
	<a href="newslist.jsp"><button class="button">더보기</button></a>
	</div>

<!-- ----------------------------------------------------------------------------------------------------------------------- -->
	<br>
	<br>
	<br>
	<h1 class="title"><strong>나의 일정&nbsp;💬</strong></h1>
	<br>
	<br>
	<div style=
	"margin-left:200px;  background:#DCE2F0; height: 200px; width: 900px; text-align:center;
	line-height:100px;font-size:15px; color:#50586C;" >
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