<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./companion/css/massageCss.css" rel="stylesheet" type="text/css"/>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script type="text/javascript" src="./companion/js/message.js"></script>
<style type="text/css">
.trash:hover {
	cursor:pointer;
}
</style>

<body>
	<!-- request객체에 담겨서 넘어옴. request 객체 : connectList -->
	<!-- 고정(헤더) -->
	<div id="header">
		<%@ include file="/form/header.jsp"%>
	</div>
	<hr>
	<div class="container-fluid">
	    <div class="messenger-table" style="">
	    	<div style="position:relative;">
	    	<div class="alert-message">
	    		<img id="close-button" alt="close" src="./img/companion/close.png">
	    		<ul style="list-style:none; padding-left:0px; margin-bottom:3px; border-radius:10px;">	
	    			<li style="text-align:center; margin:2%;">
	    				<span style="letter-spacing:3px; font-size:larger;">동행 요청</span>
	    			</li>
	    			<li id="liTitle">
	    			</li>
	    		</ul>
	    	</div>
		        <table>
		        	<colgroup>
		        		<col width="10%">
		        		<col width="80%">
		        		<col width="10%">
		        	</colgroup>
		        	<thead>
		        		<tr>
		        			<!-- 삭제된 메세지 탭은 삭제된 메세지가 있을 시 display block처리 -->
		        			<td style="padding:25px;">
		        				<a class="navbar-brand" id="messageTab"style="color:black; margin:auto;" onclick="messageTab();">메세지</a>
		        			</td>
		        			<td style="padding:25px;">
		        				<a class="navbar-brand" id="deleteTab" style="color:black;" onclick="deleteMessageTab();">삭제된 메세지</a>
		        			</td>
		        			<td style="padding:25px;">
		        				<!-- 벨 클릭 시 동행신청 리스트 나와야함 -->
		        				<!-- 새로운 신청이 왔을 때 어떻게 처리할 지 고민해보기 -->
		        				<img id="bell" alt="bell" src="./img/companion/idea.png">
		        			</td>
		        		</tr>
		        	</thead>
		        	<tbody id="tbody">
		        		<!-- tr태그 2개 하나에 한 셋트 -->
		        		<!-- 메세지 노출은 글자수 제한 걸어놔야함. 일정 글자수 넘어가면 ...으로 나오도록 처리해야함 -->
		        		<c:forEach var="list" items="${conList}">
		        		<tr class="${list.sen_id}" style="padding:10px;">
		        			<td rowspan="2" style="text-align:center;">
		        				<img class="listpic" alt="profile" src="./img/companion/french.png">
		        			</td>
		        			<td colspan="2" class="fw-bold">${list.sen_id}</td>
		        		</tr>
		        		<tr class="${list.sen_id}" style="padding:10px;">
		        			<td>
		        				<a href="message.do?command=detailMessage&sen_id=${list.sen_id}" class="message">${list.message}</a>
		        			</td>
		        			<td style="padding-left:25px;">
		        				<!-- 삭제 버튼 클릭 시 삭제된 메세지로 이동 -->
		        				<span class="sen-id" style="display:none;">${list.sen_id}</span>
		        				<img class="trash" alt="trash" src="./img/companion/trash.png" onclick="deleteMessage(this);">
		        			</td>
		        		</tr>
		        		</c:forEach>
		        	</tbody>
		        </table>
	        </div>
	    </div>
	</div>
	<!-- 고정(푸터) -->
	<div id="footer">
		<%@ include file="/form/footer.jsp"%>
	</div>
		
</body>
</html>