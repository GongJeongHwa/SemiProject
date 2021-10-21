	function addChat(sen_id, message, m_time) {
		console.log(sen_id);
		console.log(message);
		console.log(m_time);
		$("#sen_id").text(sen_id);
		$("#getMessage").text(message);
		$("#m_time").text(m_time);
	}
	
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

	function refreshMassage() {
		console.log("실행됨");
		
		//에이젝스 이용해서 최신 리스트 가져와서 뿌려주자
		var con_id = document.getElementById("con_id").innerText;
		console.log(con_id);
		$("#tbody").html("");
		$.ajax({
			url:"message.do?command=refresh&con_id="+con_id,
			dataType:"json",
			success: function(msg) {
				console.log(msg);
				console.log("통신성공");
				var json = msg;
				//이곳이 문제이다!
				$.each(json, function(key, value) {
					$("#tbody").append(
							"<tr> <td rowspan='2' class='firstTd'> <img id='pic' alt='profile' src='./img/companion/idea.png'></td>" +
							"<td colspan='2'> <span id='sender' class='fw-bold spanSender'>" + value[0] + "</span>" +
							"<span id='m_time' class='spanTime'>" + value[1] + "</span>" +
							"<img class='reportIcon' alt='report' src='./img/companion/report.png' onclick='reportUser();'>" +
							"</td></tr>" +
							"<tr><td colspan='3' class='secondTd'><div id='getMessage' class='message'>" + value[2] + "</div>" +
							"</td></tr>"
					);
				});
			},
			error:function() {
				console.log("통신실패");
			}
		});
	}
	
	$(function() {
		$("#close-button").click(function() {
			$(".promise-table").css("display", "none");
		});
	});
	
	function reportUser() {
		if (confirm("상대방을 규정 위반으로 신고하시겠습니까?\n신고 후 자동으로 연결이 끊깁니다.")) {
			var con_id = document.getElementById("con_id").innerText;
			//일단은 ajax로 처리를 하고 삭제된 메세지 함으로 이동시키자.
			$.ajax({
				url:"message.do?command=reportUser&con_id=" + con_id,
				success:function(msg) {
					alert(msg);
				},
				error: function() {
					console.log("실패");
				}
			});
		}
	}

	function messageFunction() {
		var message = document.getElementById("inputMessage").value;
		var login_id = document.getElementById("login_id").innerText;
		var con_id = document.getElementById("con_id").innerText;
		var chat_serial = document.getElementById("chat_serial").innerText;
		
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var dateString = year + '/' + month  + '/' + day;
		
		console.log(chat_serial);
		
		$.ajax({
			url:"message.do?command=sendMessage&message="+message+"&con_id="+con_id+"&chat_serial="+chat_serial,
			success: function(){
				$("#tbody").append(
					"<tr> <td rowspan='2' class='firstTd'> <img id='pic' alt='profile' src='./img/companion/idea.png'></td>" +
					"<td colspan='2'> <span id='sender' class='fw-bold spanSender'>" + login_id + "</span>" +
					"<span id='m_time' class='spanTime'>" + dateString + "</span>" +
					"<img class='reportIcon' alt='report' src='./img/companion/report.png' onclick='reportUser();'>" +
					"</td></tr>" +
					"<tr><td colspan='3' class='secondTd'><div id='getMessage' class='message'>" + message + "</div>" +
					"</td></tr>"
				);
			}
		});
		document.getElementById("inputMessage").value = "";
	}