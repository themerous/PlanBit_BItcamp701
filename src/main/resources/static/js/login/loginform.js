let jungbok = false;
$(function() {
	//아이디
	//아이디 중복버튼 이벤트
	$("#btncheckid").click(function() {
		if ($("#id").val() == '') {
			alert("가입할 아이디 입력");
			//아이디 text칸에 비워있을때 
			return;
		}
		//여기에 입력을 안했을때 회원가입을 못가게
		$.ajax({
			type: "get",
			dataType: "json",
			url: "./idcheck",
			data: { "searchid": $("#id").val() },
			success: function(data) {
				if (data.count == 0) {
					//중복없음
					jungbok = true;
					$("#id").css("border-color", "green");
					$("#id-msg").text("사용 가능한 아이디입니다.").css("color", "green");
				}
				else {
					//중복있음
					jungbok = false;
					$("#id").css("border-color", "red");
					$("#id-msg").text("이미 사용 중인 아이디입니다.").css("color", "red");
					//아이디 text칸 비워줌
					$("#id").val("");
				}
			}
		});
	});
	//아이디 다시 입력시 중복이벤트 리셋 이벤트
	$("#id").on("keyup", function() {
		jungbok = false;
		if ($("#id").val() == '') {
			//아이디 칸이 비웠을때 롤백
			$("#id").css("border-color", "#cccccc");
			$("#id-msg").text("이메일는 6-20자의 영문, 숫자, @ 조합으로 입력하세요.").css("color", "#777777");
		}
		else {
			// 아이디 입력 시 테두리를 빨간색으로 설정
			$("#id").css("border-color", "red");
			$("#id-msg").text("중복확인 버튼을 누르세요").css("color", "red");
		}
	});
	//비밀번호
	//입력시 이벤트
	let pwrx = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,20}$/;
	$("#pw").on("keyup", function() {
		let pw = $("#pw").val();
		if (pw === '') {
			//비밀번호 칸이 비웠을때 롤백
			$("#pw").css("border-color", "#cccccc");
			$("#pw-msg").text("비밀번호는 8-20자의 영문, 숫자, 특수문자 조합으로 입력하세요.").css("color", "#777777");
		}
		else if (pwrx.test(pw)) {
			//비밀번호 조건이 맞을때
			$("#pw").css("border-color", "green");
			$("#pw-msg").text("비밀번호 조건이 맞습니다.").css("color", "green");
		}
		else {
			//비밀번호 입력시 
			$("#pw").css("border-color", "red");
			$("#pw-msg").text("비밀번호는 8-20자의 영문, 숫자, 특수문자 조합으로 입력하세요.").css("color", "red");
		}
	});
	//비밀번호확인
	$("#test-pw").on("keyup", function() {
		if ($("#test-pw").val() == '') {
			//비밀번호확인 칸이 비웠을때 롤백
			$("#test-pw").css("border-color", "#cccccc");
			$("#test-pw-msg").text("");
		}
		else if ($("#pw").val() == $("#test-pw").val()) {
			//비밀번호확인 조건이 맞을때
			$("#test-pw").css("border-color", "green");
			$("#test-pw-msg").text("비밀번호가 맞습니다.").css("color", "green");
		}
		else {
			//비밀번호확인창 입력시
			$("#test-pw").css("border-color", "red");
			$("#test-pw-msg").text("비밀번호가 틀립니다.").css("color", "red");
		}
	});
	//이름
	$("#name").on("keyup", function() {
		if ($("#name").val() == '') {
			//이름 칸이 비웠을때 롤백
			$("#name").css("border-color", "#cccccc");
		}
		else {
			//이름 칸에 값이 들어왔을때
			$("#name").css("border-color", "green");
		}
	});
	//이미지
	$("#photo").on("keyup", function() {
		if ($("#photo").val() == '') {
			//이름 칸이 비웠을때 롤백
			$("#photo").css("border-color", "#cccccc");
		}
		else {
			//이름 칸에 값이 들어왔을때
			$("#photo").css("border-color", "green");
		}
	});
});// exit
function check() {
	if (!jungbok) {
		alert("중복확인 버튼 좀 눌러라");
		return false;
	}
}