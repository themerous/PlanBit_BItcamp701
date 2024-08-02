let socket;

function pageconnect() {     
    socket = new WebSocket('ws://' + window.location.host + '/page/' + planner_num + '/' + page_num);
    
	// 연결성공
	socket.onopen = function() {
		console.log("connected");
    }
    
    // WebSocket 메시지 수신 이벤트
  	socket.onmessage = function(event) {
		const data = event.data.split("|");
		if(data[0] == "vpdlwl#cnrk#goTek" || data[0] == "tkrwp#$%dhksfy") {
			loadPageList();
		}else if(data[0] == "chlwhdtnwjddlf#@!qkRnla") {
			lastUpdateTime();
		}else {
			page.value = data[0]; // 내용물
			page.setSelectionRange(data[1], data[1]); // 커서 위치정보 
		}
    };


	// 연결해제
    socket.onclose = function() {
		console.log("disconnected");
    }
}