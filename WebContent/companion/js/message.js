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
			//알림 div ajax 처리
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
								"<img class='connect-pic' alt='user' src='./img/companion/french.png'>" +
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
							"<td rowspan='2' style='text-align:center;'><img class='listpic' alt='profile' src='./img/companion/french.png'></td>" +
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
							"<td rowspan='2' style='text-align:center;'><img class='listpic' alt='profile' src='./img/companion/french.png'></td>" +
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
		
		$.ajax({
			url:"message.do?command=askPermit&id="+id+"&message="+message,
			success: function(msg) {
				alert(id+"님과 연결되었습니다. 행복한 추억을 만들어보세요!");
				$(obj).parent(".fifthDiv").parent(".firstDiv").css({"display":"none"});
				$("#tbody").append(
						"<tr class='"+id+"' style='padding:10px;'>" +
						"<td rowspan='2' style='text-align:center;'><img class='listpic' alt='profile' src='./img/companion/french.png'></td>" +
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