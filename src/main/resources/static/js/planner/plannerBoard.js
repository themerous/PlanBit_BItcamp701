window.onload = () => {
	connect();
}

const page = document.getElementById("note");
page.addEventListener("keyup", () => {
	sendContent();
});

function sendContent() {
	console.log(page.value);
	const mo = {
		id: id,
		content: page.value
	}
	socket.send(JSON.stringify(mo));
	page.innerHTML = "";
}