
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<script type="text/javascript">
	var length = 6;
	var idx = 1;
	var slide = 6000;
	var path = "<%=request.getContextPath()%>/img/back";
	window.onload = setTimeout(changePicture, 4000);

	function changePicture() {
		
		idx = (idx + 1)%length == 0? length : (idx + 1)%length;
		
		var ipath = path + idx + ".jpg";
		
		$("#img").animate({opacity:0}, 800, function(){
			$("#img").css('backgroundImage', function(){
				return "url(" + ipath+ ")";
			});
		});
		
		$("#img").animate({opacity:1}, 800);
		window.setTimeout(changePicture, slide);
	}
</script>

<style type="text/css">
#img {
	background-image: url("<%=request.getContextPath()%>/img/back1.jpg");
	background-size: 100% 100%;
}


</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>


</head>
<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="./form/header.jsp"%>
	</div>

	<div class="container-fluid" id="img" style="width: 100%; height:800px;">
	
	
	
	</div>

	<br>
	
	
	<div class="
	container">
		<div id="header">
		
			<%@ include file="./maps.jsp"%>
		</div>
		
	</div>
	<br>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 고정(푸터) -->	
	<div id="footer">
		<%@ include file="./form/footer.jsp"%>
	</div>


</body>
</html>