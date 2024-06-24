<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="/css/tour/tour.css">


<span>Hello Tour</span>
<div id="tourMain" class="tourMain">
	<div class="left">
		<div id="mapButton">
	<%--		<img src="/images/koreaMap.png" alt="Image Korea" style="">--%>
				<input type="radio" value="" onclick="setArea(this.value)">전체</input>
				<input type="radio" value="1" onclick="setArea(this.value)">서울</input>
				<input type="radio" value="6" onclick="setArea(this.value)">부산</input>
				<input type="radio" value="4" onclick="setArea(this.value)">대구</input>
				<input type="radio" value="2" onclick="setArea(this.value)">인천</input>
				<input type="radio" value="5" onclick="setArea(this.value)">광주</input>
				<input type="radio" value="3" onclick="setArea(this.value)">대전</input>
				<input type="radio" value="7" onclick="setArea(this.value)">울산</input>
				<input type="radio" value="8" onclick="setArea(this.value)">세종</input>
				<input type="radio" value="31" onclick="setArea(this.value)">경기</input>
				<input type="radio" value="32" onclick="setArea(this.value)">강원</input>
				<input type="radio" value="33" onclick="setArea(this.value)">충북</input>
				<input type="radio" value="34" onclick="setArea(this.value)">충남</input>
				<input type="radio" value="35" onclick="setArea(this.value)">경북</input>
				<input type="radio" value="36" onclick="setArea(this.value)">경남</input>
				<input type="radio" value="37" onclick="setArea(this.value)">전북</input>
				<input type="radio" value="38" onclick="setArea(this.value)">전남</input>
				<input type="radio" value="39" onclick="setArea(this.value)">제주</input>
		</div>
	</div>
	<div class="right">
		<div id="tourList">
			<div id="contentTypeId">
				<input type="radio" name="c" class="contentList" id="tourist" value="12" onselect="setType(this.value)">
				<label for="tourist">관광지</label>
				<input type="radio" name="c" class="contentList" id="lodge" value="32" onselect="setType(this.value)">
				<label for="lodge">숙박</label>
				<input type="radio" name="c" class="contentList" id="food" value="39" onselect="setType(this.value)">
				<label for="food">음식점</label>

				<button type="button" onclick="getMap()">검색하기</button>
			</div>

			<div id="mapList">
				<span>tourListResult</span>
				<%--pageNum--%>
			</div>
		</div>
	</div>
</div>
<script src="/js/tour/tour.js"></script>