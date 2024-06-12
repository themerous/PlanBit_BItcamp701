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
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
   		<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
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