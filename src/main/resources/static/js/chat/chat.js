window.onload = function() {
	loadChatRooms()
}

function loadChatRooms() {
	$.post("./getChatRooms", function(data) {
		let s = "";
		for(let a of data) {
			s += '<form method="post" action="./chatting">'
			s += '<input type="hidden" name="room_num" value="' + a.room_num + '">'
			s += '<button type="">방이름: ' + a.room_title + '</button></form>';
		}
		
		$("#chatrooms").html(s);
	});
}

$("#chatroomform").(function(e) {
	e.preventDefault();
	const fdata = $(this).serialize();
	console.log(fdata);

	$.post("./createChatroom", fdata, function() {
		loadChatRooms();
	}, 'json');
});