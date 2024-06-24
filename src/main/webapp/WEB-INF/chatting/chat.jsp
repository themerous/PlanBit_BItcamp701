<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<div>
	<h2>채팅방들</h2>
	<div id="chatrooms"></div>
	<h2>채팅방 생성</h2>
	<form id="chatroomform">
		<input type="hidden" name="room_creator" value="${sessionScope.loginid }">
		<input type="hidden" name="room_participant" value="${sessionScope.loginid }">
		<input type="text" name="room_title">
		<button type="submit">생성</button>
	</form>
</div>
<script src="/js/chat/chat.js"></script>