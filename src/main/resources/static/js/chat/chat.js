function loadChatRoom() {
	$.get("/chat", function(data) {
		let s = `
			<div id="chatListHeader">
				<p style="font-size: 16px; margin: 5px;">채팅</p>
				<a style="font-size: 16px; margin: 5px;" onclick="showChatRoomForm()"><i class="bi bi-plus-lg"></i></a>
			</div>
			<div>
		`;
		for(let room of data) {
			let t = room.room_participant.split(",")
			s += `
				<div class="chat-hover" onclick="moveToChat(${room.room_num}, '${room.room_title}')">
					<div style="font-size: 16px;">
						${room.room_title}
					</div>
					<div style="font-size: 12px;">
						참여인원수 : ${t.length}
					</div>
				</div>
			`;
		}
		s += '</div>';
		document.getElementById("chatting-room").innerHTML = s;
	}, "json");
}

function moveToChat(room, title) {
	connect(room);
	$.get("/chat/data", {room_num: room}, function(data) {
		let name = "";
		let s = `
			<div id="chatListHeader">
				<p style="font-size: 16px; margin: 5px;">${title}</p>
				<a style="font-size: 16px; margin: 5px;" onclick="showChatRoomForm()">
					<i class="bi bi-arrow-bar-left"></i>
				</a>
			</div>
			<div id="myChatRoom" style="width: 380px; height: 336px;overflow: scroll;">
		`;
		for(d of data) {
			s += `
				<div style="margin: 5px; display: flex;">
					<div style="display: flex; flex-direction: column;">
						<div>
							${d.name}
						</div>
						<div style="border-radius: 10px;width: 300px; margin: 5px auto; padding: 5px; background-color: rgba(220,220,220,1)">
							${d.content}
						</div>
					</div>
				</div>
			`;
		}
		s += `</div>`;
		s += `
			<div>
				<textarea style="width: 380px; height: 100px;" id="chat-input"></textarea>
				<div>
					<button style="width: 380px; height: 30px" type="button" onclick="sendText(${room})">입력</button>
				</div>
			</div>
		`;
		document.getElementById("chatting-room").innerHTML = s;
	})
}

function sendText(room) {
	const mo = document.getElementById("chat-input");
	const messageO = {
		"content": mo.value,
		"writer": name
	}
	$.post("/chat/data", {room: room, writer: user_num, content: mo.value}, 
	function() {
		
	});
	chatsocket.send(JSON.stringify(messageO));
	mo.value="";
}

function showChatRoomForm() {
	
}

function createChatRoom() {
	
}