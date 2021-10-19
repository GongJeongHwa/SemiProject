<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#searchbtn{
  	text-align: center;
  	background-color: white;
  	border-radius: 23px;
  	padding: 8px;
  	width: 50px;
  	height: 50px;
}
#searchbtn:hover{
	background-color: rgb(105, 231, 175);
	border : 1px solid rgb(105, 231, 175);
}

.btn_{
	border: 1px solid gray;
	border-radius: 5px;
  	text-align: center;
  	background-color: white;
  	padding: 8px;
}
.btn_:hover{
	background-color: rgb(105, 231, 175);
	border : 1px solid rgb(105, 231, 175);
}
.detail{
	padding: 5px;
	padding-left: 10px;
	padding-right: 10px;
  	border: solid 1px gray;
  	background-color: white;
  	border-radius: 25px;
  	color: gray;
}
.img{
	cursor: pointer;
}

</style>

<%
	String keyword = request.getParameter("search");
%>

<script type="text/javascript">



</script>

</head>
<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="./form/header.jsp"%>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-xs-12" style="text-align: left;">
				<form class="box" action="" method="post" id="searchform">
					<input id="search" type="search" name="search"
						placeholder="키워드를 입력하세요." value="<%=keyword%>" aria-label="Search"
						autocomplete="off"
						style="width: 400px; height: 50px; border-radius: 30px; border: solid 1px #d3d3d3; outline: none; text-indent: 15px;">
					<button id="searchbtn" type="submit" style="border: solid 1px #d3d3d3;">
						<img src="./img/icons/search.svg" alt="Bootstrap" width="21" height="21">
					</button>
				</form>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-12" style="text-align: left;">
				추천 키워드 :
				<button type="button" class="detail" onclick="" value="hotel">호텔</button>
				&nbsp;&nbsp;
				<button type="button" class="detail" onclick="" value="food">맛집</button>
				&nbsp;&nbsp;
				<button type="button" class="detail" onclick="" value="tourist">관광지</button>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<hr>
			</div>
		</div>
		<div class="row row-cols-3">
			<div class="col" style="position:relative;">
				<img class="rounded" src="./img/background/back1.jpg" width="100%" height="100%">
				<figcaption>Real fairy Castle with pool. Ideal 4 wedding also</figcaption>
				
				<div style="position: absolute; top:10%; left:10%">
					<img class="img" data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="./img/icons/suit-heart.svg"alt="Bootstrap" width="27" height="27">
				</div>
			</div>
			<div class="col" style="position:relative;">
				<img class="rounded" src="./img/background/back2.jpg" width="100%" height="100%">
				<figcaption>Private Group Stay in Exclusive Fairytale Castle</figcaption>
				
				<div style="position: absolute; top:10%; left:10%">
					<img class="img" data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="./img/icons/suit-heart.svg"alt="Bootstrap" width="27" height="27">
				</div>
			</div>
			<div class="col" style="position:relative;">
				<img class="rounded" src="./img/background/back3.jpg" width="100%" height="100%">
				<figcaption>Medieval castle - bedroom - 70sqm - Florence 15km</figcaption>
				
				<div style="position: absolute; top:10%; left:10%">
					<img class="img" data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="./img/icons/suit-heart.svg"alt="Bootstrap" width="27" height="27">
				</div>
			</div>
		</div>
		<br><br>
		<div class="row row-cols-3">
			<div class="col" style="position:relative;">
				<img class="rounded" src="./img/background/back4.jpg" width="100%" height="100%">
				<figcaption>Real fairy Castle with pool. Ideal 4 wedding also</figcaption>
				
				<div style="position: absolute; top:10%; left:10%">
					<img class="img" data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="./img/icons/suit-heart.svg"alt="Bootstrap" width="27" height="27">
				</div>
			</div>
			<div class="col" style="position:relative;">
				<img class="rounded" src="./img/background/back5.jpg" width="100%" height="100%">
				<figcaption>Private Group Stay in Exclusive Fairytale Castle</figcaption>
				
				<div style="position: absolute; top:10%; left:10%">
					<img class="img" data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="./img/icons/suit-heart.svg"alt="Bootstrap" width="27" height="27">
				</div>
			</div>
			<div class="col" style="position:relative;">
				<img class="rounded" src="./img/background/back6.jpg" width="100%" height="100%">
				<figcaption>Medieval castle - bedroom - 70sqm - Florence 15km</figcaption>
				
				<div style="position: absolute; top:10%; left:10%">
					<img class="img" data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="./img/icons/suit-heart.svg"alt="Bootstrap" width="27" height="27">
				</div>
			</div>
		</div>
		<br><br>
		<div class="row row-cols-3">
			<div class="col" style="position:relative;">
				<img class="rounded" src="./img/background/back1.jpg" width="100%" height="100%">
				<figcaption>Real fairy Castle with pool. Ideal 4 wedding also</figcaption>
				
				<div style="position: absolute; top:10%; left:10%">
					<img class="img" data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="./img/icons/suit-heart.svg"alt="Bootstrap" width="27" height="27">
				</div>
			</div>
			<div class="col" style="position:relative;">
				<img class="rounded" src="./img/background/back2.jpg" width="100%" height="100%">
				<figcaption>Real fairy Castle with pool. Ideal 4 wedding also</figcaption>
				
				<div style="position: absolute; top:10%; left:10%">
					<img class="img" data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="./img/icons/suit-heart.svg"alt="Bootstrap" width="27" height="27">
				</div>
			</div>
			<div class="col" style="position:relative;">
				<img class="rounded" src="./img/background/back3.jpg" width="100%" height="100%">
				<figcaption>Real fairy Castle with pool. Ideal 4 wedding also</figcaption>
				
				<div style="position: absolute; top:10%; left:10%">
					<img class="img" data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="./img/icons/suit-heart.svg"alt="Bootstrap" width="27" height="27">
				</div>
			</div>
		</div>
		<br><br>
		<div class="row row-cols-3">
			<div class="col" style="position:relative;">
				<img class="rounded" src="./img/background/back4.jpg" width="100%" height="100%">
				<figcaption>Real fairy Castle with pool. Ideal 4 wedding also</figcaption>
				
				<div style="position: absolute; top:10%; left:10%">
					<img class="img" data-bs-toggle="modal" data-bs-target="#staticBackdrop" src="./img/icons/suit-heart.svg"alt="Bootstrap" width="27" height="27">
				</div>
			</div>
		</div>
		


	</div>
	
	
	
	
	
	
<div class="modal fade" style="height: 800px;" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Real fairy Castle with pool. Ideal 4 wedding also</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<img class="rounded" src="./img/background/back1.jpg" width="100%" height="100%">
        Amazing panoramic Castle with big pool. The property is surrounded by vineyards and olive groves! Located In the heart of Tuscany between Florence and Siena! A train station is just 1 Km away! Wifi always working in the entire property. Air Conditioning. 5 Double Bedrooms, 6 Bathrooms. A very big Living area ideal for events! Many terraces with view and an amazing big courtyard from where you have direct access to the small private church of the castle itself. Air Conditioning, Private Parking!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn" data-bs-dismiss="modal" style="outline: none;">닫기</button>
        <button type="button" class="btn_">찜 추가</button>
        <button type="button" class="btn_">여행일정에 담기</button>
      </div>
    </div>
  </div>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<br><br><br>
		<!-- 고정(푸터) -->	
	<div id="footer">
		<%@ include file="./form/footer.jsp"%>
	</div>
</body>
</html>