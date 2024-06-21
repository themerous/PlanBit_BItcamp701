<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/loginlayout.css">
<script src="/js/login/login.js"></script>
<div class="container" id="container">
   <div class="form-container log-in-container">
      <form id="loginon">
         <h1>비밀번호 재설정</h1>
         <span>or use your account</span>
         <input type="password" name="pw" id="pw" placeholder="새로운 비밀번호를 입력하세요" />
         <small class="help-block" id="pw-msg"></small>
         <input type="password" name="pw" id="pw2" placeholder="새로운 비밀번호 확인" />
         <small class="help-block" id="pw-msg2"></small>
<%--         <div class="login-menu">--%>
<%--            <a onclick="flipCard()">비밀번호 찾기</a>--%>
<%--            <a href="./form">회원가입</a>--%>
<%--         </div>--%>
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


