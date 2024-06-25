let socket;

function connect() {     
    socket = new WebSocket('ws://' + window.location.host + '/planner/' + planner_num + '/' + page_num);

	// 연결성공
	socket.onopen = function() {
		console.log("connected");
    }

	// 메세지 받으면 발생
    socket.onmessage = function(event) {
        let messages = document.getElementById('myChatRoom');
        let mo = JSON.parse(event.data);
        messages.innerHTML += '<p>' + mo.id + '님: ' + mo.content + '</p>';
        messages.scrollTop = messages.scrollHeight;
    }

	// 연결해제
    socket.onclose = function() {
		console.log("disconnected")
    }
    
    // 에러시
    socket.onerror = function() {
		
	}
}