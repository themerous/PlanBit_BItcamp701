<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<script>
	const room_num = ${room_num};
	const id = "${sessionScope.loginid}";
</script>
<div id="myChatRoom" style="overflow: scroll; width: 300px; height: 500px;"></div>
<div>
	<input id="myChatContent" type="text">
	<button type="button" onclick="sendMessage()">보내기</button>
</div>
<script src="/js/chat/chatrooms.js"></script>
<script src="/js/chat/chatSocket.js"></script>