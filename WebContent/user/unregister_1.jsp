<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>
<style type="text/css">
	div{
		text-align: center;
	}
</style>
<script type="text/javascript">
	function pop_close(){
		window.close();
		self.close();
	}
</script>
</head>

<body>
	<form action="unregister_2.jsp" method="post" >
		<div>
			<p>비밀번호를 입력하세요.</p>
			<input type="password" name="user_pw">
			<br><br>
			<input type="submit" value="OK">
			<input type="button" value="CANCEL" onclick="pop_close();">
		</div>
	</form>
	
</body>
</html>