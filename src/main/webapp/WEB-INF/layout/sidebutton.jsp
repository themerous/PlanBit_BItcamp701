<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#chatting-room {
		position: absolute;
		top: -500px;
		left: -310px;
		display: none;
		background: white;		
		box-shadow: 0 0 21px 0px rgba(0,0,0,0.75);
		-webkit-box-shadow: 0 0 21px 0px rgba(0,0,0,0.75);
		-moz-box-shadow: 0 0 21px 0px rgba(0,0,0,0.75);
		height: 500px;
		width: 380px;
	}
	#chatListHeader {
		display: flex;
		justify-content: space-between;
		background-color: #51E3D4;
		color: white;
	}
	.chat-hover {
		padding: 10px; 
		margin: 10px; 
		background-color: #51E3D4; 
		color: white;
		border-radius: 5px; 
		display: flex; 
		justify-content: space-between;
	}
	.chat-hover:hover {
		background-color: rgba(81, 227, 212, 0.5);
	}
</style>
<script>
	let view = 0;
</script>
<div class="side-btn-box">
<%--    <button class="chat"><i class="bi bi-chat-dots-fill"></i></button>--%>
    <button class="chat" onclick="showChatting()"></button>
    <button class="upbutton" onclick="window.scrollTo({ top: 0, behavior: 'smooth' })"></button>
    <div id="chatting-room">

    </div>
</div>
<script>
	const user_id = "${sessionScope.loginid}";
	const provider = "${sessionScope.role}";
	const user_num = ${sessionScope.user_num};
	const name = "${sessionScope.name}";
	function showChatting() {
	    const chatRoom = document.getElementById("chatting-room");
	    
	    if("${loginok}" == "yes"){
	    	if(view === 0) {
		        chatRoom.style.display = "block"; // Correct the display value
		        loadChatRoom();
		        view++;
		    } else {
		        chatRoom.style.display = "none"; // Correct the assignment operator
		        view = 0;
		    }
	    }else {
	    	alert("로그인해주세요")
	    }
	}
</script>
<script src="/js/chat/chat.js"></script>
<script src="/js/chat/chatrooms.js"></script>
<script src="/js/chat/chatSocket.js"></script>