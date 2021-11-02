<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	
.flex_container{
display: flex;
  align-items: center; /* 수직 정렬 */
  flex-direction: row; /* default: row */
  justify-content: center; /* flex direction에 대해서 정렬방식 선택 */
  margin-top: 20px;
  margin-bottom: 20px;
}	

input{
	border: 0;
	border-bottom: 2px solid lightgrey;
	width : 250px;
}

.btn {
	padding : 5px 10px;
	width:130px;
}
.btn:hover{
	background-color: grey;
}

</style>
<script type="text/javascript">
	function idChk(){
		var doc = document.getElementsByName("user_id")[0];
		if(doc.value.trim()==""|| doc.value==null){
			alert("아이디를 입력해 주세요");
		}else{
			var target = "loginController.do?command=idchk&id="+doc.value.trim();
			open(target,"","width=300,height=200"); //팝업창을 거쳐 원하는 내용을 띄어줌
		}
	}
	function idChkConfirm(){
		var chk = document.getElementsByName("user_id")[0].title;
		if(chk=="n"){
			alert("아이디 중복체크를 해주세요");
			document.getElementsByName("user_id")[0].focus();
		}
		
	}
	
	function validate(){
		var objID = document.getElementById("user_id"); //이름
        var objPwd1 = document.getElementById("passwd"); //비밀번호
        var objPwd2 = document.getElementById("pw_chek"); //비밀번호 확인
        var objEmail = document.getElementById("email"); //이메일
        var objName = document.getElementById("name"); //이름
 		var objNickname = document.getElementById("nickname"); //닉네임

      	
        var regul1 = /^[a-zA-Z0-9]{4,12}$/; //아이디, 비밀번호값 확인
        var regul2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/; //이메일값 확인
        var regul3 = /^[가-힝a-zA-Z]{2,}$/; //이름값 확인

		//유효성 검사
        if (!check(regul1,objID,"아이디는 4-12자의 대소문자와 숫자로만 입력 가능합니다.")) {
            return false;//반환 할 곳 없이 if문 종료
        }
       
        if ((objPwd1.value) == ""){
            alert("비밀번호를 입력해 주세요");
            objPwd1.focus();
            return false;
        }
        if ((objPwd2.value=="")){
            alert("비밀번호를 입력해 주세요");
            objPwd2.focus();
            return false;
        }
        if (!check(regul1,objPwd1,"비밀번호는 4-12자의 대소문자와 숫자로만 입력 가능합니다.")) {
            return false;
        }
        if ((objPwd1.value)!=(objPwd2.value)) {
            alert("비밀번호가 일치 하지 않습니다.");
            objPwd1.value="";
            objPwd2.value="";
            return false;
        }
        
        if ((objEmail.value)=="") {
            alert("이메일을 입력해 주세요");
            objEmail.focus();
            return false;
        }
        if ((objName.value)=="") {
            alert("이름을 입력해 주세요");
            objName.focus();
            return false;
        }
        if (!check(regul3,objName,"이름이 잘못입력되었습니다.")) {
            return false;
        }
        if ((objNickname.value)=="") {
            alert("별명을 입력해 주세요");
            objNickname.focus();
            return false;
        }
        
        
	}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    <!-- 주소 API-->
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
         
                document.getElementById("engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<title>회원가입</title>
</head>
<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
	

	<br>
	<div style="text-align: center;"><h2>회원가입</h2></div>
	<br>

	<!-- 메인 -->
	<div id="right" class="flex_container">
	
		<!-- 정보수정 -->
		<div class="user_list">
			<form action="loginController.do" method="post" onsubmit="return validate()">
				<input type="hidden" name="command" value="regist">
				<h2 style="text-align:center">회원가입</h2>
				<table>
					<tr class="tr">
						<td>아이디</td>
						<td>
							<input type="text" name="user_id" maxlength="16" title="n" required="required">
							<input type="button" class="btn" value="중복확인" style="border: 2px solid grey;" onclick="idChk();">
						</td>
					</tr>

					<tr class="tr">
						<td >비밀번호</td>
						<td>
							<input type="password" name="passwd" onclick="idChkConfirm();" maxlength="16" >
							<p>비밀번호는<span class="num">문자,숫자,특수문자조합으로 8자리-16자리</span> 입력이 가능합니다.</p>
						</td>
					</tr>
					<tr class="tr">
						<td >비밀번호 확인</td>
						<td>
							<input type="password" name="pw_check" maxlength="16">
							<span class="pw_chk">비밀번호같다 / 다르다</span>
						</td>	
					</tr>
					<tr class="tr">
						<td >이름</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr class="tr">
						<td >닉네임</td>
						<td><input type="text" name="nickname"></td>
					</tr>
					<tr class="tr">
						<td >이메일</td>
						<td>
							<input type="text" name="email"> @ 
							<select name="dot">
								<option value="naver">naver.com</option>
								<option value="daum">daum.net</option>
								<option value="google">google.com</option>
							</select>
						</td>
					</tr>
					<tr class="tr">
						<td >국적</td>
						<td>
							<select name="nation">
								<option value="kr">한국</option>
								<option value="us">미국</option> 
								<option value="ch">중국</option>
								<option value="jp">일본</option>
								<option value="sp">스페인</option>
							</select>
						</td>
					</tr>
					
					<!-- 주소 API -->
					<tr class="tr">
						<td >주소</td>
						<td>
							<input type="text" id="postcode" name="postcode" placeholder="우편번호">
							<input type="button" class="btn" style="border: 2px solid grey;" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" size="60" ><br>
							<input type="hidden" id="jibunAddress" placeholder="지번주소"  size="60">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"  size="60"><br>
							<input type="hidden" id="extraAddress" placeholder="참고항목"  size="60">
							<input type="hidden" id="engAddress" placeholder="영문주소"  size="60" ><br>
						</td>
					</tr>
					<tr class="tr">
						<td >성별</td>
						<td>
							<select name="gender">
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</td>
					</tr>
					<tr class="tr">
						<td >나이</td>
						<td>
							<input type="number" name="age">
						</td>
					</tr>
					<tr class="tr">
						<td >핸드폰번호</td>
						<td><input type="text" name="phone"></td>
					</tr>
				</table>
				<br><br>
				<div style="text-align: center;">
					<input type="submit" class="btn" style="border: 2px solid grey;" value="회원가입">
					<input type="button" class="btn" style="border: 2px solid grey;" value="취소" onclick="location.href='index.jsp'">
				</div>
			</form>
		</div>
	</div>

	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
</body>
</html>