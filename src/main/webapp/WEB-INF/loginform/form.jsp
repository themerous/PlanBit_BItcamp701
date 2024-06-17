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

<script type="text/javascript">
	let jungbok = false;	
	$(function(){	
		//아이디
		//아이디 중복버튼 이벤트
		$("#btncheckid").click(function(){
			if($("#id").val()=='')
			{
				alert("가입할 아이디 입력");
				//아이디 text칸에 비워있을때 
				return;
			}
			//여기에 입력을 안했을때 회원가입을 못가게
			$.ajax({
				type:"get",
				dataType:"json",
				url:"./idcheck",
				data:{"searchid":$("#id").val()},
				success:function(data){
					if(data.count==0)
					{
						//중복없음
						jungbok = true;
						$("#id").css("border-color", "green");
	                    $("#id-msg").text("사용 가능한 아이디입니다.").css("color", "green");
					}
					else
					{
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
	            if($("#id").val()=='')
	    		{
	    			//아이디 칸이 비웠을때 롤백
	    			$("#id").css("border-color", "#cccccc");
	    			$("#id-msg").text("아이디는 6-20자의 영문, 숫자 조합으로 입력하세요.").css("color","#777777");
	    		}
	    		else
	    		{
	    			// 아이디 입력 시 테두리를 빨간색으로 설정
	    		    $("#id").css("border-color", "red");
	    		    $("#id-msg").text("중복확인 버튼을 누르세요").css("color","red");
	    		}
	    });
		//비밀번호
		//입력시 이벤트
		let pwrx = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,20}$/;
		$("#pw").on("keyup",function(){
			let pw = $("#pw").val();
			if(pw==='')
			{
				//비밀번호 칸이 비웠을때 롤백
				$("#pw").css("border-color","#cccccc");
				$("#pw-msg").text("비밀번호는 8-20자의 영문, 숫자, 특수문자 조합으로 입력하세요.").css("color","#777777");
			}
			else if(pwrx.test(pw))
			{
				//비밀번호 조건이 맞을때
				$("#pw").css("border-color","green");
				$("#pw-msg").text("비밀번호 조건이 맞습니다.").css("color", "green");
			}
			else
			{
				//비밀번호 입력시 
				$("#pw").css("border-color","red");
				$("#pw-msg").text("비밀번호는 8-20자의 영문, 숫자, 특수문자 조합으로 입력하세요.").css("color","red");
			}
		});
		//비밀번호확인
		$("#test-pw").on("keyup",function(){
			if($("#test-pw").val()=='')
			{
				//비밀번호확인 칸이 비웠을때 롤백
				$("#test-pw").css("border-color","#cccccc");
				$("#test-pw-msg").text("");
			}
			else if($("#pw").val()==$("#test-pw").val())
			{
				//비밀번호확인 조건이 맞을때
				$("#test-pw").css("border-color","green");
				$("#test-pw-msg").text("비밀번호가 맞습니다.").css("color","green");
			} 
			else
			{
				//비밀번호확인창 입력시
				$("#test-pw").css("border-color","red");
				$("#test-pw-msg").text("비밀번호가 틀립니다.").css("color","red");
			}
		});
		//이름
		$("#name").on("keyup",function(){
			if($("#name").val()=='')
			{
				//이름 칸이 비웠을때 롤백
				$("#name").css("border-color","#cccccc");
			}
			else
			{
				//이름 칸에 값이 들어왔을때
				$("#name").css("border-color","green");
			}
		});
		//이메일
		$("#email").on("keyup",function(){
			if($("#email").val()=='')
			{
				//이름 칸이 비웠을때 롤백
				$("#email").css("border-color","#cccccc");
			}
			else
			{
				//이름 칸에 값이 들어왔을때
				$("#email").css("border-color","green");
			}
		});
		//질문
		$("#question").on("click",function(){
			if($("#question").val()=='')
			{
				//이름 칸이 비웠을때 롤백
				$("#question").css("border-color","#cccccc");
			}
			else
			{
				//이름 칸에 값이 들어왔을때
				$("#question").css("border-color","green");
			}
		});
		//질문답변
		$("#answer").on("keyup",function(){
			if($("#answer").val()=='')
			{
				//이름 칸이 비웠을때 롤백
				$("#answer").css("border-color","#cccccc");
			}
			else
			{
				//이름 칸에 값이 들어왔을때
				$("#answer").css("border-color","green");
			}
		});
	});// exit
	function check()
	{
		if(!jungbok)
		{
			alert("중복확인 버튼 좀 눌러라");
			return false;
		}
	}
</script>

	<div class="container2" id="container2">
          <div class="register-container">
              <div class="register-title">회원가입</div>
              <form action="./insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
                  <div class="form-group">
                      <label for="name">이름</label>
                      <input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요" maxlength="20">
                  </div>
                  <div class="form-group" id="info__id">
                      <label for="id">아이디</label>
                      <input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력하세요" maxlength="20">
                      <button type="button" class="idbtn" id="btncheckid">중복확인</button>
                      <small class="help-block" id="id-msg">아이디는 6-20자의 영문, 숫자 조합으로 입력하세요.</small>
                  </div>
                  <div class="form-group">
                      <label for="pw">비밀번호</label>
                      <input type="password" id="pw" name="pw" class="form-control" placeholder="비밀번호를 입력하세요" maxlength="20">
                      <small class="help-block" id="pw-msg">비밀번호는 8-20자의 영문, 숫자, 특수문자 조합으로 입력하세요.</small>
                  </div>
                  <div class="form-group">
                      <label for="text-pw">비밀번호 확인</label>
                      <input type="password" id="test-pw" name="test-pw" class="form-control" placeholder="비밀번호를 다시 입력하세요" maxlength="20">
                      <small class="help-block" id="test-pw-msg"></small>
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

                  <div class="form-group">
                      <button type="submit" class="btn">회원가입</button>
                  </div>
              </form>
          </div>
	</div>
