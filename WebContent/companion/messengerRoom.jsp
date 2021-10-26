<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mvc.dto.UserDto" %>
<%@ page import="com.mvc.dto.MessageDto" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<link href="./companion/css/messengerRoomCss.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
#check-promise {
	width:70%;
	height:auto;
	margin-left: 15%;
	margin-top: 8%;
	border-radius:10px;
	background-color:rgb(238, 222, 224);
	display:none;
	position: absolute;
	z-index:1;
}
.connect-pic {
	width:40px;
	height:40px;
	float:left;
	margin-top:15%;
	margin-left:20%;
}
.alert-button {
	width:45px;
	height:20px;
	font-size:10px;
	border-radius:10px;
	background-color:white;
	border:none;
}
#goMyPromise:hover {
	cursor:pointer;
}
#openPromise{
	cursor:pointer;
}
.check-ul {
list-style:none; 
padding-left:0px; 
margin-bottom:3px;
border-radius:10px;
}
.check-li-title{
text-align:center; margin:2%;
}
.check-title-span{
letter-spacing:3px; font-size:larger;
}
.check-imgdiv{
width:100%; height:auto; background-color:rgb(238, 222, 224); border-radius:10px;
}
.check-imgdiv2{
height:100%; width:10%; padding-top:2%
}
.check-infodiv{
width:80%; height:auto; margin-left:13%;
}
.check-infoname{
font-size:15px; letter-spacing:2px; font-weight:bold;
}
.check-infoloc{
margin-left:15px; font-size:12px;
}
.check-infolocData{
margin-left:2px; font-size:12px;
}
.check-infodate{
margin-left:15px; font-size:12px;
}
.check-infodateData{
margin-left:2px; font-size:12px;
}
.check-commentdiv{
width:80%; height:auto; margin-left:13%; font-size:13px; letter-spacing:2px;
}
.check-buttondiv{
width:80%; height:auto; margin-left:13%;
}
.check-li-goMy{
text-align:right; margin-top:10px; margin-bottom:10px;
}
#goMyPromise{
color:rgb(83, 67, 226); margin-right:20px; font-size:13px;
}
</style>
<%
	UserDto login_id = (UserDto)session.getAttribute("login_id");
	System.out.println("login_id : " + login_id.getUser_id());
	List<MessageDto> list = (List<MessageDto>)request.getAttribute("detailList");
	MessageDto con_id = list.get(list.size()-1);
%>
<script type="text/javascript" src="./companion/js/room.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	setInterval(function() {
		var con_id = document.getElementById("con_id").innerText;
		var idx = 0;
		$("#tbody").html("");
		$.ajax({
			url:"message.do?command=refresh&con_id="+con_id,
			dataType:"json",
			success:function(data) {
				var json = data;
				$.each(json, function(idx) {
					$("#tbody").append(
							"<tr> <td rowspan='2' class='firstTd'> <img id='pic' alt='profile' src='./img/user/" + json[idx].user_img + ".png'></td>" +
							"<td colspan='2'> <span id='sender' class='fw-bold spanSender'>" + json[idx].sen_id + "</span>" +
							"<span id='m_time' class='spanTime'>" + json[idx].time + "</span>" +
							"<img class='reportIcon' alt='report' src='./img/companion/report2.png' onclick='reportUser();'>" +
							"</td></tr>" +
							"<tr><td colspan='3' class='secondTd'><div id='getMessage' class='message'>" + json[idx].message + "</div>" +
							"</td></tr>"
					);
					idx = (idx+1)==json.length? 0 : (idx+1);
				});
			}
		});
	}, 15000);
});


$(function() {
	$("#inputMessage").on("keydown",function(event) {
		if (event.keyCode == 13) {
			if (!event.shiftKey) {
				event.preventDefault();
				messageFunction();
			}
		}
	});
});

function openPromiseTab() {
	$("#promiseList").html("");
	$.ajax({
		url:"message.do?command=getPromise",
		dataType:"json",
		success:function(data){
			var list = data;
			
			$.each(list, function(key, value) {
				$("#promiseList").append(
						"<div class='check-imgdiv'>" +
						"<div class='check-imgdiv2'>" +
						"<img class='connect-pic' alt='user' src='./img/user/" + value[4] + ".png'>" +
						"</div>" +
						"<div class='check-infodiv'>" +
						"<span id='ask-name' class='check-infoname'>"+value[0]+"</span>" +
						"<span class='check-infoloc'>장소: </span><span id='ask-loc' class='check-infolocData'>"+value[1]+"</span>" +
						"<span class='check-infodate'>날짜: </span><span id='ask-time' class='check-infodateData'>"+value[2]+"</span>" +
						"</div>" +
						"<div id='ask_comment' class='check-commentdiv'>"+value[3]+"</div>" +
						"<div class='check-buttondiv'>" +
						"<button class='alert-button' onclick='permitPromise(this);'>수락</button>" +
						"<button class='alert-button' onclick='denyPromise(this);'>거절</button>" +
						"</div>" +
						"</div>"
				);
			});
		}
	});
	$("#check-promise").css("display", "block");
}

function denyPromise(obj) {
	var id = $(obj).parent().siblings(".check-infodiv").children("#ask-name").text();
	var loc = $(obj).parent().siblings(".check-infodiv").children("#ask-loc").text();
	if (confirm("약속을 거절하시겠습니까?")) {
		$.ajax({
			url:"message.do?command=choicePromise",
			type:"post",
			data:{
				"con_id":id,
				"loc":loc,
				"permit":"N"
			},
			success:function(msg){
				$(obj).parent().parent(".check-imgdiv").css("display","none");
			}
		});
	}
}

function permitPromise(obj) {
	var id = $(obj).parent().siblings(".check-infodiv").children("#ask-name").text();
	var loc = $(obj).parent().siblings(".check-infodiv").children("#ask-loc").text();
	var time = $(obj).parent().siblings(".check-infodiv").children("#ask-time").text();
	var chat_serial = document.getElementById("chat_serial").innerText;
	var comment = id + "님과의 약속 : " + $(obj).parent().siblings(".check-commentdiv").text();
	var login_id = $("#login_id").text();
	var user_img = document.getElementById("user_img").innerText;
	
	if (confirm(id+"님과 함께하시겠나요?")) {
		$.ajax({
			url:"message.do?command=choicePromise",
			type:"post",
			data:{
				"con_id":id,
				"loc":loc,
				"permit":"Y",
				"comment":comment,
				"chat_serial":chat_serial
			},
			success:function(msg){
				alert("약속이 확정되었습니다. 마이페이지에서 약속을 확인해주세요.");
				$(obj).parent().parent(".check-imgdiv").css("display","none");
				
				if (id == $("#con_id").text()) {
					$("#tbody").append(
							"<tr> <td rowspan='2' class='firstTd'> <img id='pic' alt='profile' src='./img/user/" + user_img + ".png'></td>" +
							"<td colspan='2'> <span id='sender' class='fw-bold spanSender'>" + login_id + "</span>" +
							"<span id='m_time' class='spanTime'>" + time + "</span>" +
							"<img class='reportIcon' alt='report' src='./img/companion/report2.png' onclick='reportUser();'>" +
							"</td></tr>" +
							"<tr><td colspan='3' class='secondTd'><div id='getMessage' class='message' style='color:blue;'>" + comment + "</div>" +
							"</td></tr>"
					);
				}
			}
		});
	}
}


function messageFunction() {
	var message = document.getElementById("inputMessage").value;
	var login_id = document.getElementById("login_id").innerText;
	var con_id = document.getElementById("con_id").innerText;
	var chat_serial = document.getElementById("chat_serial").innerText;
	var user_img = document.getElementById("user_img").innerText;
	
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '/' + month  + '/' + day;
	
	$.ajax({
		url:"message.do?command=sendMessage&message="+message+"&con_id="+con_id+"&chat_serial="+chat_serial,
		success: function(){
			$("#tbody").append(
				"<tr> <td rowspan='2' class='firstTd'> <img id='pic' alt='profile' src='./img/user/" + user_img + ".png'></td>" +
				"<td colspan='2'> <span id='sender' class='fw-bold spanSender'>" + login_id + "</span>" +
				"<span id='m_time' class='spanTime'>" + dateString + "</span>" +
				"<img class='reportIcon' alt='report' src='./img/companion/report2.png' onclick='reportUser();'>" +
				"</td></tr>" +
				"<tr><td colspan='3' class='secondTd'><div id='getMessage' class='message'>" + message + "</div>" +
				"</td></tr>"
			);
		}
	});
	document.getElementById("inputMessage").value = "";
}

function refreshMassage() {
	var con_id = document.getElementById("con_id").innerText;
	var idx = 0;
	$("#tbody").html("");
	$.ajax({
		url:"message.do?command=refresh&con_id="+con_id,
		dataType:"json",
		success:function(data) {
			var json = data;
			$.each(json, function(idx) {
				$("#tbody").append(
						"<tr> <td rowspan='2' class='firstTd'> <img id='pic' alt='profile' src='./img/user/" + json[idx].user_img + ".png'></td>" +
						"<td colspan='2'> <span id='sender' class='fw-bold spanSender'>" + json[idx].sen_id + "</span>" +
						"<span id='m_time' class='spanTime'>" + json[idx].time + "</span>" +
						"<img class='reportIcon' alt='report' src='./img/companion/report2.png' onclick='reportUser();'>" +
						"</td></tr>" +
						"<tr><td colspan='3' class='secondTd'><div id='getMessage' class='message'>" + json[idx].message + "</div>" +
						"</td></tr>"
				);
				idx = (idx+1)==json.length? 0 : (idx+1);
			});
		}
	});
}

function transPromise() {
	//유효성 검사
	console.log($(".input:eq(1)").val());
	if ($(".input:eq(1)").val() == null || $(".input:eq(1)").val() == "") {
		alert("상대방과 어디서 만날지 입력해주세요.");
		$(".input:eq(1)").focus();
		return;
	} else if (($(".input:eq(2)").val() == null || $(".input:eq(2)").val() == "")&&($(".input:eq(2)").val().length != 10)) {
		alert("날짜를 정확하게 입력해주세요.");
		$(".input:eq(2)").focus();
		return;
	} else if ($(".input:eq(3)").val() == null || $(".input:eq(3)").val() == "") {
		alert("무엇을 할 지 설명해주세요!");
		$(".input:eq(3)").focus();
		return;
	}
	
	var con_id = $("#con_id").text();
	var loc = $(".input:eq(1)").val();
	var date = $(".input:eq(2)").val();
	var comment = $(".input:eq(3)").val();
	
	console.log("보내는이 : "+con_id+" 위치 : "+loc+" 시간 : "+date+" 코멘트 : "+comment);
	
	// 유효성 검사 통과 이후
	if (confirm("약속 요청을 보내시겠습니까?")) {
		$.ajax({
			url:"message.do?command=promise",
			type:"post",
			data:{
				"con_id":con_id,
				"loc":loc,
				"date":date,
				"comment":comment
			},
			success:function(msg) {
				alert(msg);
				$(".promise-table").css("display", "none");
			}
		});
	} else {
		alert("취소");
	}
}

function openPromise() {
	$(".promise-table").css("display", "block");
}

function closeButton(obj) {
	$(obj).parent("div").css("display","none");
}

function reportUser() {
	if (confirm("상대방을 규정 위반으로 신고하시겠습니까?\n신고 후 자동으로 연결이 끊깁니다.")) {
		var con_id = document.getElementById("con_id").innerText;
		//일단은 ajax로 처리를 하고 삭제된 메세지 함으로 이동시키자.
		$.ajax({
			url:"message.do?command=reportUser&con_id=" + con_id,
			success:function(msg) {
				alert(msg);
			}
		});
	}
}
</script>

<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
	<hr>
	<div class="container">
		<div class="messenger-nav">
			<table style="width: 100%;" class="text-center">
				<colgroup>
					<col width="33%">
					<col width="33%">
					<col width="33%">
				</colgroup>
				<tr style="height: 70px;">
					<!-- 클릭시 약속잡기 탭 open -->
					<td><a id="promiseTab" class="nav-tab fw-bold" onclick="openPromise();">약속잡기</a></td>
					<!-- 자기 자신 여행 url전송 -->
					<!-- 팝업창을 띄어서 여행 리스트를 불러오고 그거 선택해서 submit 누르면 url 넘어가도록 구현하자(블로그 디테일페이지) -->
					<td><a href="#" class="nav-tab fw-bold">일정 공유하기</a></td>
					<td><a id="refresh" class="nav-tab fw-bold" onclick="refreshMassage();">새로고침</a></td>
				</tr>
			</table>
		</div>
		<div class="messenger-table">
		
			<div id="check-promise">
				<img id="close-button" alt="close" src="./img/companion/close.png" onclick="closeButton(this);">
				<ul class="check-ul">	
	    			<li class="check-li-title">
	    				<span class="check-title-span">나에게 온 약속</span>
	    			</li>
					<li id="promiseList">
	    			</li>
	    			<li class="check-li-goMy">
	    				<a id="goMyPromise" onclick="">나의 약속 확인하러가기></a>
	    			</li>
	    		</ul>
			</div>
			
			<div class="promise-table">
				<img id="close-button" alt="close" src="./img/companion/close.png" onclick="closeButton(this);">
				<div style="width: 100%; height: 90%">
					<table class="text-center" style="width: 100%; height: 100%;">
						<colgroup>
							<col width="18%">
							<col width="82%">
						</colgroup>
						<tbody id="promiseBody">
							<tr>
								<td colspan="2">약속 보내기</td>
							</tr>
							<tr class="promise-tr">
								<td class="promise-td">누가?</td>
								<td><textarea class="input" rows="1" cols="40" readonly
										style="letter-spacing: 3px;"><%=login_id.getUser_id()%></textarea></td>
							</tr>
							<tr class="promise-tr">
								<td class="promise-td">어디서?</td>
								<td><textarea class="input" rows="1" cols="40"
										name="location" placeholder="약속하신 장소를 입력해주세요."></textarea></td>
							</tr>
							<tr class="promise-tr">
								<td class="promise-td">언제?</td>
								<td><textarea class="input" rows="1" cols="40" name="date"
										placeholder="연/월/일 입력(ex: 2021/05/21)"></textarea></td>
							</tr>
							<tr class="promise-tr">
								<td class="promise-td">뭘 할까?</td>
								<td><textarea class="input" rows="5" cols="40"
										name="comment" placeholder="구체적인 시간과 무엇을 계획했는지 알려주세요!"></textarea></td>
							</tr>
							<tr style="height: 1%;">
								<td colspan="2">
									<button id="submitButton" onclick="transPromise();">약속잡기</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<table style="width: 100%;">
				<colgroup>
					<col width="12%">
					<col width="78%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr style="display:none">
						<td>
							<span id="user_img"><%=login_id.getUser_img() %></span>
							<span id="con_id"><%=con_id.getSen_id()%></span>
							<span id="chat_serial"><%=con_id.getChat_serial()%></span>
							<span id="login_id"><%=login_id.getUser_id()%></span>
						</td>
					</tr>
					<!-- 공지 메세지 시작 -->
					<tr style="margin-top: 10px;">
						<td rowspan="2" style="text-align: center; padding: 15px;"><img id="pic" alt="bell" src="./img/companion/admin.png"></td>
						<td colspan="2"><span class="fw-bold" style="font-size: 20px;">여행을 묻다</span></td>
					</tr>
					<tr>
						<td colspan="3" style="padding: 5px; padding-bottom: 15px;">
							<div class="message">
								나에게 요청된 약속을 확인할 수 있습니다.
								<a id="openPromise" onclick="openPromiseTab();" style="color: red; text-decoration: none; font-size: 10px;">&nbsp;약속 확인하기</a><br>
								이용 전 공지사항을 확인해주시기 바랍니다.
								<a href="#" style="color: red; text-decoration: none; font-size: 10px;">&nbsp;공지사항 확인하기</a>
							</div>
						</td>
					</tr>
					<!-- 메세지 끝 -->
				</thead>
				<!-- 메세지 시작 -->
				<tbody id="tbody">
<%	
				for (int i = 0; i < list.size()-1; i++) {
					//if문으로 sen_id가 session아이디 인지 아닌지 체크해주는 갈래로 처리하자
%>
					<tr>
						<td rowspan="2" style="text-align: center; padding: 15px;"><img id="pic" alt="profile" src="./img/user/<%=list.get(i).getSender_img() %>.png"></td>
						<td colspan="2"><span id="sender"class="fw-bold" style="font-size: 20px;"><%=list.get(i).getSen_id() %></span>
							<span id="m_time" style="font-size: 12px; margin-left: 10px;"><%=list.get(i).getM_time()%></span>
							<img class="reportIcon" alt="report" src="./img/companion/report2.png" onclick="reportUser();">
						</td>
					</tr>
					<tr>
						<td colspan="3" style="padding: 5px; padding-bottom: 15px;">
							<div id="getMessage" class="message"><%=list.get(i).getMessage()%></div>
						</td>
					</tr>
<%
				}
%>
				</tbody>
			</table>
		</div>
		<!-- 메세지 입력칸 -->
		<div class="inputForm">
			<div style="width: 70%; float: left; margin-left: 30px;">
				<textarea id="inputMessage" class="input" style="height: 50px; width: 100%;" rows="2"
					cols="56" placeholder="&nbsp;&nbsp;메세지를 작성하세요"></textarea>
			</div>
			<div style="width: 20%; float: right; margin-right: 15px;">
				<button id="sendMessage" class="btn-primary" onclick="messageFunction();"
					style="width: 90%; height: 50px; border-radius: 5px; opacity: 3;">전송</button>
			</div>
		</div>
	</div>
	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
</body>
</html>