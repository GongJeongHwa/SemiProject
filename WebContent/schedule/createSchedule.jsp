<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
<title>createSchedule</title>


     <style>    

	#rowbelow{background-color:#FFFAF0;text-align:center;}
    #scroll{overflow: auto;width:300px;height:500px;}
    #scroll2{overflow: auto;width:300px;height:500px;}
   	#scroll3{overflow: auto;width:300px;height:500px;}
   	
    </style>
    
</head>


<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
<br><br><br>

     
     
     <!-- map -->
    <div class="container">
		<div class="col-sm-8" style="width:100%">
			<%@ include file="./maps3.jsp" %>
		</div>	
			
	<!-- schedule -->		
	<div class="container">		
		<div class="col-sm-12" style="height:400px; width:100%; overflow-x:scroll; float:right; "><br><br>
			<form>
      		<input type="date" id="date" onchange="dateChange();" style="font-size:12px; float:right"; /><br>
      		<input id="input_submit" type="submit" value="add" onclick="input();" style="padding:5px 3px; float:right"/>
      		<input type="button" value="done" onclick="doneButton();" style="padding:5px 3px; float:right" />
   			</form><br><br> 
   			 <p style="text-align:center" id="temp"></p><br>
   			 <div><%@ include file="droptest.html" %></div>
	</div>
		 		
		</div>
	</div>
 
    <div style="width:100%; height:600px"></div>s

 
	<!-- 하단 3컬럼 -->
	<div class="container">
		<div class="row" id="rowbelow"> 
			<!-- 컬럼1: hotel -->
			<div class="col" id="scroll">
			<br><br><h3>HOTEL</h3><br>
				
			<!-- table start -->
			<table class="table" data-bs-toggle="modal" data-bs-target="#exampleModal">
  			<thead>
    		<tr>
      			<th colspan="2"><b>Hilton hotel seoul</b></th>
    		</tr>
  			</thead>
  			<tbody>
    		<tr>
		      <td><img src="img/hilton.jpg" width=90% style="top:20px; position:relative" ></td>
		      <td>Complimentary breakfast and Wi-Fi, sustainable practices, and great hotel design are just some of the reasons that make Hilton brands stand out.<br><br></td>
		    </tr>
			 </tbody>
			</table>
			
			<!-- table copy2 -->
						<table class="table" data-bs-toggle="modal" data-bs-target="#exampleModal">
  			<thead>
    		<tr>
      			<th colspan="2"><b>Hilton hotel seoul</b></th>
    		</tr>
  			</thead>
  			<tbody>
    		<tr>
		      <td><img src="./hilton.jpg" width=90% style="top:20px; position:relative" ></td>
		      <td>Complimentary breakfast and Wi-Fi, sustainable practices, and great hotel design are just some of the reasons that make Hilton brands stand out.<br><br></td>
		    </tr>
			 </tbody>
			</table>
			
			<!--  table copy3 -->
			<table class="table" data-bs-toggle="modal" data-bs-target="#exampleModal">
  			<thead>
    		<tr>
      			<th colspan="2"><b>Hilton hotel seoul</b></th>
    		</tr>
  			</thead>
  			<tbody>
    		<tr>
		      <td><img src="./hilton.jpg" width=90% style="top:20px; position:relative" ></td>
		      <td>Complimentary breakfast and Wi-Fi, sustainable practices, and great hotel design are just some of the reasons that make Hilton brands stand out.<br><br></td>
		    </tr>
			 </tbody>
			</table>
			
			<!--  table copy4 -->

<!-- Button modal   class는 배경색 결정, primary넣으면 파란색이니 그냥 속성을 지움(투명배경) / data-bs-toggle속성이 팝업을 부여, target으로 열 팝업창을 연결
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  modal
</button>-->




<!-- Modal start-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Hilton Hotel Seoul</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      		<div>
      		<br>
      		<img src="./hilton.jpg" width=100%>
      		<p><br>Hilton Hotels and Resorts is Hilton's flagship brand and one of the largest hotel brands in the world. The brand is targeted at both business and leisure travelers with locations in major city centers, near airports, convention centers, and popular vacation destinations around the world</p>
      		<hr>
      		<a href="https://www.hilton.com/en/">go to web site</a>
      		<hr>
      		<p>review</p>
      		
      		</div>
      		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Add</button>
        <button type="button" class="btn btn-third">Like</button>
      </div>
    </div>
  </div>
</div>
<!-- modal end -->

			</div>
		
			<!-- 컬럼2: place -->
			<div class="col" id="scroll2">
				<br><br><h3>PLACE</h3><br>
				
				<!-- table start -->
				<table class="table" data-bs-toggle="modal" data-bs-target="#exampleModal">
  				<thead>
			    <tr>
			      <th colspan="2"><b>Mt.Halla</b></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td><img src="./halla.jpg" width=90% style="top:20px; position:relative"></td>
			      <td>Hallasan is the highest mountain in South Korea and is worshipped by people as they believe that gods and spirits live on the mountain.<br><br></td>
			    </tr>
			  </tbody>
			</table>
			
			<!-- table copy1 -->
				<table class="table" data-bs-toggle="modal" data-bs-target="#exampleModal">
  				<thead>
			    <tr>
			      <th colspan="2"><b>Mt.Halla</b></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td><img src="./halla.jpg" width=90% style="top:20px; position:relative"></td>
			      <td>Hallasan is the highest mountain in South Korea and is worshipped by people as they believe that gods and spirits live on the mountain.<br><br></td>
			    </tr>
			  </tbody>
			</table>
			
			<!-- table copy2 -->
				<table class="table" data-bs-toggle="modal" data-bs-target="#exampleModal">
  				<thead>
			    <tr>
			      <th colspan="2"><b>Mt.Halla</b></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td><img src="./halla.jpg" width=90% style="top:20px; position:relative"></td>
			      <td>Hallasan is the highest mountain in South Korea and is worshipped by people as they believe that gods and spirits live on the mountain.<br><br></td>
			    </tr>
			  </tbody>
			</table>
			
			<!-- table copy3 -->
				<table class="table" data-bs-toggle="modal" data-bs-target="#exampleModal">
  				<thead>
			    <tr>
			      <th colspan="2"><b>Mt.Halla</b></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td><img src="./halla.jpg" width=90% style="top:20px; position:relative"></td>
			      <td>Hallasan is the highest mountain in South Korea and is worshipped by people as they believe that gods and spirits live on the mountain.<br><br></td>
			    </tr>
			  </tbody>
			</table>			
  			</div>
  			
  			
  			<!-- 컬럼3: restaurant -->
			<div class="col" id="scroll3">
			<br><br><h3>RESTAURANT</h3><br>
			
			<!-- table start -->
			<table class="table" data-bs-toggle="modal" data-bs-target="#exampleModal">
			  <thead>
			    <tr>
			      <th colspan="2"><b>SUNNY GARDEN</b></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td><img src="./rest.jpg" width=90% style="top:20px; position:relative"></td>
			      <td>$$$$BarbecueAsianKorean<br>3208, 1100-ro, Jeju, Jeju Island 63091 South Korea+82 64-744-1000+ Add website+ Add hours
			      <br></td>
			    </tr>
			  </tbody>
			</table>
			<!-- table copy1 -->
			<table class="table" data-bs-toggle="modal" data-bs-target="#exampleModal">
			  <thead>
			    <tr>
			      <th colspan="2"><b>SUNNY GARDEN</b></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td><img src="./rest.jpg" width=90% style="top:20px; position:relative"></td>
			      <td>$$$$BarbecueAsianKorean<br>3208, 1100-ro, Jeju, Jeju Island 63091 South Korea+82 64-744-1000+ Add website+ Add hours
			      <br></td>
			    </tr>
			  </tbody>
			</table>			
			<!-- table copy2 -->
			<table class="table" data-bs-toggle="modal" data-bs-target="#exampleModal">
			  <thead>
			    <tr>
			      <th colspan="2"><b>SUNNY GARDEN</b></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td><img src="./rest.jpg" width=90% style="top:20px; position:relative"></td>
			      <td>$$$$BarbecueAsianKorean<br>3208, 1100-ro, Jeju, Jeju Island 63091 South Korea+82 64-744-1000+ Add website+ Add hours
			      <br></td>
			    </tr>
			  </tbody>
			</table>			   
		
		</div>
			
			
			<!-- modal javascript-->
			<script type="text/javascript">
			var myModal = document.getElementById('myModal')
			var myInput = document.getElementById('myInput')
			myModal.addEventListener('shown.bs.modal', function () {
  				myInput.focus()
					})
			</script>
			
			<!-- date javascript -->
			<script>
     		 var dateChange = () => {  
        	$("#temp").text($("#date").val()+"의 일정");};
     	   </script>
    
		 
		</div>
</div>

 
 
	
<br><br><br><br><br><br><br><br><br><br>




	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
</body>
</html>