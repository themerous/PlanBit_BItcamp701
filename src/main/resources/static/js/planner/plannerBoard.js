window.onload = () => {
	
}

function sendContent() {
	
}

function getPlannerList() {
	$.get("/planner/list", {"user_id": user_id, "provider": provider}, function(data) {
		let s = "";
		for(let d of data) {
			s += ``;
		}
	});
}