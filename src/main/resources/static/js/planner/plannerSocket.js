let socket;

function connect() {     
    socket = new WebSocket('ws://' + window.location.host + '/plan/' + planner_num);

	// 연결성공
	socket.onopen = function() {
		console.log("connected");
    }
    
    // WebSocket 메시지 수신 이벤트
  	socket.onmessage = function(event) {
		console.log("oM");
		const mo = JSON.parse(event.data);
		console.log(mo.content);
		// Summernote 내용 업데이트
		document.getElementById("note").value = mo.content;
    };


	// 연결해제
    socket.onclose = function() {
		console.log("disconnected")
    }
    
    // 에러시
    socket.onerror = function() {
		
	}
}