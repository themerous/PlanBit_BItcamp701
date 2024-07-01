$(function() {
	$("#loginon").on("submit",function(e) {
		//기본 이벤트 무효화
		e.preventDefault();
		//폼안의 입력값 읽기
		let fdata = $(this).serialize();
		$.ajax({
			type: "post",
			dataType: "json",
			url: "./loginon",
			data: fdata,
			success: function(data) {

				if (data.status == 'success') {
					//로그인 성공시
					location.href = "/";
				}
				else {
					//로그인 실패시
					alert("아이디나 비밀번호가 틀렸습니다!");
				}
			}
		});
	});
	//id 이벤트
	$("#id").on("focusout", function() {
		if ($("#id").val() == '') {
			//비밀번호 칸이 비웠을때 롤백
			$("#id").css("border-color", "red");
			$("#id-msg").text("정확한 아이디를 입력하세요.").css("color", "red");
		}
	});
	$("#id").on("focusin", function() {
		$("#id").css("border-color", "#eee");
		$("#id-msg").text("");
	});
	//pw 이벤트
	$("#pw").on("focusout", function() {
		if ($("#pw").val() == '') {
			//비밀번호 칸이 비웠을때 롤백
			$("#pw").css("border-color", "red");
			$("#pw-msg").text("비밀번호는 8-20자로 입력하세요.").css("color", "red");
		}
	});
	$("#pw").on("focusin", function() {
		$("#pw").css("border-color", "#eee");
		$("#pw-msg").text("");
	});
});//exit

function flipCard() {
	document.getElementById('container').classList.toggle('flip');
}