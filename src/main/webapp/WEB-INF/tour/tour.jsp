<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="/css/tour/tour.css">
<script>
	let check = "${sessionScope.loginok}";
</script>

<div class="high">
	<div class="highTitle">
		<input type="text" name="tt" id="tt" value="" placeholder="검색어를 입력하세요">
		<button type="submit" id="searchButton" onclick="getSearch()">검색</button>
	</div>

	<div id="result"></div>
</div>
<div id="tourMain" class="tourMain">
		<div class="left">
		<div class="mapButton">
			<input name="s" type="radio" value="" onclick="setArea(this.value)" class="radiobtn">전체</input>
			<img src="/images/korea.png" class="leftImg" style="width: 100%; height: 100%">
	<%--		<img src="/images/koreaMap.png" alt="Image Korea" style="">--%>
			<input name="s" id="seoul" type="radio" value="1" onclick="setArea(this.value)" class="radiobtn">
			<label for="seoul">서울</label>
			<input name="s" id="busan" type="radio" value="6" onclick="setArea(this.value)" class="radiobtn">
			<label for="busan">부산</label>
			<input name="s" id="daegu" type="radio" value="4" onclick="setArea(this.value)" class="radiobtn">
			<label for="daegu">대구</label>
			<input name="s" id="incheon" type="radio" value="2" onclick="setArea(this.value)" class="radiobtn">
			<label for="incheon">인천</label>
			<input name="s" id="gwangju" type="radio" value="5" onclick="setArea(this.value)" class="radiobtn">
			<label for="gwangju">광주</label>
			<input name="s" id="daejeon" type="radio" value="3" onclick="setArea(this.value)" class="radiobtn">
			<label for="daejeon">대전</label>
			<input name="s" id="ulsan" type="radio" value="7" onclick="setArea(this.value)" class="radiobtn">
			<label for="ulsan">울산</label>
			<input name="s" id="sejong" type="radio" value="8" onclick="setArea(this.value)" class="radiobtn">
			<label for="sejong">세종</label>
			<input name="s" id="gyeonggi" type="radio" value="31" onclick="setArea(this.value)" class="radiobtn">
			<label for="gyeonggi">경기</label>
			<input name="s" id="gangwon" type="radio" value="32" onclick="setArea(this.value)" class="radiobtn">
			<label for="gangwon">강원</label>
			<input name="s" id="chungbuk" type="radio" value="33" onclick="setArea(this.value)" class="radiobtn">
			<label for="chungbuk">충북</label>
			<input name="s" id="chungnam" type="radio" value="34" onclick="setArea(this.value)" class="radiobtn">
			<label for="chungnam">충남</label>
			<input name="s" id="gyeongbuk" type="radio" value="35" onclick="setArea(this.value)" class="radiobtn">
			<label for="gyeongbuk">경북</label>
			<input name="s" id="gyeongnam" type="radio" value="36" onclick="setArea(this.value)" class="radiobtn">
			<label for="gyeongnam">경남</label>
			<input name="s" id="jeonbuk" type="radio" value="37" onclick="setArea(this.value)" class="radiobtn">
			<label for="jeonbuk">전북</label>
			<input name="s" id="jeonnam" type="radio" value="38" onclick="setArea(this.value)" class="radiobtn">
			<label for="jeonnam">전남</label>
			<input name="s" id="jeju" type="radio" value="39" onclick="setArea(this.value)" class="radiobtn">
			<label for="jeju">제주</label>
		</div>
	</div>

	<div class="right">
		<div id="contentTypeId">
			<input type="radio" name="c" class="contentList" id="tourist" value="12" onclick="setType(this.value)">
			<label for="tourist">관광지</label>
			<input type="radio" name="c" class="contentList" id="lodge" value="32" onclick="setType(this.value)">
			<label for="lodge">숙박</label>
			<input type="radio" name="c" class="contentList" id="food" value="39" onclick="setType(this.value)">
			<label for="food">음식점</label>
			<button type="button" onclick="getMapInitial()" class="contentList-search">검색하기</button>
		</div>
		<br>
		<div id="tourList">
			<div id="mapList"></div>
		</div>
	</div>
</div>
<script src="/js/tour/tour.js"></script>