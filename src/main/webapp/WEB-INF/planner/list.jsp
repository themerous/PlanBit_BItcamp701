<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	const user_id = "${user_id}";
	const provider = "${provider}";
</script>
<style>
	#planner-list-execute {
		width: 90%;
		margin: 20px auto;
		display: flex;
		gap: 50px;
	}
	.planner-choice {
		position: relative;
		width: 300px;
		height: 450px;
		border: 1px solid black;
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
		border: 1px solid black;
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
</style>
<div>
	<div>
		타이틀 내역들 들어가는 공간입니다
	</div>
	<div id="planner-list-execute">
		리스트가 출력될 공간입니다.
	</div>
</div>
<div id="planner-create-form">

</div>
<script src="/js/planner/plannerBoard.js"></script>
<script src="/js/planner/plannerSocket.js"></script>