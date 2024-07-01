let socket;

function connect() {     
    socket = new WebSocket('ws://' + window.location.host + '/plan/1');

	// 연결성공
	socket.onopen = function() {
		console.log("connected");
    }
    
    // WebSocket 메시지 수신 이벤트
  	socket.onmessage = function(event) {
		const data = event.data.split("|");
		page.value = data[0]; // 내용물
		page.setSelectionRange(data[1], data[1]); // 커서 위치정보 
    };


	// 연결해제
    socket.onclose = function() {
		console.log("disconnected");
    }
}