window.onload = () => {
	connect();
}

const page = document.getElementById("note");

page.addEventListener("input", () => {
	sendContent();
});

function sendContent() {
	const content = page.value;
	const cursorPosition = page.selectionStart;
	socket.send(content + "|" + cursorPosition);
}