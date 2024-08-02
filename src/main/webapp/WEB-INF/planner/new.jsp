<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
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
		<h2><b>${user_id}</b>님의 플래너</h2>
	</div>
	<div style="width: 300px; padding: 20px; margin: 0 auto;">
		<form method="post" action="/planner">
			<span>제목: </span><input type="text" name="title" style="width: 260px;">
			<span>설명: </span><textarea type="text" name="detail" style="width: 260px; height: 300px;"></textarea>
			<input type="hidden" name="user_id" value="${id}">
			<input type="hidden" name="provider" value="${provider}">
			<input type="hidden" name="participent" id="participent" value="">
			<button type="submit" class="btn btn-outline-success" style="width: 260px; margin-top: 10px;">입력</button>
	 	</form>
	 	<p style="margin: 10px 0 0">작성자 추가</p>
	 	<p id="showPart"></p>
	 	<input style="width: 230px;" type="number" id="writter" placeholder="고유번호">
	 	<i style="font-size: 16px; margin-left: 10px" class="bi bi-save" onclick="addPerson()"></i>
 	</div>
</div>
<script>
	function addPerson() {
		const getFrom = document.getElementById("writter");
		const toPut = document.getElementById("participent");
		const toShow = document.getElementById("showPart");
		
		if(toPut.value = "") {
			toPut.value += getFrom.value;
			toShow.innerText += getFrom.value;
		}else {
			toPut.value += "," + getFrom.value;
			toShow.innerText += getFrom.value;
		}
		getFrom.value = "";
	}
</script>