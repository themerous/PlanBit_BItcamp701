<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
	<%-- form입니다!
	<form action="./insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
		<table class="table table-bordered" style="width: 500px;">
			<caption align="top">
				<h3><b>회원 가입</b></h3>
			</caption>
			<tr>
				<th width="100" class="table-info">이름</th>
				<td colspan="2">
					<input type="text" name="name" class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-info">아이디</th>
				<td colspan="2">
					<div class="input-group">
						<input type="text" name="id" id="id" class="form-control" required="required">
						&nbsp;
						<button type="button" class="btn btn-sm btn-danger" id="btncheckid">중복확인</button>
					</div>
				</td>
			</tr>
			<tr>
				<th width="100" class="table-info">비밀번호</th>
				<td width="200">
					<!--maxlength : 글자 최대  -->
					<input type="password" name="pw" class="form-control" required="required" maxlength="8">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-info">이메일</th>
				<td width="200">
					<!--maxlength : 글자 최대  -->
					<input type="text" name="emall" class="form-control" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<button type="reset" class="btn btn-sm btn-outline-danger" style="width: 100px;">초기화</button>
					<button type="submit" class="btn btn-sm btn-outline-danger" style="width: 100px;">회원가입</button>
				</td>
			</tr>
		</table>
	</form> --%>

	<div class="container2" id="container2">
          <div class="register-container">
              <div class="register-title">회원가입</div>
              <form action="./insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
                  <div class="form-group">
                      <label for="name">이름</label>
                      <input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요" maxlength="20">
                  </div>
                  <div class="form-group">
                      <label for="id">아이디</label>
                      <input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력하세요" maxlength="20">
                      <small class="help-block">아이디는 6-20자의 영문, 숫자 조합으로 입력하세요.</small>
                  </div>
                  <div class="form-group">
                      <label for="pw">비밀번호</label>
                      <input type="password" id="pw" name="pw" class="form-control" placeholder="비밀번호를 입력하세요" maxlength="20">
                      <small class="help-block">비밀번호는 8-20자의 영문, 숫자, 특수문자 조합으로 입력하세요.</small>
                  </div>
                  <div class="form-group">
                      <label for="text-pw">비밀번호 확인</label>
                      <input type="password" id="text-pw" name="text-pw" class="form-control" placeholder="비밀번호를 다시 입력하세요" maxlength="20">
                  </div>
                  <div class="form-group">
                      <label for="email">이메일</label>
                      <input type="email" id="email" name="email" class="form-control" placeholder="이메일을 입력하세요" maxlength="50">
                  </div>

                  <div class="form-group">
                      <label for="question">보안 질문</label>
                      <div class="select-container">
                          <select id="question" name="question" class="form-control">
                              <option value="" disabled selected>보안 질문을 선택하세요</option>
                              <option value="question1">어린 시절 가장 친한 친구의 이름은 무엇인가요?</option>
                              <option value="question2">첫 번째 애완동물의 이름은 무엇인가요?</option>
                              <option value="question3">출생지는 어디인가요?</option>
                          </select>
                          <i class="fa fa-chevron-down"></i>
                      </div>
                  </div>
                  <div class="form-group">
                      <label for="answer">질문 답변</label>
                      <input type="text" id="answer" name="answer" class="form-control" placeholder="답변을 입력하세요" maxlength="50">
                  </div>

                  <!-- 주소 입력 -->
                  <div class="form-group">
                      <label for="address">주소</label>
                      <input type="text" id="address" class="form-control" placeholder="주소를 입력하세요" maxlength="100">
                  </div>

                  <div class="form-group">
                      <button type="submit" class="btn">회원가입</button>
                  </div>
              </form>
          </div>
	</div>
