<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
		<link href="/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="/node_modules/bootstrap-icons/font/bootstrap-icons.min.css">
   		<script src="/node_modules/jquery/dist/jquery.min.js"></script>
	<body>
		<header>
			<tiles:insertAttribute name="header"/>
		</header>
		<main>
			<div class="menu">
				<tiles:insertAttribute name="menu"/>
			</div>
			<div class="main">
				<tiles:insertAttribute name="main"/>
			</div>
		</main>
		<footer>
			<tiles:insertAttribute name="footer"/>
		</footer>
	</body>
</html>