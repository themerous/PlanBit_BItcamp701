const pageList = document.getElementById("planner_page_list");
const lastUpdate = document.getElementById("page_last_update");
const page = document.getElementById("note");

window.onload = () => {
	pageconnect();
	loadPageList();
	lastUpdateTime();
}

function loadPageList() {
	$.get("/planner/page/list", {"planner_num" : planner_num}, function(data) {
		let s = "";
		for(i=0 ; i < data ; i++) {
			 s += `
				<a href="/planner/page?planner_num=${planner_num}&page_num=${i+1}"
				style="display: flex; justify-content: center; align-items: center; 
				margin: 10px auto; width: 300px; height: 50px; border: 1px solid black; 
				border-radius: 10px; color: black; text-decoration: none;">Day ${i+1}</a>
			`;
			pageList.innerHTML = s;
		}
	}, "json");
}

function lastUpdateTime() {
	$.get("/planner/page/time", {"planner_num" : planner_num, "page_num": page_num}, function(data) {
		lastUpdate.innerText = "최종수정일: " + data;
	});
}

page.addEventListener("input", (e) => {
	if(!e.isComposing) {
		sendContent();
	}
});

function sendContent() {
	const content = page.value;
	const cursorPosition = page.selectionStart;
	socket.send(content + "|" + cursorPosition);
}

function addNewPlannerPage() {
	let pageListCount = pageList.children.length;
	
	pageList.innerHTML += `
		<a href="/planner/page?planner_num=${planner_num}&page_num=${pageListCount + 1}"
		style="display: flex; justify-content: center; align-items: center; 
		margin: 10px auto; width: 300px; height: 50px; border: 1px solid black; 
		border-radius: 10px; color: black; text-decoration: none;">Day ${pageListCount + 1}</a>
	`;
	$.post("/planner/page", {"planner_num": planner_num, "page_num": pageListCount + 1}, function (){
		console.log("new Page successfully created");
		socket.send("vpdlwl#cnrk#goTek|0");
	});
}

function deletePage() {	
	let pageListCount = pageList.children.length;
	$.ajax({
	    url: "/planner/page",
	    type: "DELETE",
	    data: {
	        planner_num: planner_num,
	        page_num: pageListCount
	    },
	    success: function() {
	        console.log("last Page deleted successfully");
	        socket.send("tkrwp#$%dhksfy|0");
	    }
	});
	if(pageListCount == page_num) {
		if(pageListCount == 1) {
			$.ajax({
			    url: "/planner",
			    type: "DELETE",
			    data: {
			        planner_num: planner_num
			    },
			    success: function() {
			        console.log("planner deleted");
			        location.href = `/planner`;
			    }
			});
		}
		location.href = `/planner/page?planner_num=${planner_num}&page_num=1`;
	}
}

function updatePage() {
	$.ajax({
		url: "/planner/page",
		type: "PUT",
		data: {
	        planner_num: planner_num,
	        page_num: page_num,
	        content: page.value
	    },
		success: function() {
			console.log("planner updated");
			socket.send("chlwhdtnwjddlf#@!qkRnla|0");
		}
	});
}