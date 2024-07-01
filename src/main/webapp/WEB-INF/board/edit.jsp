<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="/css/board/boardWrite.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Averia+Serif+Libre:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Bebas+Neue&family=Bree+Serif&family=Hind+Vadodara:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<!-- Kakao Map API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f6609502fa3f00b4b14ebbdcdf59da6&libraries=services"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.js"></script>
<script src="${pageContext.request.contextPath}/js/board/summernote.js"></script>

<script>
    var placeNames = "${placeNames}" || "";
    var placeAddresses = "${placeAddress}" || "";
    var placeLatitudes = "${placeLatitudes}" || "";
    var placeLongitudes = "${placeLongitudes}" || "";
</script>
<script src="/js/board/editmap.js"></script>

<header><a onclick="location.href='/'">BIT TRIP</a></header>
<c:set var="stpath" value="https://kr.object.ncloudstorage.com/hyunsung-bucket/blog_photo"/>
<form action="./update" method="post" enctype="multipart/form-data">
<div class="blog-post">
    <div class="post-image">

        <img id="preview" src="<c:out value='${stpath}/${dto.photo}' />" alt="이미지 설명" style="display: block;">
    </div>

    <div class="form-group">
        <label for="upload">메인사진</label>
        <input type="file" class="form-control-file" id="upload" name="upload" onchange="previewImage(event)">
        <img class="preview-img" src="#" alt="미리보기 이미지" style="display: none;">
    </div>

    <h2 style="text-align: center;">글 수정</h2>

        <input type="hidden" name="board_num" value="${dto.board_num}">
        <input type="hidden" name="currentPage" value="${currentPage}">

        <div class="post-title">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" name="board_title" value="${dto.board_title}" required/>
            </div>
        </div>

        <div class="post-content">
            <div class="form-group">
                <label for="summernote">내용</label>
                <textarea id="summernote" name="board_content" class="form-control" required><c:out value='${dto.board_content}' /></textarea>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">수정하기</button>
        <button type="button" class="btn btn-secondary" id="togglemap">지도 추가하기</button>

        <div id="mapSection" style="display: none;">
            <div id="wrapper">
                <div class="map_wrap" id="map_wrap">
                    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                    <div id="menu_wrap" class="bg_white">
                        <div class="option">
                            <div>
                                키워드 : <input type="text" id="keyword" size="15">
                                <button type="button" onclick="searchPlaces(); return false;">검색하기</button>
                            </div>
                        </div>
                        <hr>
                        <ul id="placesList"></ul>
                        <div id="pagination"></div>
                    </div>
                </div>

                <button type="button" class="btn btn-primary" onclick="addNewBox()">추가</button>
                <div id="address-container"></div>
            </div>
            <button type="submit" class="btn btn-primary" id="submitBtn">수정하기</button>
        </div>
    </form>
</div>
