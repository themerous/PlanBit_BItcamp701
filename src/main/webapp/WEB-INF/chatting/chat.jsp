<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<div>
	<h2>ä�ù��</h2>
	<div id="chatrooms"></div>
	<h2>ä�ù� ����</h2>
	<form id="chatroomform">
		<input type="hidden" name="room_creator" value="${sessionScope.loginid }">
		<input type="hidden" name="room_participant" value="${sessionScope.loginid }">
		<input type="text" name="room_title">
		<button type="">����</button>
	</form>
</div>
<script src="/js/chat/chat.js"></script>