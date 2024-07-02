<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/board/boardDetail.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Averia+Serif+Libre:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Bebas+Neue&family=Bree+Serif&family=Hind+Vadodara:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:set var="stpath" value="https://kr.object.ncloudstorage.com/hyunsung-bucket/blog_photo"></c:set>
<%--카카오 맵 api 항상 처음에 실행되어야함--%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f6609502fa3f00b4b14ebbdcdf59da6&libraries=services,clusterer,drawing"></script>

<%--detail.jsp 댓글, 좋아요 기능 포함--%>
<script>
    let boardNum = ${dto.board_num};
    let sessionLoginId = '${sessionScope.loginid}';
    let sessionLoginOk = '${sessionScope.loginok}';
</script>
<script src="/js/board/detail.js"></script>

<script>
    function del() {
        let num = ${dto.board_num};
        let currentPage = ${currentPage};

        let a = confirm("정말 삭제하시겠습니까?");
        if (a) {
            location.href = "./delete?board_num=" + num + "&currentPage=" + currentPage;
        }
    }
</script>

<c:set var="stpath"
	value="https://kr.object.ncloudstorage.com/hyunsung-bucket/blog_photo" />
<header>
	<a onclick="location.href='/'">BIT TRIP</a>
</header>
<main>
	<div class="blog-post">
		<div class="post-image">

			<img src="${stpath}/${dto.photo}" onerror="this.src='/images/e3.jpg'">

		</div>
		<div class="post-title">
			<h2>${dto.board_title}</h2>
		</div>
		<div class="post-info">
			<i class="bi bi-calendar-check"></i>
			<p>
				<fmt:formatDate value="${dto.board_writeday}"
					pattern="yyyy.MM.dd HH:mm" />
			</p>
			<c:if test="${provider2=='bit'}"> 
					<img src="${stpath}/${profile_photo}" class="dd">
				</c:if>
				<c:if test="${provider2!='bit'}"> 
					<img src="${profile_photo}" class="dd">
				</c:if>
			<p>${dto.user_id}</p>
			<i class="bi bi-suit-heart-fill" style="color: #FF9EAA;"></i>
			<p id="likeCount">${like}</p>
			<p>조회수:&nbsp; ${dto.board_views}</p>
			<div class="post-info-btn">
				<c:if
					test="${sessionScope.loginok!=null and dto.user_num==user_num }">
					<button type="button" class="post-info-up"
						onclick="location.href='./updateform?board_num=${dto.board_num}&currentPage=${currentPage}'">수정
					</button>
					<button type="button" class="post-info-del" onclick="del()">삭제</button>
				</c:if>
				<button type="button" class="post-info-list"
					onclick="location.href='/bit/blog'">목록</button>
			</div>
		</div>
		<div class="post-content">
			<pre>${dto.board_content}</pre>
		</div>

		<%-- 카카오 맵 api detailmap.js 지도를 불러오고 게시글 작성할때 넣었던 좌표값 불러옴 --%>
		<%-- c:if 문을 사용하여 게시글 작성했을때 지도를 포함시키지 않았다면 지도 표시 x --%>
		<c:if
			test="${not empty placeNames and not empty placeLatitudes and not empty placeLongitudes}">
			<div id="map" style="width: 80%; height: 350px; margin: auto;"></div>
			<script>
                var placeNames = '${placeNames}';
                var placeAddresses = '${placeAddress}';
                var placeLatitudes = '${placeLatitudes}';
                var placeLongitudes = '${placeLongitudes}';
            </script>
			<script src="/js/board/detailmap.js"></script>
			<div class="post-maplist-box"></div>
		</c:if>

		<div class="post-reply-box">
			<div class="post-reply">
				<div class="answerlist"></div>
				<c:if test="${sessionScope.loginok!=null}">
					<div class="comment-form">
						<textarea id="acontent" class="form-control"
							placeholder="댓글을 입력하세요..."></textarea>
						<button type="button" class="" id="btnansweradd">등록</button>
					</div>
				</c:if>
			</div>
		</div>

		<div class="post-next-blog-title">
			<h2>다른 게시물</h2>
		</div>
		<div class="post-next-blog-box">
			<div class="post-next-blog">
				<img src="/images/e3.jpg" alt="이미지 설명">
			</div>
			<div class="post-next-blog">
				<img src="/images/e2.jpg" alt="이미지 설명">
			</div>
			<div class="post-next-blog">
				<img src="/images/p1.jpg" alt="이미지 설명">
			</div>
		</div>
	</div>

</main>

<button class="right-btn1"
	onclick="window.scrollTo({ top: 0, behavior: 'smooth' })"></button>
<button class="right-btn2" id="likeBtn" type="button"></button>

<!-- 모달 구조 -->
<div id="mapModal" class="modal">
	<div class="modal-content">
		<span class="close">&times;</span>
		<div id="modalMap" style="width: 100%; height: 400px;"></div>
		<div id="roadview" style="width: 100%; height: 400px;"></div>
	</div>
</div>

<style>
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 60px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.dd {
	border-radius: 50%;
	border: 1px solid black;
	width: 35px;
	height: 35px;
}

.profile-img2 {
	width: 20px; /* 프로필 사진의 너비 */
	height: 20px; /* 프로필 사진의 높이 */
	object-fit: cover; /* 이미지가 너무 클 경우 잘라내기 설정 */
	margin-top: 5px; /* 원하는 만큼 아래로 내리기 */
}
</style>
