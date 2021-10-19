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

	<br>
	<br>
	<h5><strong>님의 일정 살펴보기</strong></h5>
	<br>
	<br>
	
	
	<div class="date">
	21.10.01
	</div>
	
	<br>
	<br>
	
	<div class="schedule" id="one" >
		<img src = 'jeju.jpg' width="100" height="100" hspace="10" >
		<img src = 'rightarrow.png' width="20" height="20">
			<figure>
				<figcaption>&nbsp;바다</figcaption>
			</figure>
	</div>
	
		<div class="schedule" >
		<img src = 'jeju.jpg' width="100" height="100" hspace="10" >
		<img src = 'rightarrow.png' width="20" height="20">
			<figure>
				<figcaption>&nbsp;바다</figcaption>
			</figure>
	</div>

		<div class="schedule">
		<img src = 'jeju.jpg' width="100" height="100" hspace="10" >
		<img src = 'rightarrow.png' width="20" height="20">
			<figure>
				<figcaption>&nbsp;바다</figcaption>
			</figure>
	</div>	

		<div class="schedule">
		<img src = 'jeju.jpg' width="100" height="100" hspace="10" >
		<img src = 'rightarrow.png' width="20" height="20">
			<figure>
				<figcaption>&nbsp;바다</figcaption>
			</figure>
	</div>
	
			<div class="schedule">
		<img src = 'jeju.jpg' width="100" height="100" hspace="10" >
		<img src = 'rightarrow.png' width="20" height="20">
			<figure>
				<figcaption>&nbsp;바다</figcaption>
			</figure>
	</div>
	
			<div class="schedule" id="last">
		<img src = 'jeju.jpg' width="100" height="100" hspace="10" >
			<figure>
				<figcaption>&nbsp;바다</figcaption>
			</figure>
	</div>		
	
	<div class="clear">
	</div>
	
	
	<br>
	<br>
	
	<div class="date">
	21.10.02
	</div>
	<br>
	<br>
	
	<div class="date">
	21.10.03
	</div>
	<br>
	<br>
	
	
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

<!-- 	<div id="form-commentInfo">
		<div id="comment-count">댓글 
			<span id="count">0</span>
		</div> 
		<input id="comment-input" placeholder="댓글을 입력해 주세요."> 
		<button id="submit">등록</button> 
	</div>
	<div id=comments>
	</div> 
	
	 -->
	

	<br>
	<br>















	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
</body>
</html>