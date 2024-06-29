<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="title-left" onclick="location.href='/'">BIT TRIP</div>
<div class="title-center">
   <div class="title-menu">
      <ul>
         <li><a href="/bit/blog">Blog</a></li>
         <li><a href="">Planner</a></li>
         <li><a href="#">Map</a></li>
         <li><a href="/tour/tourMain">Tour</a></li>
         <li><a href="#">Info</a></li>
      </ul>
   </div>
</div>
<div class="title-right">
	<c:if test="${sessionScope.loginok==null }">
	   <a href="/bit/form" class="gaip-button">회원가입</a>
	   <a href="/bit/login" class="login-button">로그인</a>
	</c:if>
	<c:if test="${sessionScope.loginok!=null }">
	   <a id="logout" class="login-button">로그아웃</a>

<%--        <a class="gaip-button" onclick="location.href='/bit/mypage?id=${sessionScope.loginid}'">${sessionScope.loginid}님</a>--%>
        <a class="header-pro-button" onclick="location.href='/bit/mypage?id=${sessionScope.loginid}'"><img src="${sessionScope.img}" style="position: relative; width: 100%; height: 100%; border-radius: 50%;"></a>
    </c:if>
</div>
<script type="text/javascript">
$(function(){
	//로그아웃 버튼 이벤트
	$("#logout").click(function(){
		$.ajax({
			type:"get",
			dataType:"text",
			url:`/bit/logout`,
			success:function(){
				//전체페이지 새로고침
				location.href=`/`;
			}
		});	
	});
});
</script>