<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	ul {
		list-style-type : none;
	    margin: 0px;
	    padding: 0px;
	    width: 200px;
	    background-color: white;
	}
	li a {
	    display: block;
	    color: #000;
	    padding: 8px 16px;
	    text-decoration: none;
	}
	li a:hover {
	    background-color: green;
	    color: white;
	    position : 
	}
	.flex-container{
		display: flex;
		float:right;
		flex-direction: column;	
			
	}
	.header, .sidebar,
	.footer, .flex-container {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	.user_list{
		display:flex;
		margin-left: 200px;
		margin-bottom: 20px;
	}
	.sidebar {
	  width: 15%;
	  float: left;
	  height: 50%;
	}
	h3 {
		padding: 0;
		margin: 0;
	}
	body {
		margin: 0;
		padding: 0;
	}
	table{
	    height: 300px;
	    width: 900px;
	    border-top: 3px solid black;
	    margin-right: auto;
	    margin-left: auto;
    }
 
    td{
    	border-bottom: 1px dotted black;
    }
 
    caption{
   		text-align: left;
    }
 
    .col1 {
	    background-color: #e8e8e8;
	    padding: 10px;
	    text-align: right;
	    font-weight: bold;
	    font-size: 0.8em;
    }
    .col2 {
	    text-align: left;
	    padding: 5px;
    }
    .a, p{
    	font-size: 0.7em;
    }
    .num{
    	color: red;
    }

</style>
<script type="text/javascript">
	function popup(){
		window.open("unregister_1.jsp","_blank","width=300px, height=150px");
		
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
	

	<br>
	<div style="text-align: center;">마이페이지</div>
	<br>

	<!-- 사이드바 -->
	<div id="left" class="sidebar">
		<ul>
			<li><a href="<%=request.getContextPath()%>/user/mypage.jsp">내여행</a></li>
			<hr>
			<li><a href="<%=request.getContextPath()%>/user/info_update.jsp">정보수정</a></li>
			<hr>
			<li><a href="#" onclick="popup();">회원탈퇴</a></li>	
			<hr>
			<li><a href="Companion.do?command=message">채팅하기</a></li>	
		</ul>
	</div>
	
	
	<!-- 메인 -->
	<div id="right" class="flex_container">
	
		<!-- 정보수정 -->
		<div class="user_list">
			<form action="#" method="post">
				<h2>회원정보 수정</h2>
				<table>
					<tr>
						<td class="col1">아이디</td>
						<td class="col2">아이디 받아와서 넣기</td>
					</tr>
					<tr>
						<td class="col1">현재 비밀번호</td>
						<td class="col2"><input type="password" name="user_pw" maxlength="16"><span class="a">비밀번호 같다 / 다르다 표시</span></td>
						
					</tr>
					<tr>
						<td class="col1">비밀번호 수정</td>
						<td class="col2"><input type="password" name="change_pw" maxlength="16"><p>비밀번호는<span class="num">문자,숫자,특수문자조합으로 8자리-16자리</span> 입력이 가능합니다.</p></td>
					</tr>
					<tr>
						<td class="col1">비밀번호 확인</td>
						<td class="col2"><input type="password" name="pw_check" maxlength="16"><span class="a">비밀번호같다 / 다르다</span></td>	
					</tr>
					<tr>
						<td class="col1">이름</td>
						<td class="col2">이름 받아와서 넣기</td>
					</tr>
					<tr>
						<td class="col1">닉네임</td>
						<td class="col2"><input type="text" name="user_nick_nm" value="저장된 닉네임"></td>
					</tr>
					<tr>
						<td class="col1">이메일</td>
						<td class="col2">
							<input type="text" name="user_email" value="저장된 이메일"> @ 
							<select>
								<option value="naver">naver.com</option>
								<option value="daum">daum.net</option>
								<option value="google">google.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="col1">국적</td>
						<td class="col2">
							<select>
								<option value="kor">한국</option>
								<option value="usa">미국</option> 
								<option value="china">중국</option>
								<option value="jpan">일본</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="col1">성별</td>
						<td class="col2">
							<select>
								<option value="m">남자</option>
								<option value="f">여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="col1">생년월일</td>
						<td class="col2">
							<input type="text" name="year">년
							<input type="text" name="month">월
							<input type="text" name="day">일
						</td>
					</tr>
					<tr>
						<td class="col1">핸드폰번호</td>
						<td class="col2"><input type="text" name="phone"></td>
					</tr>
				</table>
				<br><br>
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="location.href='<%=request.getContextPath()%>/user/mypage.jsp'">
			</form>
		</div>
	</div>

	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
</body>
</html>