<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style type="text/css">
.center {
	margin-top: 10px width: 250px;
}
#body {
	width:100%;
}
.section {
	width: 100%;
	height:450px;
}
#sectionLeft {
	font-size: large;
	font-weight: bold;
}
.sample {
	width:70%;
	height:400px;
	border-radius:10px;
	opacity:1;
}
#sectionRight {
	background-image: url("<%=request.getContextPath()%>/img/companion/sample3.jpeg");
	background-size: 80% 80%;
}
</style>
<script type="text/javascript">
	function findCompanion() {
		location.href="#";
	}
	
</script>
<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
	
	<div id="body">
		<div id="sectionLeft" class="section" style="background-color:black; color:white;">
			<div class="display-4 text-center">
				<br><br>
				<b style="letter-spacing:10px; line-height:100px;">
					혼자일때 보다<br>
					누군가와 함께하고 싶을 순간
					</b>
			</div>
		</div>
	</div>
	<div style="margin:30px; margin-top:150px;">
		<div class="container" style="height:100%">
			<div class="row">
				<div class="col-md-12 text-center">
					<h1 class="display-4" style="line-height:100px;"><b>지금 함께할<br>여행메이트를 찾아볼까요?</b></h1><br>
				</div>
			</div>
			<div class="row">
		        <div class="col-md-4 text-center">
		        	<img class="sample img-responsive" alt="샘플1" src="../img/companion/sample2.jpeg">
		        	<div>아름다운 세부의 리조트에서</div>
		       		
		        </div>
		        <div class="col-md-4 text-center">
		       		<img class="sample img-responsive" alt="샘플1" src="../img/companion/companion2.png">
		       		<div>프로도와 함께하는 반지원정대</div>
		        </div>
		        <div class="col-md-4 text-center">
		        	<img class="sample img-responsive" alt="샘플1" src="../img/companion/companion3.jpeg">
		        	<div>8박 9일 매력넘치는 파리여행!</div>
		        </div>
		    </div>
		    <div class="row">
				<div class="col-md-12 text-center" style="padding-top:30px;">
					<button type="button" class="btn-primary btn-lg" onclick="findCompanion();">동행 찾으러가기!</button>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div id="guideSection" class="container-fluid" style="margin-top:100px;">
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