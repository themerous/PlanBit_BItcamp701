<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#planner-list-execute {
		width: 90%;
		margin: 20px auto;
		display: block;
	}
	.planner-choice {
		display: inline-block;
		margin: 0 25px 25px 0;
		position: ;
		width: 300px;
		height: 450px;
		background-color: rgba(81,227,212);
		color: white;
		border-radius: 10px;
	}
	.planner-choice-title {
		width: 260px;
		margin: 20px auto 0;
		text-align: center;
	}
	.planner-choice-detail {
		width: 260px;
		height: 320px;
		margin: 20px auto 0;
		background-color: white;
		color: black;
		border-radius: 10px;
		padding: 10px;
		font-size: 16px;
	}
	.planner-choice-lastupdate {
		position: absolute;
		font-size: 12px;
		right: 20px;
		bottom: 0px;
	}

	#planner-create-form {
		position: absolute;
		width: 100%;
		height: 100%;

	}
	.custom-font-1 {
		font-size: 12px;
		padding: 20px;
	}
	#planner-title-area{
		width: 95%;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100px;
		border-bottom: 1px solid black;
		margin: 30px auto;
	}
</style>
<div>
	<div id="planner-title-area">
		<h3><b>${user_id}</b>님의 플래너</h3>
	</div>
	<div id="planner-list-execute">
		리스트가 출력될 공간입니다.
	</div>
</div>
<div id="planner-create-form">

</div>
<script src="/js/planner/plannerBoard.js"></script>
<script src="/js/planner/plannerSocket.js"></script>