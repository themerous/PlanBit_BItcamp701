window.onload = () => {
	connect();
}

function sendMessage() {
	const message = document.getElementById("myChatContent");
	const mo = {
		id: id,
		content: message.value
	}
	$.post("./insertChat", {writer: mo.id, content: mo.content, room_num: room_num}, function() {
		console.log("send success");
	});
	socket.send(JSON.stringify(mo));
	message.value = '';
}