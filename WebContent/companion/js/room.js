
function openPromise() {
	$(".promise-table").css("display", "block");
}

function addChat(sen_id, message, m_time) {
	console.log(sen_id);
	console.log(message);
	console.log(m_time);
	$("#sen_id").text(sen_id);
	$("#getMessage").text(message);
	$("#m_time").text(m_time);
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
	
	var sen_id = $(".input:eq(0)").val();
	var loc = $(".input:eq(1)").val();
	var date = $(".input:eq(2)").val();
	var comment = $(".input:eq(3)").val();
	
	console.log("보내는이 : "+sen_id+" 위치 : "+loc+" 시간 : "+date+" 코멘트 : "+comment);
	
	// 유효성 검사 통과 이후
	if (confirm("약속 요청을 보내시겠습니까?")) {
		$.ajax({
			url:"message.do?command=promise",
			type:"post",
			data:{
				"sen_id":sen_id,
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
			},
			error: function() {
				console.log("실패");
			}
		});
	}
}
