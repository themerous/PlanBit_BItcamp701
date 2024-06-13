<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>

<div class="title-left">지구마블</div>
<div class="title-right">
   <button id="sidebarToggle"><i class="bi bi-list"></i></button>
</div>
<aside id="sidebar" class="sidebar">
   <div class="sidebar-content">
      <button id="closeSidebar"><i class="bi bi-x"></i></button>
      <p onclick="location.href='bit/login'">로그인</p>
      <p>마이페이지</p>
      <p>플래너</p>
   </div>
</aside>

<script>
   document.getElementById('sidebarToggle').addEventListener('click', function() {
      document.getElementById('sidebar').style.width = '250px';
   });
   document.getElementById('closeSidebar').addEventListener('click', function() {
      document.getElementById('sidebar').style.width = '0';
   });
</script>