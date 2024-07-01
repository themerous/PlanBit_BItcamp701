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
					<h3 class="planner-choice-title">${d.planner_title}</h3>
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
				<div class="planner-choice custom-font-1" id="planner-card-back">
					<p style="width: 50px; display: inline-block; margin-right: 10px">제  목: </p><input type="text" id="planner_title" style="width: 190px">
					<p style="width: 50px; display: inline-block; margin-right: 10px">참여자: </p><input type="text" id="personToAdd">
					<i class="bi bi-plus-circle" onclick="addPerson()" style="font-size: 16px; margin: 0; line-height: 20px;"></i>
					<p id="participent" style="text-align: center; width: 260px;"></p>
				</div>
			`;
		document.getElementById("planner-list-execute").innerHTML = s;
	}, "json");
}

function createPlanner() {
	
}

function addPerson() {
	const person = document.getElementById("personToAdd");
	if(document.getElementById("participent").innerText == "") {
		document.getElementById("participent").innerText += person.value;
	}else {
		document.getElementById("participent").innerText += "," + person.value;
	}
	person.value = "";
}