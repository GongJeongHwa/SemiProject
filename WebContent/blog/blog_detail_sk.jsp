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


.clear{
clear: left;
}

.schedule{
float: left; 
}

.clear{
clear: left;
}

#one{
margin-left: 200px;
}
</style>
  <script type="text/javascript">
        	function func_prompt () {
        		var comment = prompt("메시지를 입력해주세요.")
        		
        		if(comment==false){
        			alert("메시지를 입력해주세요.");
        		}
        	}
   </script>     	
<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<h3><span id="userid"></span>님의 일정 살펴보기</h3>
			</div>
			<div class="col-lg-8" style="text-align: right;">
				작성일&nbsp;<span id="createDate"></span>&nbsp;|&nbsp;
				조회수&nbsp;<span id="hits"></span>
			</div>
		</div>
		
		<div class="row">
			<hr>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<p id="title">title</p>
			</div>
			<div class="col-lg-12">
				<p id="content">content</p>
			</div>					
		</div>
		<div class="row">
					
		</div>
		<br>
		
	</div>
	
	
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12">2021-11-11</div>
			<div class="col-lg-12">일정 1</div>
		</div>
		<div class="row">
			<div class="col-lg-12">2021-11-11</div>
			<div class="col-lg-12">일정 2</div>
		</div>
		<div class="row">
			<div class="col-lg-12">2021-11-11</div>
			<div class="col-lg-12">일정 3</div>
		</div>
	</div>



	
	
	<br>
	<br>
	<div style="margin-right:20px;">
	  	<input type="button" style="float: right;" value="동행신청하기" onclick="func_prompt()" />
		<a href='scheduleboardlist.jsp'><button style="float: right; margin-right:20px">돌아가기</button>&nbsp;</a>
	</div>
	
	<div class="clear">
	</div>
	
	<br>
	<br>




	 	<div id="form-commentInfo">
		<div id="comment-count">댓글 
			<span id="count">0</span>
		</div> 
		<input id="comment-input" placeholder="댓글을 입력해 주세요."> 
		<button id="submit">등록</button> 
	</div>
	<div id=comments>
	</div> 
	
	 
	

	<br>
	<br>















	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
</body>
</html>