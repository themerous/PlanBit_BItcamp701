<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<script type="text/javascript">
	$(function(){
		$("#loginon").submit(function(e){
			//기본 이벤트 무효화
			e.preventDefault();
			//폼안의 입력값 읽기
			let fdata = $(this).serialize();
			$.ajax({
				type:"post",
				dataType:"json",
				url:"./loginon",
				data:fdata,
				success:function(data){
					console.log("hello");
					if(data.status=='success')
					{
						//로그인 성공시
						location.href="/";
					}
					else
					{
						//로그인 실패시
						alert("아이디나 비밀번호가 틀렸습니다!");
					}
				}
			});
		});
		//id 이벤트
		$("#id").on("focusout",function(){
			if($("#id").val()=='')
			{
				//비밀번호 칸이 비웠을때 롤백
				$("#id").css("border-color","red");
				$("#id-msg").text("정확한 아이디를 입력하세요.").css("color","red");
			}
		});
		$("#id").on("focusin",function(){
			$("#id").css("border-color","#eee");
			$("#id-msg").text("");
		});
		//pw 이벤트
		$("#pw").on("focusout",function(){
			if($("#pw").val()=='')
			{
				//비밀번호 칸이 비웠을때 롤백
				$("#pw").css("border-color","red");
				$("#pw-msg").text("비밀번호는 8-20자로 입력하세요.").css("color","red");
			}
		});
		$("#pw").on("focusin",function(){
			$("#pw").css("border-color","#eee");
			$("#pw-msg").text("");
		});
	});//exit
</script>
	<%-- login
	<form id="login">
		<div>
			<div>
				<h4>회원 로그인</h4>
			</div>
			<div>
				<table>
					<caption align="top">
						<input type="checkbox" name=saveid
						${sessionScope.saveid==null or sessionScope.saveid=='no'?"":"checked"}>&nbsp;아이디저장
					</caption>
					<tr>
						<th width="80">아이디</th>
						<td>
							<input type="text" name="id" value="${sessionScope.saveid!=null and sessionScope.saveid=='yes'?sessionScope.loginid:''}">
						</td>
					</tr>
					<tr>
						<th width="80">비밀번호</th>
						<td>
							<input type="password" name="passwd">
						</td>
					</tr>
				</table>
				<div>
					<button type="submit">로그인</button>
				</div>
			</div>
		</div>
	</form> --%>
	
	<div class="container" id="container">
    	<div class="form-container log-in-container">
    		<form id="loginon">
	            <h1>로그인</h1>
	            <span>or use your account</span>
	            <input type="text" name="id" id="id" placeholder="아이디을 입력하세요" />
	            <small class="help-block" id="id-msg"></small>
	            <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요" />
	            <small class="help-block" id="pw-msg"></small>
	            <a href="#">Forgot your password?</a>
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
	</div>

