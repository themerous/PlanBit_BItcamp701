<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	//이메일 인증번호 발송 함수
	 function sendNumber(){
	        /* $("#mail_number").css("display","block"); */
	        $.ajax({
	            url:"./mail",
	            type:"post",
	            dataType:"json",
	            data:{"mail" : $("#mail").val()},
	            success:function(data){
	                $("#Confirm").attr("value",data);
	                $("#mail").css("border-color","green");
	                $("#mail_msg").text("인증번호 발송").css("color","green");
	            }
	        });
	    }
	 //이메일 인증번호 인증 함수
	 function confirmNumber(){
	        let num1 = $("#number").val();
	        let num2 = $("#Confirm").val();

	        if(num1==num2)
	        {
	        	$("#number").css("border-color","green");
	        	$("#number_msg").text("인증되었습니다.").css("color","green");
	        	setTimeout(function() {
	        	    location.href = "./passform?mail="+$('#mail').val();
	        	}, 1000);
	        }
	        else
	        {
	        	$("#number").css("border-color","red");
	        	$("#number_msg").text("번호가 다릅니다.").css("color","red");
	        }
	    }
</script>
<link rel="stylesheet" href="/css/loginlayout.css">
<script src="/js/login/login.js"></script>
<div class="container" id="container">
    <div class="form-container log-in-container" id="front">
    	<form id="loginon">
	        <h1>로그인</h1>
	        <span>or use your account</span>
			<div class="s-box">
				<a href="/oauth2/authorization/google">
					<img src="/images/googlebtn.png" alt="Google" style="width: 40px">
				</a>
				<a href="/oauth2/authorization/naver">
					<img src="/images/naverbtn.png" alt="Naver" style="width: 40px">
				</a>
				<a href="/oauth2/authorization/kakao">
					<img src="/images/kakaobtn.png" alt="Kakao" style="width: 40px">
				</a>
			</div>
	        <input type="email" name="id" id="id" placeholder="아이디을 입력하세요" />
	        <small class="help-block" id="id-msg"></small>
	        <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요" />
	        <small class="help-block" id="pw-msg"></small>
			<div class="login-menu">
				<a onclick="flipCard()">비밀번호 찾기</a>
				<a href="./form">회원가입</a>
			</div>
	    	<button type="submit" class="login-btn">로그인</button>
    	</form>
    </div>
   	<div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-right">
	            <h1>BIT TRIP Login Form</h1>
				<p>
					Log in to your BIT TRIP account.
	        	</p>
            </div>
        </div>
    </div>
	<div class="form-container log-in-container" id="back">
		<form>
			<h1>비밀번호 찾기</h1>
			<span>or use your account</span>
			<div style="width: 100%; position: relative;">
				<input type="email" name="mail" id="mail" placeholder="이메일을 입력하세요"/>
				<button type="button" class="password-btn" onclick="sendNumber()">인증번호 발송</button>
			</div>
			<small class="help-block" id="mail_msg"></small>
			<div style="width: 100%; position: relative;">
				<input type="text" name="number" id="number" placeholder="인증번호 입력"/>
				<button type="button" class="email-btn" onclick="confirmNumber()">인증번호 확인</button>
			</div>
			<small class="help-block" id="number_msg"></small>
			<div class="login-menu">
				<a onclick="flipCard()">로그인</a>
				<a href="./form">회원가입</a>
			</div>
		</form>
		 <input type="hidden" id="Confirm" name="Confirm" value="">
	</div>
</div>

