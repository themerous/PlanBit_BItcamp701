<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<script type="text/javascript">
	/* $(function(){
		$("#login").submit(function(e){
			//기본 이벤트 무효화
			e.preventDefault();
			//폼안의 입력값 읽기
			let fdata = $(this).serialize();
			$.ajax({
				type:"get",
				dataType:"json",
				url:"bit/login",
				data:fdata,
				success:function(data){
					if(data.status=='success')
					{
						//로그인 성공시
					}
					else
					{
						//로그인 실패시
					}
				}
			});
		});
	}); */
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
	            <input type="text" name="id" placeholder="아이디을 입력하세요" />
	            <input type="password" name="pw" placeholder="비밀번호를 입력하세요" />
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

