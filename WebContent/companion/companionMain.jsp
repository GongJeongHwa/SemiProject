<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="../index.js"></script>
<link rel="stylesheet" type="text/css" href="../index.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.center {
	margin-top: 10px width: 250px;
}

#body {
	width: 100%;
}

.section {
	width: 100%;
	height: 500px;
	margin-bottom:100px;
}

#sectionLeft {
	font-size: large;
	font-weight: bold;
}

.sample {
	width: 70%;
	height: 400px;
	border-radius: 10px;
	opacity: 1;
}

#sectionRight {
	background-image:
		url("<%=request.getContextPath()%>/img/companion/sample3.jpeg");
	background-size: 80% 80%;
}
#img3 {
	width: 100%;
	background-size: 100% 100%;
}
</style>

<script type="text/javascript">
	function findCompanion() {
		location.href = "#";
	}
</script>

<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>

	<div id="body">
		<div id="sectionLeft" class="section"
			style="background-color:rgb(224, 210, 210); color:black">
			<div class="display-4 text-center">
				<br><br> <b
					style="letter-spacing: 10px; line-height: 100px;"> 혼자일때 보다<br>
					누군가와 함께하고 싶을 순간
				</b>
			</div>
		</div>
	</div>
	<div class="container-fluid" id="img3" style="padding: 7%;">
		<div class="row">
			<h1 class="display-5" style="text-align: center;"><b>지금 함께할 여행메이트를 찾아보세요!</b></h1>
		</div>
		<br><br>
		<div class="row align-items-center">
			<!-- 썸네일1 -->
			<div class="col-lg-3" style="float: none; margin: 0 auto;">
				<div class="card img-thumbnail" id="left_thumbnail">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="" class="card-img-top embed-responsive-item"
							width="100%" height="350px;">
					</div>
					<div class="card-body" style="padding: 15px;">
						<p></p>
						<div style="font-size: 11pt;">
							<span></span><br>여행지 : <b></b>
						</div>
						<hr style="color: gray;">
						<h6 class="card-title" id="title"></h6>
						<p id="content"></p>
						<div style="float: left;">
							<img src="../img/icons/heart-fill.svg" alt="Bootstrap" width="21"
								height="21"> <span
								style="font-weight: bold; font-size: 12pt;"></span> &nbsp; <img
								src="../img/icons/chat-right-dots.svg" alt="Bootstrap"
								width="21" height="21"> <span
								style="font-weight: bold; font-size: 12pt;"></span> &nbsp; <img
								src="../img/icons/eye-fill.svg" alt="Bootstrap" width="21"
								height="21"> <span
								style="font-weight: bold; font-size: 12pt;"></span> &nbsp;
						</div>
						<div style="float: right;">
							<button type="button" class="detail" onclick="">상세보기</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 썸네일2 -->
			<div class="col-lg-3" style="float: none; margin: 0 auto;">
				<div class="card img-thumbnail">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="" class="card-img-top embed-responsive-item"
							width="100%" height="350px;">
					</div>
					<div class="card-body" style="padding: 15px;">
						<p></p>
						<div style="font-size: 11pt;">
							<span></span><br>여행지 : <b></b>
						</div>
						<hr style="color: gray;">
						<h6 class="card-title" id="title"></h6>
						<p id="content"></p>
						<div style="float: left;">
							<img src="../img/icons/heart-fill.svg" alt="Bootstrap" width="21"
								height="21"> <span
								style="font-weight: bold; font-size: 12pt;"></span> &nbsp; <img
								src="../img/icons/chat-right-dots.svg" alt="Bootstrap"
								width="21" height="21"> <span
								style="font-weight: bold; font-size: 12pt;"></span> &nbsp; <img
								src="../img/icons/eye-fill.svg" alt="Bootstrap" width="21"
								height="21"> <span
								style="font-weight: bold; font-size: 12pt;"></span> &nbsp;
						</div>
						<div style="float: right;">
							<button type="button" class="detail" onclick="">상세보기</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 썸네일3 -->
			<div class="col-lg-3" style="float: none; margin: 0 auto;">
				<div class="card img-thumbnail" id="right_thumbnail">
					<div class="embed-responsive embed-responsive-4by3">
						<img src="" class="card-img-top embed-responsive-item"
							width="100%" height="350px;">
					</div>
					<div class="card-body" style="padding: 15px;">
						<p></p>
						<div style="font-size: 11pt;">
							<span></span><br>여행지 : <b></b>
						</div>
						<hr style="color: gray;">
						<h6 class="card-title" id="title"></h6>
						<p id="content"></p>
						<div style="float: left;">
							<img src="../img/icons/heart-fill.svg" alt="Bootstrap" width="21"
								height="21"> <span
								style="font-weight: bold; font-size: 12pt;"></span> &nbsp; <img
								src="../img/icons/chat-right-dots.svg" alt="Bootstrap"
								width="21" height="21"> <span
								style="font-weight: bold; font-size: 12pt;"></span> &nbsp; <img
								src="../img/icons/eye-fill.svg" alt="Bootstrap" width="21"
								height="21"> <span
								style="font-weight: bold; font-size: 12pt;"></span> &nbsp;
						</div>
						<div style="float: right;">
							<button type="button" class="detail" onclick="">상세보기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top:30px;">
				<div class="col-md-12 text-center" style="padding-top:30px;">
					<button type="button" class="btn-primary btn-lg" onclick="findCompanion();">동행 찾으러가기!</button>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div id="guideSection" class="container-fluid"
			style="margin-top: 100px;">
			<div class="text-center display-4">
				<b>이용하는법을 알아볼까요?</b>
				<!-- 이용하는 법 이미지 만들어서 넣자. -->
			</div>
		</div>
	</div>
	

	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>

</body>
</html>