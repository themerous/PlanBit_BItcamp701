<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<script>
	const room_num = ${room_num};
	const id = ${sessionScope.loginid};
	console.log(id);
</script>
<div id="myChatRoom" style="overflow: scroll; width: 300px; height: 500px;"></div>
<div>
	<input id="myChatContent" type="text">
	<button type="button" onclick="sendMessage()">º¸³»±â</button>
</div>
<script src="/js/chat/chatrooms.js"></script>
<script src="/js/chat/chatSocket.js"></script>