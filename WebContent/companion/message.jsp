<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./companion/css/massageCss.css" rel="stylesheet" type="text/css"/>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.trash:hover {
	cursor:pointer;
}
</style>
<script type="text/javascript">
function deleteMessage(obj) {
	var con_id = $(obj).siblings("span").text();
	
	if (confirm("상대방과 연결을 끊으시겠습니까?")) {
		alert("삭제된 대화는 삭제된 메세지에서 확인할 수 있습니다.\n삭제된 지 15일 이후 모든 메세지는 삭제됩니다.");
		
		$.ajax({
			url:"message.do?command=deleteMessage&con_id="+con_id,
			success: function() {
				$(obj).parents("."+con_id).css({"display":"none"});
				$(obj).parents("."+con_id).siblings("."+con_id).css({"display":"none"});
			}
		});
	} 
}

$(function() {
	$("#close-button").click(function() {
		$(".alert-message").css("display","none");
	});
	
	$("#bell").click(function() {
		$(".alert-message").css("display","block");
		$("#liTitle").html("");
		$.ajax({
			url: "message.do?command=askConnect",
			dataType: "json",
			success: function(msg) {
				var json = msg;
				
				$.each(json, function(key, value) {
					$("#liTitle").append(
							"<li> <div class='firstDiv'> <div class='secondDiv'>" + 
							"<div class='userImg' style='display:none;'>" + value[3] + "</div>" +
							"<img class='connect-pic' alt='user' src='./img/user/" + value[3] + ".png'>" +
							"</div> <div class='thirdDiv'> <span id='ask_name' class='ask_nameSpan'>" + value[0] + "</span>" + 
							"<span id<='ask_time' class='ask_timeSpan'>" + value[2] + "</span> </div>" +
							"<div id='ask_comment' class='fourthDiv'>" + value[1] + "</div> <div class='fifthDiv'>" + 
							"<button class='alert-button' onclick='askPermit(this);'>수락</button> <button class='alert-button' onclick='askDenied(this);'>거절</button>" +
							"</div> </div> </li>");
				});
			}
		});
	});
});

function deleteMessageTab() {
	$("#tbody").html("");
	$.ajax({
		url:"message.do?command=deleteMessageTab",
		dataType: "json",
		success: function(msg) {
			var json = msg;
			$.each(json, function(key, value) {
				$("#tbody").append(
						"<tr class='"+value[0]+"' style='padding:10px;'>" +
						"<td rowspan='2' style='text-align:center;'><img class='listpic' alt='profile' src='./img/user/" + value[2] + ".png'></td>" +
						"<td colspan='2' class='fw-bold'>"+value[0]+"</td>" +
						"</tr>" +
						"<tr class='"+value[0]+"' style='padding:10px;'>" +
						"<td><a href='message.do?command=detailMessage&sen_id="+value[0]+"' class='message'>"+value[1]+"</a></td>" +
						"<td style='padding-left:25px;'>" +
						"<span class='sen-id' style='display:none;'>"+value[0]+"</span>" +
						"<img class='trash' alt='trash' src='./img/companion/trash.png'>" +
						"</td>" +
						"</tr>"
				);
			});
		}
	});
}

function messageTab() {
	$("#tbody").html("");
	$.ajax({
		url:"message.do?command=currentMessageTab",
		dataType: "json",
		success: function(msg) {
			var json = msg;
			$.each(json, function(key, value) {
				$("#tbody").append(
						"<tr class='"+value[0]+"' style='padding:10px;'>" +
						"<td rowspan='2' style='text-align:center;'><img class='listpic' alt='profile' src='./img/user/" + value[2] + ".png'></td>" +
						"<td colspan='2' class='fw-bold'>"+value[0]+"</td>" +
						"</tr>" +
						"<tr class='"+value[0]+"' style='padding:10px;'>" +
						"<td><a href='message.do?command=detailMessage&sen_id="+value[0]+"' class='message'>"+value[1]+"</a></td>" +
						"<td style='padding-left:25px;'>" +
						"<span class='sen-id' style='display:none;'>"+value[0]+"</span>" +
						"<img class='trash' alt='trash' src='./img/companion/trash.png' onclick='deleteMessage(this);'>" +
						"</td>" +
						"</tr>"
				);
			});
		}
	});
}

function askPermit(obj) {
	var id = $(obj).parent(".fifthDiv").siblings(".thirdDiv").children("#ask_name").text();
	var message = $(obj).parent(".fifthDiv").siblings(".fourthDiv").text();
	var userImg = $(obj).parent(".fifthDiv").siblings(".secondDiv").children(".userImg").text();
	
	$.ajax({
		url:"message.do?command=askPermit&id="+id+"&message="+message,
		success: function(msg) {
			alert(id+"님과 연결되었습니다. 행복한 추억을 만들어보세요!");
			$(obj).parent(".fifthDiv").parent(".firstDiv").css({"display":"none"});
			$("#tbody").append(
					"<tr class='"+id+"' style='padding:10px;'>" +
					"<td rowspan='2' style='text-align:center;'><img class='listpic' alt='profile' src='./img/user/" + userImg + ".png'></td>" +
					"<td colspan='2' class='fw-bold'>"+id+"</td>" +
					"</tr>" +
					"<tr class='"+id+"' style='padding:10px;'>" +
					"<td><a href='message.do?command=detailMessage&sen_id="+id+"' class='message'>"+message+"</a></td>" +
					"<td style='padding-left:25px;'>" +
					"<span class='sen-id' style='display:none;'>"+id+"</span>" +
					"<img class='trash' alt='trash' src='./img/companion/trash.png' onclick='deleteMessage(this);'>" +
					"</td>" +
					"</tr>"
			);
		}
	});
}

function askDenied(obj) {
	var id = $(obj).parent(".fifthDiv").siblings(".thirdDiv").children("#ask_name").text();
	
	$.ajax({
		url:"message.do?command=askDenied&id="+id,
		success:function(msg) {
			alert(id+"님의 동행요청을 거절하셨습니다");
			$(obj).parent(".fifthDiv").parent(".firstDiv").css({"display":"none"});
		}
	});
}
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
	    	<div class="alert-message">
	    		<img id="close-button" alt="close" src="./img/companion/close.png">
	    		<ul style="list-style:none; padding-left:0px; margin-bottom:3px; border-radius:10px;">	
	    			<li style="text-align:center; margin:2%;">
	    				<span style="letter-spacing:3px; font-size:larger;">동행 요청</span>
	    			</li>
	    			<li id="liTitle">
	    			</li>
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
		        				<a class="navbar-brand" id="messageTab"style="color:black; margin:auto;" onclick="messageTab();">메세지</a>
		        			</td>
		        			<td style="padding:25px;">
		        				<a class="navbar-brand" id="deleteTab" style="color:black;" onclick="deleteMessageTab();">삭제된 메세지</a>
		        			</td>
		        			<td style="padding:25px;">
		        				<!-- 벨 클릭 시 동행신청 리스트 나와야함 -->
		        				<!-- 새로운 신청이 왔을 때 어떻게 처리할 지 고민해보기 -->
		        				<img id="bell" alt="bell" src="./img/companion/idea.png">
		        			</td>
		        		</tr>
		        	</thead>
		        	<tbody id="tbody">
		        		<!-- tr태그 2개 하나에 한 셋트 -->
		        		<!-- 메세지 노출은 글자수 제한 걸어놔야함. 일정 글자수 넘어가면 ...으로 나오도록 처리해야함 -->
		        		<c:forEach var="list" items="${conList}">
		        		<tr class="${list.sen_id}" style="padding:10px;">
		        			<td rowspan="2" style="text-align:center;">
		        				<img class="listpic" alt="profile" src="./img/user/${list.sender_img}.png">
		        			</td>
		        			<td colspan="2" class="fw-bold">${list.sen_id}</td>
		        		</tr>
		        		<tr class="${list.sen_id}" style="padding:10px;">
		        			<td>
		        				<a href="message.do?command=detailMessage&sen_id=${list.sen_id}" class="message">${list.message}</a>
		        			</td>
		        			<td style="padding-left:25px;">
		        				<!-- 삭제 버튼 클릭 시 삭제된 메세지로 이동 -->
		        				<span class="sen-id" style="display:none;">${list.sen_id}</span>
		        				<img class="trash" alt="trash" src="./img/companion/trash.png" onclick="deleteMessage(this);">
		        			</td>
		        		</tr>
		        		</c:forEach>
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