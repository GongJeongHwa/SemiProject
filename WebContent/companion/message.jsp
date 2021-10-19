<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
table {
	width:100%;
}
#bell {
	width:25px;
	height:25px;
}
.trash {
	width:15px;
	height:15px;
}
.listpic {
	width: 45px;
	height: 45px;
}
.messenger-table {
	width:600px;
	margin:50px auto;
}
tr {
	height:40px;
}
.message {
	text-decoration:none;
	color:black;
	font-weight:lighter;
}
.memberName{
	text
}
.iconTd{
	padding:25px;
}

.alert-message{
	z-index:1;
	width:75%; 
	height:auto; 
	background-color:rgb(220, 226, 226); 
	position:absolute; 
	margin-left:19%;
	margin-top:8%;
	display:none;
	border-radius:10px;
	padding-bottom:5px;

}
.connect-pic{
	width:40px;
	height:40px;
	float:left;
	margin-top:15%;
	margin-left:25%;
}
.alert-button {
	width:45px;
	height:20px;
	font-size:10px;
	border-radius:10px;
	background-color:white;
	border:none;
}
#close-button {
	width:15px;
	height:15px;
	margin-left:95%;
}
#close-button:hover{
	cursor:pointer;
}
#bell:hover{
	cursor:pointer;
}
li {
	margin-bottom:10px;
}

</style>
<script type="text/javascript">
	$(function() {
		$("#close-button").click(function() {
			$(".alert-message").css("display","none");
		});
		$("#bell").click(function() {
			$(".alert-message").css("display","block");
		})
		$(".trash").click(function() {
			if (confirm("상대방과 연결을 끊으시겠습니까?")) {
				//메세지 삭제처리 -> 현재 목록에서 지우고 삭제된 대화방에 이동시켜야 함. (ACTIVE 'N' 처리 하자.)
				alert("삭제된 대화는 삭제된 메세지에서 확인할 수 있습니다.\n삭제된 지 15일 이후 모든 메세지는 삭제됩니다.");
			} else {
				
			}
		});
		
		$("#bell").click(function() {
			$.ajax({
				//세션 아이디 넣어줘야함 고민해보자.
				url: "message.do?command=askConnect&login_id=ADMIN",
				success: function(data) {
					console.log("통신성공");
					$.each(data, function(key, val) {
						if (key == "list") {
							console.log(val.SEN_ID);
						}
					});
				},
				error: function() {
					alert("통신 실패");
				}
			});
		});
	});
	
</script>
<body>
	<!-- request객체에 담겨서 넘어옴. request 객체 : connectList -->
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
	<hr>
	<div class="container-fluid">
	    <div class="messenger-table" style="">
	    	<div style="position:relative;">
	    	<!-- 이것 또한 ajax 구현 해야함 -->
	    	<div class="alert-message">
	    		<img id="close-button" alt="close" src="./img/companion/close.png">
	    		<ul style="list-style:none; padding-left:0px; margin-bottom:3px; border-radius:10px;">	
	    			<li style="text-align:center; margin:2%;">
	    				<span style="letter-spacing:3px; font-size:larger;">동행 요청</span>
	    			</li>
	    			<!-- 알림 목록 하나 시작 -->
	    			<li>
	    				<div style="width:100%; height:auto; background-color:rgb(220, 226, 226); border-radius:10px;">
	    					<div style="height:100%; width:20%; padding-top:2%">
	    						<img class="connect-pic" alt="user" src="./img/companion/french.png">
	    					</div>
	    					<div style="width:80%; height:auto; margin-left:17%;">
	    						<span id="ask_name" style="font-size:15px; letter-spacing:2px;">강동희</span>
	    						<span id="ask_time" style="margin-left:15px; font-size:12px;">10/17</span>
	    					</div>
	    					<div id="ask_comment" style="width:80%; height:auto; margin-left:17%; font-size:13px; letter-spacing:2px;">
	    						내일 세느강 산책 같이하실래요?
	    					</div>
	    					<div style="width:80%; height:auto; margin-left:17%;">
	    						<button class="alert-button">수락</button>
	    						<button class="alert-button">거절</button>
	    					</div>
	    				</div>
	    			</li>
	    			<!-- 알림 목록 하나 끝 -->
	    		</ul>
	    	</div>
		        <table>
		        	<colgroup>
		        		<col width="10%">
		        		<col width="80%">
		        		<col width="10%">
		        	</colgroup>
		        	<thead>
		        		<tr>
		        			<!-- 삭제된 메세지 탭은 삭제된 메세지가 있을 시 display block처리 -->
		        			<td style="padding:25px;">
		        				<a class="navbar-brand" style="color:black; margin:auto;" href="#">메세지</a>
		        			</td>
		        			<td style="padding:25px;">
		        				<a class="navbar-brand" style="color:black; display:none;" href="#">삭제된 메세지</a>
		        			</td>
		        			<td style="padding:25px;">
		        				<!-- 벨 클릭 시 동행신청 리스트 나와야함 -->
		        				<!-- 새로운 신청이 왔을 때 어떻게 처리할 지 고민해보기 -->
		        				<img id="bell" alt="bell" src="./img/companion/idea.png">
		        			</td>
		        		</tr>
		        	</thead>
		        	<tbody>
		        		<!-- tr태그 2개 하나에 한 셋트 -->
		        		<!-- 메세지 노출은 글자수 제한 걸어놔야함. 일정 글자수 넘어가면 ...으로 나오도록 처리해야함 -->
		        		<c:forEach var="list" items="${conList}">
		        		<tr style="padding:10px;" onclick="location.href='#'">
		        			<td rowspan="2" style="text-align:center;">
		        				<img class="listpic" alt="profile" src="./img/companion/french.png">
		        			</td>
		        			<td colspan="2" class="fw-bold">${list.sen_id}</td>
		        		</tr>
		        		<tr style="padding:10px;">
		        			<td>
		        				<a href="message.do?command=detailMessage&sen_id=${list.sen_id}" class="message">${list.message}</a>
		        			</td>
		        			<td style="padding-left:25px;">
		        				<a href="#">
		        					<!-- 삭제 버튼 클릭 시 삭제된 메세지로 이동 -->
		        					<img class="trash" alt="trash" src="./img/companion/trash.png">
		        				</a>
		        			</td>
		        		</tr>
		        		</c:forEach>
		        		<!-- 리스트 하나 종료 -->
		        		
		        	</tbody>
		        </table>
	        </div>
	    </div>
	</div>
	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
		
</body>
</html>