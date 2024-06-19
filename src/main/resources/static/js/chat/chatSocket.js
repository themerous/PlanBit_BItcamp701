let socket;

function connect() {     
    socket = new WebSocket('ws://' + window.location.host + '/chat/' + room_num);

	// 연결성공
	socket.onopen = function() {
		console.log("connected to room: " + room_num);
		$.get("./loadPrevChat", { room_num: room_num }, function(data) {
			let messages = document.getElementById('myChatRoom');
			for(let d of data) {
				messages.innerHTML += '<p>' + d.writer + "님: " + d.content + '</p>';
			}
			messages.scrollTop = messages.scrollHeight;
		});
    }

	// 메세지 받으면 발생
    socket.onmessage = function(event) {
        let messages = document.getElementById('myChatRoom');
        let mo = JSON.parse(event.data);
        messages.innerHTML += '<p>' + mo.id + '님: ' + mo.content + '</p>';
        $.post("", )
        messages.scrollTop = messages.scrollHeight;
    }

	// 연결해제
    socket.onclose = function() {
		
    }
    
    // 에러시
    socket.onerror = function() {
		
	}
}