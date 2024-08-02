let chatsocket;

function connect(room) {     
    chatsocket = new WebSocket('ws://' + window.location.host + '/chat/' + room);

	// 연결성공
	chatsocket.onopen = function() {
		console.log("connected to room: " + room);
    }

	// 메세지 받으면 발생
    chatsocket.onmessage = function(event) {
        let messages = document.getElementById('myChatRoom');
        let mo = JSON.parse(event.data);
        messages.innerHTML += `
        	<div style="margin: 5px; display: flex;">
				<div style="display: flex; flex-direction: column;">
					<div>
						${mo.writer}
					</div>
					<div style="border-radius: 10px;width: 300px; margin: 5px auto; padding: 5px; background-color: rgba(220,220,220,1)">
						${mo.content}
					</div>
				</div>
			</div>
        `;
        messages.scrollTop = messages.scrollHeight;
    }

	// 연결해제
    chatsocket.onclose = function() {
		console.log("disconnected from room: " + room);
    }
    
    // 에러시
    chatsocket.onerror = function() {
		
	}
}