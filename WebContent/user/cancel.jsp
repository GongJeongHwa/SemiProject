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
	<form action="cancel_2.jsp" method="post" >
		<div>
			<p>일정을 삭제하시겠습니까?</p>
			<input type="submit" value="OK">
			<input type="button" value="CANCEL" onclick="pop_close();">
		</div>
	</form>
	
</body>
</html>