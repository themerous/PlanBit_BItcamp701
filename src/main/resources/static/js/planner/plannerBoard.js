window.onload = () => {
	getPlannerList();
}

function sendContent() {
	
}

function getPlannerList() {
	$.get("/planner/list", {"user_id": user_id, "provider": provider}, function(data) {
		let s = "";
		for(let d of data) {
			s += `
				<div class="planner-choice" onclick="location.href = '/planner/page?planner_num=${d.planner_num}&page_num=1'">
					<h3 class="planner-choice-title">${d.planner_title}</h2>
					<p class="planner-choice-detail">${d.planner_detail}</p>
					<p class="planner-choice-lastupdate">최종수정일: ${d.last_update}</p>
				</div>
			`;
		}
		s += `
				<div class="planner-choice" onclick="createPlanner()">
					<div style="width: 100px; height: 100px; margin: 175px auto;">
					<i class="bi bi-plus-circle" style="font-size: 100px; line-height: 100px;"></i>
					</div>
				</div>
			`;
		document.getElementById("planner-list-execute").innerHTML = s;
	}, "json");
}

function createPlanner() {
	const form = document.getElementById("planner-create-form");
	form.style.display = "block";
}