<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	let planner_num = ${dto.planner_num};
	let page_num = ${dto.page_num};
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.css" rel="stylesheet">

<style>
	#planner_page {
		display: flex;
		height: 1400px;
	}
	#planner_page_left {
		min-width: 400px;
		border: 1px solid black;
		height: 100%;
		overflow: auto;
	}
	#planner_page_buttons {
		display: flex;
		justify-content: center;
		gap: 30px;
		font-size: 30px;
	}
	#planner_page_right {
		flex-grow: 1;
		min-width: 950px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		height: 1400px;
	}
	#note {
		width: 874px;
		height: 1240px;
		resize: none;
	}
</style>
<div id="planner_page">
	<div id="planner_page_left">
		<div style="margin: 10px; text-align: center;">
			<h3>${title}</h3>
			<hr>
		</div>
		<div id="planner_page_list">

		</div>
		<div id="planner_page_buttons">
			<a onclick="addNewPlannerPage()"><i class="bi bi-plus-circle-dotted"></i></a>
			<a onclick="deletePage()"><i class="bi bi-dash-circle-dotted"></i></a>
		</div>
	</div>
	<div id="planner_page_right">
		<h3>Day ${dto.page_num}</h3>
		<div style="width: 850px; font-size: 32px; display: flex; justify-content: right; align-items: center">
			<p id="page_last_update" style="font-size: 12px; margin: 0 20px;"></p>
			<a onclick="updatePage()"><i class="bi bi-save"></i></a>
		</div>
		<textarea id="note" name="content" class="form-control" placeholder="내용을 입력해주세요" required></textarea>
	</div>
</div>
<script src="/js/planner/pageBoard.js"></script>
<script src="/js/planner/pageSocket.js"></script>