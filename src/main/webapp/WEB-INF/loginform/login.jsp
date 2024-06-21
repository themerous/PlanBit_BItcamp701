<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/loginlayout.css">
<script src="/js/login/login.js"></script>
<div class="container" id="container">
    <div class="form-container log-in-container" id="front">
    	<form id="loginon">
	        <h1>로그인</h1>
	        <span>or use your account</span>
	        <input type="text" name="id" id="id" placeholder="아이디을 입력하세요" />
	        <small class="help-block" id="id-msg"></small>
	        <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요" />
	        <small class="help-block" id="pw-msg"></small>
			<div class="login-menu">
				<a onclick="flipCard()">비밀번호 찾기</a>
				<a href="./form">회원가입</a>
			</div>
	    	<button type="submit">로그인</button>
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
	<div class="form-container log-in-container" id="back">
		<form action="#">
			<h1>비밀번호 찾기</h1>
			<span>or use your account</span>
			<input type="email" placeholder="이메일을 입력하세요" />
			<input type="password" placeholder="비밀번호 질문의 답을 입력하세요" />
			<div class="login-menu">
				<a onclick="flipCard()">로그인</a>
				<a href="./form">회원가입</a>
			</div>
			<button>찾기</button>
		</form>
	</div>
</div>

