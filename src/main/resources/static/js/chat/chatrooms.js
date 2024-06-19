window.onload = () => {
	connect();
}

function sendMessage() {
	const message = document.getElementById("myChatContent");
	const mo = {
		id: id,
		content: message.value
	}
	socket.send(JSON.stringify(mo));
	message.value = '';
}