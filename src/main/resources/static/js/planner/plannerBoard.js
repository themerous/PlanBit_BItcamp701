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
					<div class="input-group>
						<span class="input-group-text" id="basic-addon1">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
								<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
							</svg>	
						</span>
						<input type="text" class="form-control" placeholder="추가인원 입력" aria-describedby="basic-addon1">
					</div>
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