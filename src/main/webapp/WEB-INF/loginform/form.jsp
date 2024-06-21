<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/loginlayout.css">
<script src="/js/login/loginform.js"></script>
<div class="container2" id="container2">
	<div class="register-container">
		<div class="register-title">회원가입</div>
		<form action="./insert" method="post" enctype="multipart/form-data"
			onsubmit="return check()">
			<div class="form-group">
				<label for="name">이름</label> <input type="text" id="name"
					name="name" class="form-control" placeholder="이름을 입력하세요"
					maxlength="20">
			</div>
			<div class="form-group" id="info__id">
				<label for="id">아이디</label> <input type="text" id="id" name="id"
					class="form-control" placeholder="아이디를 입력하세요" maxlength="20">
				<button type="button" class="idbtn" id="btncheckid">중복확인</button>
				<small class="help-block" id="id-msg">아이디는 6-20자의 영문, 숫자
					조합으로 입력하세요.</small>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> <input type="password" id="pw"
					name="pw" class="form-control" placeholder="비밀번호를 입력하세요"
					maxlength="20"> <small class="help-block" id="pw-msg">비밀번호는
					8-20자의 영문, 숫자, 특수문자 조합으로 입력하세요.</small>
			</div>
			<div class="form-group">
				<label for="text-pw">비밀번호 확인</label> <input type="password"
					id="test-pw" name="test-pw" class="form-control"
					placeholder="비밀번호를 다시 입력하세요" maxlength="20"> <small
					class="help-block" id="test-pw-msg"></small>
			</div>
			<div class="form-group">
				<label for="email">이메일</label> <input type="email" id="email"
					name="email" class="form-control" placeholder="이메일을 입력하세요"
					maxlength="50">
			</div>
			<div class="form-group">
				<label for="question">보안 질문</label>
				<div class="select-container">
					<select id="question" name="question" class="form-control">
						<option value="" disabled selected>보안 질문을 선택하세요</option>
						<option value="1">어린 시절 가장 친한 친구의 이름은 무엇인가요?</option>
						<option value="2">첫 번째 애완동물의 이름은 무엇인가요?</option>
						<option value="3">출생지는 어디인가요?</option>
					</select> <i class="fa fa-chevron-down"></i>
				</div>
			</div>
			<div class="form-group">
				<label for="answer">질문 답변</label> <input type="text" id="answer"
					name="answer" class="form-control" placeholder="답변을 입력하세요"
					maxlength="50">
			</div>
			<div class="form-group">
				<button type="submit" class="btn">회원가입</button>
			</div>
		</form>
	</div>
</div>
