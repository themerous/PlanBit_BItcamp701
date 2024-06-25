<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/loginlayout.css">
<script src="/js/login/login.js"></script>
<div class="container" id="container">
   <div class="form-container log-in-container">
      <form action="./passon">
      <input type="hidden" value="${dto.id }" name="id">
      <input type="hidden" value="${dto.pw }" name="pw">
         <h1>비밀번호 재설정</h1>
         <span>or use your account</span>
         <input type="password" name="repw" id="repw" placeholder="새로운 비밀번호를 입력하세요" />
         <small class="help-block" id="repw-msg">비밀번호는 8-20자의 영문, 숫자, 특수문자 조합으로 입력하세요.</small>
         <input type="password" name="repw2" id="repw2" placeholder="새로운 비밀번호 확인" />
         <small class="help-block" id="repw2-msg"></small>
         <button type="submit" class="login-btn">비밀번호 재설정</button>
      </form>
   </div>
   <div class="overlay-container">
      <div class="overlay">
         <div class="overlay-panel overlay-right">
            <h1>HTML CSS Login Form</h1>
            <p>
               Facebook login page Clone using HTML and CSS.
            </p>
         </div>
      </div>
   </div>
</div>
<script type="text/javascript">
	//비밀번호 재설정
	let pwrx2 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,20}$/;
	$("#repw").on("keyup", function() {
		console.log("${dto.pw}");
		let repw = $("#repw").val();
		if (repw === '') {
			//비밀번호 칸이 비웠을때 롤백
			$("#repw").css("border-color", "#cccccc");
			$("#repw-msg").text("비밀번호는 8-20자의 영문, 숫자, 특수문자 조합으로 입력하세요.").css("color", "#777777");
		}
		else if (repw === "${dto.pw}") {
			//이전 비밀번호와 같을때
			$("#repw").css("border-color", "red");
			$("#repw-msg").text("이전 비밀번호와 같습니다.").css("color", "red");
		}
		else if (pwrx2.test(repw) && repw != "${dto.pw}") {
			//비밀번호 조건이 맞을때
			$("#repw").css("border-color", "green");
			$("#repw-msg").text("비밀번호 조건이 맞습니다.").css("color", "green");
		}
		else {
			//비밀번호 입력시 
			$("#repw").css("border-color", "red");
			$("#repw-msg").text("비밀번호는 8-20자의 영문, 숫자, 특수문자 조합으로 입력하세요.").css("color", "red");
		}
	});
	//비밀번호 재설정 확인
	$("#repw2").on("keyup", function() {
		if ($("#repw2").val() == '') {
			//비밀번호확인 칸이 비웠을때 롤백
			$("#repw2").css("border-color", "#cccccc");
			$("#repw2-msg").text("");
		}
		else if ($("#repw").val() == $("#repw2").val()) {
			//비밀번호확인 조건이 맞을때
			$("#repw2").css("border-color", "green");
			$("#repw2-msg").text("비밀번호가 맞습니다.").css("color", "green");
		}
		else {
			//비밀번호확인창 입력시
			$("#repw2").css("border-color", "red");
			$("#repw2-msg").text("비밀번호가 틀립니다.").css("color", "red");
		}
	});
</script>