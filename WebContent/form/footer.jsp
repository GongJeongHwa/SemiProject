<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<style type="text/css">
	#footer{
		background-color: rgb(200, 250, 230);
	}
	#footer a{
		text-decoration: none;
		color : black;
	}
</style>


</head>
<body>
	<div id="footer">
		<div class="container" style="text-align: left; font-size: 10pt;">
			<br><br><br>
			<div class="row">
				<div class="col-lg-3">
					<a href=""><b>소개</b></a><br><br>
					<a href="">여묻</a><br><br>
					<a href="">여묻 이용방법</a><br><br>
					<a href="<%=request.getContextPath()%>/schedule/createSchedule.jsp">여행일정 만들기</a><br><br>
				</div>
				<div class="col-lg-3">
					<a href=""><b>커뮤니티</b></a><br><br>
					<a href="<%=request.getContextPath()%>/blog/blog_main.jsp">여행 블로그</a><br><br>
					<a href="<%=request.getContextPath()%>/companion/companionMain.jsp">동행 구하기</a><br><br>
				</div>
				<div class="col-lg-3">
					<a href=""><b>내 정보</b></a><br><br>
					<a href="<%=request.getContextPath()%>/user/mypage.jsp">마이페이지</a><br><br>
					<a href="">내 여행리스트</a><br><br>
					<a href="">내 쪽지함</a><br><br>
				</div>
				<div class="col-lg-3">
					<a href=""><b>지원</b></a><br><br>
					<a href="">도움말 센터</a><br><br>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="row" style="text-align: center;">
				<div class="col-lg-12"><a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/img/logo_tree.png" width="45" height="55"></a></div>
			</div>
			<div class="row">
				<div class="col-lg-12"><hr style="color:gray;"></div>
			</div>
			<div class="row">
				<div class="col-lg-6" style="text-align: left;">
					© 2021 yeomud, Inc &nbsp;&nbsp;
					· &nbsp;개인정보 처리방침 &nbsp;&nbsp;
					· &nbsp;이용약관 &nbsp;&nbsp;
				</div>
				<div class="col-lg-6" style="text-align: right;">
					<img src="<%=request.getContextPath()%>/img/icons/facebook.svg" alt="Bootstrap" width="21" height="21">&nbsp;&nbsp;
					<img src="<%=request.getContextPath()%>/img/icons/youtube.svg" alt="Bootstrap" width="21" height="21">&nbsp;&nbsp;
					<img src="<%=request.getContextPath()%>/img/icons/twitter.svg" alt="Bootstrap" width="21" height="21">
				</div>
			</div>
			<br>
		</div>
	</div>

</body>
</html>