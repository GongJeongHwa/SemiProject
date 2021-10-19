<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mvc.dto.UserDto" %>
<%@ page import="com.mvc.dto.MessageDto" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
.messenger-table {
	width: 700px;
	height: 600px;
	margin: 0 auto;
	background-color: rgb(245, 240, 240);
	border-radius: 10px;
	opacity: 0.9;
	box-shadow: blur;
	overflow: auto;
	position: relative;
}

.message {
	width: 97%;
	height: auto;
	overflow: hidden;
	float: left;
}

.reportTab {
	width: 100%;
	padding: 0px;
}

tr {
	height: 30px;
}

#pic {
	width: 50px;
	height: 50px;
}

.reportIcon {
	width: 20px;
	height: 20px;
}

<!--
-->
#picture {
	width: 10%;
	height: 100%;
	float: left;
}

#messageBody {
	width: 90%;
	float: right;
	height: auto;
}

<!--
-->
.nav-tab {
	font-size: 20px;
	text-decoration: none;
	color: black;
}

<!--
-->
.inputForm {
	width: 700px;
	margin: 0 auto;
	margin-bottom: 150px;
	height: 75px;
	background-color: rgb(241, 244, 245);
	border-radius: 10px;
	opacity: 0.8;
	padding: 10px;
}

<!--
-->
.messenger-nav {
	width: 700px;
	height: 80px;
	margin: 0 auto;
	margin-top: 100px;
	backgrould-color: lightgrey;
	padding: 10px;
	padding-botton: 0px;
	opacity: 0.8;
}

textarea::placeholder {
	letter-spacing: 1.5px;
	font-size: 90%;
}

<!--
-->
.promise-table {
	position: absolute;
	width: 70%;
	height: 60%;
	background-color: rgb(208, 208, 189);
	margin-left: 15%;
	margin-top: 10%;
	border-radius: 10px;
	display: none;
}

#close-button {
	width: 15px;
	height: 15px;
	margin-left: 95%;
}

.promise-tr {
	height: 5%;
}

.promise-td {
	padding-left: 25px;
}

.input {
	resize: none;
	border: 1px solid;
	border-radius: 10px;
}

#close-button:hover {
	cursor: pointer;
}

#button:hover {
	cursor: pointer;
}

.reportIcon:hover {
	cursor: pointer;
}

#promiseTab:hover {
	cursor: pinter;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#close-button").click(function() {
			$(".promise-table").css("display", "none");
		});

		//신고버튼 클릭시 메서드
		$(".reportIcon").click(function() {
			if (confirm("상대방을 규정 위반으로 신고하시겠습니까?\n신고 후 자동으로 연결이 끊깁니다.")) {
				alert("신고처리를 완료했습니다.");
				location.href = "";
			}
		});
		
		$("#sendMessage").click(function() {
			var con_id = $("#con_id").text();
			var message = $("#inputMessage").val();
			var chat_serial = $("#chat_serial").text();
			console.log(chat_serial);
			
			$.ajax({
				url: "message.do?command=sendMessage&con_id="+con_id+"&message="+message+"&chat_serial="+chat_serial,
				dataType: "json",
				success: function(msg) {
					alert("통신성공");
				},
				error: function(msg) {
					alert("통신실패");
				}
			});
		});
		
	});
	function openPromise() {
		$(".promise-table").css("display", "block");
	}

	function transPromise() {
		//유효성 검사
		console.log($(".input:eq(1)").val());
		if ($(".input:eq(1)").val() == null || $(".input:eq(1)").val() == "") {
			alert("상대방과 어디서 만날지 입력해주세요.");
			return;
		} else if ($(".input:eq(2)").val() == null || $(".input:eq(2)").val() == "") {
			alert("상대방과 언제 만날지 입력해주세요.");
			return;
		}

		// 유효성 검사 통과 이후
		if (confirm("약속 요청을 보내시겠습니까?")) {
			$.ajax({});
		} else {
			alert("취소");
		}
	}
	
	
</script>
<%
	UserDto login_id = (UserDto)session.getAttribute("login_id");
	List<MessageDto> list = (List<MessageDto>)request.getAttribute("detailList");
	MessageDto con_id = list.get(list.size()-1);
%>

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
					<td><a id="promiseTab" class="nav-tab fw-bold"
						onclick="openPromise();">약속잡기</a></td>
					<!-- 상대방의 일정 url로 연결 -->
					<td><a href="#" class="nav-tab fw-bold">일정 살펴보기</a></td>
					<!-- 자기 자신 여행 url전송 -->
					<td><a href="#" class="nav-tab fw-bold">일정 공유하기</a></td>

				</tr>
			</table>
		</div>
		<div class="messenger-table">
			<div class="promise-table">
				<img id="close-button" alt="close" src="./img/companion/close.png"
					onclick="">
				<div style="width: 100%; height: 90%">
					<table class="text-center" style="width: 100%; height: 100%;">
						<colgroup>
							<col width="18%">
							<col width="82%">
						</colgroup>
						<tr>
							<td colspan="2">약속 보내기</td>
						</tr>
						<tr class="promise-tr">
							<td class="promise-td">누구와?</td>
							<td><textarea class="input" rows="1" cols="40" readonly
									style="letter-spacing: 3px;">오일남</textarea></td>
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
									name="comment" placeholder="무엇을 할 지 정리해주세요!"></textarea></td>
						</tr>
						<tr style="height: 1%;">
							<td colspan="2">
								<button id="submitButton" onclick="transPromise();">약속잡기</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<table style="width: 100%;">
				<colgroup>
					<col width="12%">
					<col width="78%">
					<col width="10%">
				</colgroup>
				<tr style="display:none">
					<td>
						<span id="con_id"><%=con_id.getSen_id()%></span>
						<span id="chat_serial"><%=con_id.getChat_serial()%></span>
					</td>
				</tr>
				<!-- 공지 메세지 시작 -->
				<tr style="margin-top: 10px;">
					<td rowspan="2" style="text-align: center; padding: 15px;"><img id="pic" alt="bell" src="./img/companion/idea.png"></td>
					<td colspan="2"><span class="fw-bold" style="font-size: 20px;">여행을 묻다</span></td>
				</tr>
				<tr>
					<td colspan="3" style="padding: 5px; padding-bottom: 15px;">
						<div class="message">
							상대방에게 불쾌함을 주는 회원은 제제조치가 가해질 수 있습니다.<br> 
							<a href="#" style="color: red; text-decoration: none; font-size: 10px;">공지사항 확인하러 가기</a>
						</div>
					</td>
				</tr>
				<!-- 메세지 끝 -->
				<!-- 메세지 시작 -->
<%
			for (int i = 0; i < list.size()-1; i++) {
%>
				<tr>
					<td rowspan="2" style="text-align: center; padding: 15px;"><img id="pic" alt="bell" src="./img/companion/idea.png"></td>
					<td colspan="2"><span class="fw-bold" style="font-size: 20px;"><%=list.get(i).getSen_id() %></span>
						<span style="font-size: 12px; margin-left: 10px;"><%=list.get(i).getM_time()%></span>
						<img class="reportIcon" alt="report" src="./img/companion/report.png">
					</td>
				</tr>
				<tr>
					<td colspan="3" style="padding: 5px; padding-bottom: 15px;">
						<div class="message"><%=list.get(i).getMessage()%></div>
					</td>
				</tr>
<%
	}
%>
			</table>
		</div>
		<!-- 메세지 입력칸 -->
		<!-- 버튼이 고정이 안된다! -->
		<!-- form 태그 하지말고 div로 놓은 다음에 button onclick으로 처리하자. ajax처리 할거임. -->
		<div class="inputForm">
			<div style="width: 70%; float: left; margin-left: 30px;">
				<textarea id="inputMessage" class="input" style="height: 50px; width: 100%;" rows="2"
					cols="56" placeholder="&nbsp;&nbsp;메세지를 작성하세요"></textarea>
			</div>
			<div style="width: 20%; float: right; margin-right: 15px;">
				<button id="sendMessage" class="btn-primary"
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