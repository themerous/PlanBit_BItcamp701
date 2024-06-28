<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	let planner_num = ${planner_num};
	let page_num = ${page_num};
	let id = "${sessionScope.loginid}";
	let provider = "${sessionScope.role}";
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.css" rel="stylesheet">

<style>
	#note {
		margin: 30px auto 0;
		width: 874px;
		height: 1240px;
		resize: none;
	}
</style>

<textarea id="note" name="content" class="form-control" placeholder="내용을 입력해주세요" required></textarea>

<script src="/js/planner/plannerBoard.js"></script>
<script src="/js/planner/plannerSocket.js"></script>