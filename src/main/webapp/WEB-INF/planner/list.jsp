<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	const user_id = "${user_id}";
	const provider = "${provider}";
</script>
<div>
	<div>
		타이틀 내역들 들어가는 공간입니다
	</div>
	<div id="planner-list-execute">
		리스트가 출력될 공간입니다.
	</div>
</div>
<script src="/js/planner/plannerBoard.js"></script>
<script src="/js/planner/plannerSocket.js"></script>