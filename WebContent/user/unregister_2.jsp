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
	function popup(){
		window.open("unregister_3.jsp","_blank","width=300px, height=150px");	
		window.close();
		self.close();
	}
</script>
</head>

<body>
	<div>
		<p>정말 탈퇴하시겠습니까?</p>
		<input type="button" value="OK" onclick="popup();">
		<input type="button" value="CANCEL"onclick="location.href='<%=request.getContextPath()%>/user/mypage.jsp'">
	</div>
	
</body>
</html>