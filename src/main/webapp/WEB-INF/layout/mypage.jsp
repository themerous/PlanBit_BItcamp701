<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="stpath"
	value="https://kr.object.ncloudstorage.com/hyunsung-bucket/blog_photo"></c:set>
<style>
    body * {
        font-family: "IBM Plex Sans KR", sans-serif;
    }
    #blog-title-photo {
        width: 100%;
        height: 400px;
        background-image: url('/images/e4.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        margin-bottom: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #blog-title-photo h1 {
        color: white;
        font-size: 90px;
        font-family: "Neuton", serif;
        text-align: center;
    }
    .card-img-top {
        object-fit: cover;
        height: 300px;
    }
    .row {
        display: flex;
        flex-wrap: wrap;
    }
    .col-lg-6 {
        width: 400px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 10px;
        box-sizing: border-box;
        flex: 0 0 calc(50% - 20px);
        margin: 10px;
    }
    #plus-btn1 {
        background-color: #51e3d4;
        border: 1px solid #51e3d4;
    }
    .btn-btn-primary {
        background-color: #51e3d4;
        border: 1px solid #51e3d4;
        border-radius: 4px;
        color: white;
        padding: 8px 10px;
        text-decoration: none;
		cursor: pointer;
    }
	.btn-btn-primary1 {
		background-color: #51e3d4;
		border: 1px solid #51e3d4;
		border-radius: 4px;
		color: white;
		padding: 8px 10px;
		text-decoration: none;
		margin-bottom: 10px;

	}
	.btn-btn-danger {
		background-color: #d95050;
		border: 1px solid #d95050;
		border-radius: 4px;
		color: white;
		padding: 8px 10px;
		text-decoration: none;
	}
    .c-box li {
        list-style: none;
    }
    .c-box a {
        color: #51e3d4;
        text-decoration: none;
        font-size: 20px;
        font-weight: bold;
    }
    .card-blog {
        background-color: #51e3d4;
        border-radius: 4px;
        height: 400px;
    }
    .card-body1 {
        font-size: 40px;
        color: white;
        height: auto;
        padding: 40px;
    }
    .card-body1-btn {
        margin-top: 10px;
        border-radius: 4px;
        background-color: white;
        border: none;
        color: #51e3d4;
        font-size: 30px;
        padding: 5px 10px;
        font-weight: bold;
    }
    .bottom-box {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .profile-img {
        width: 35px; /* 프로필 사진의 너비 */
        height: 35px; /* 프로필 사진의 높이 */
        border-radius: 50%; /* 동그라미 모양으로 만드는 속성 */
        object-fit: cover; /* 이미지가 너무 클 경우 잘라내기 설정 */
        margin-right: 10px; /* 프로필 사진과 버튼 사이의 간격 */
        border: 1px solid #51e3d4;
    }

    .profile-img2 {
        width: 30px; /* 프로필 사진의 너비 */
        height: 30px; /* 프로필 사진의 높이 */
        object-fit: cover; /* 이미지가 너무 클 경우 잘라내기 설정 */

    }
    .images-heart {
        display: flex;
        align-items: center;
    }
    .bottom-box i {
        font-size: 30px;
    }
    .card-mb6 {
        margin-top: 20px;
        padding: 20px;
        border-radius: 4px;
        border: 1px solid #cccccc;
    }
    .card-img-top {
        border-radius: 4px;
    }
    .main-profile-img {
        width: 130px;
        height: 130px;
        border-radius: 50%;
        object-fit: cover;
        float: left;
        margin-right: 10px;
        margin-top: 10px;
        border: 2px solid #51e3d4;
    }
    .user-info {
        overflow: hidden;
        padding: 30px;
        margin-top: 30px;
        align-items: center;
        display: flex;
    }
    .user-info .card-title {
        font-size: 24px;
    }
    .d-flex justify-content-between {
        background-color: #cccccc;
        border-radius: 4px;
        overflow: hidden;
        color: white;
        padding: 10px;
        border: 1px solid black;
    }
    .flex-fill {
        font-size: 18px;
    }

    /*selectButton css*/
    .selectButtonAbsoluteSize {
        width: 100%;
		height: 6vh;
    }

    .selectButton {
        display: flex;
        margin: 0 auto;
		float: right;
		gap: 7px;
    }

    .tourList {
        display: flex;
        border-bottom: 1px solid black;
        height: 300px;
        padding-top: 20px;
        padding-bottom: 20px;
    }

    /*tourListL : sm-4로 크기 할당*/

    .db-pic {
        position: relative;
        width: 100%;
        height: 100%;
        margin: auto;
        left: 0;
    }
    .tourListR {
        margin: auto;
        padding-left: 20px;
        font-size: 20px;
    }

	.myPageTourFav{
		border: none;
		background-color: transparent;
		width: 80px;
		height: 80px;
		font-size: 50px;
	}
	.myPageTourFav:hover {
		background-color: lightgray;
	}

    #row3 {
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
</style>

<!-- Page header with logo and tagline-->
<div class="g" id="blog-title-photo">
	<h1 class="fw-bolder">Welcome My Page!</h1>
</div>

<div class="container">
	<!-- Side widgets-->
	<div class="row2">
		<!-- Search widget-->
		<div class="card mb-4">
			<div class="card-header">내정보</div>
			<div class="card-body">
				<c:if test="${sessionScope.role=='bit' }">
					<img src="${stpath}/${photo}" class="main-profile-img img-fluid mb-3">
				</c:if>
				<c:if test="${sessionScope.role!='bit' }">
					<img src="${photo}" class="main-profile-img img-fluid mb-3">
				</c:if>
				<div class="user-info d-flex justify-content-between">
					<h5 class="card-title">이름 : ${name}</h5>
					<h5 class="card-title">이메일 : ${user_id}</h5>
					<h5 class="card-title">게시글 : ${userPost.size()}개</h5>
				</div>
			</div>
		</div>
		<!-- Categories widget-->
		<div class="card mb-4">
			<div class="card-header">플래너</div>
			<div class="card-body">
				<div class="d-flex justify-content-between">
					<div class="flex-fill">
						<p class="mb-0">서울 여행 플래너</p>
					</div>
					<div>
						<p class="mb-0">3/4</p>
					</div>
				</div>
				<div class="d-flex justify-content-between">
					<div class="flex-fill">
						<p class="mb-0">대구 여행 플래너</p>
					</div>
					<div>
						<p class="mb-0">2/4</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%-- 환용 수정 --%>
<div class="container">
    <div class="selectButtonAbsoluteSize">
        <div class="selectButton">
            <button type="button" class="btn-btn-primary1" id="showMyBlog" onclick="myPageLoad(1)">내 블로그</button>
            <button type="button" class="btn-btn-primary1" id="showFavoritesBlog" onclick="myPageLoad(2)">블로그 즐겨찾기</button>
            <button type="button" class="btn-btn-primary1" id="showFavoritesTour" onclick="myPageLoad(3)">투어 즐겨찾기</button>
        </div>
    </div>
    <c:set var="stpath" value="https://kr.object.ncloudstorage.com/hyunsung-bucket/blog_photo"/>
    <div id="row1" class="row">
        <c:forEach var="post" items="${userPost}">
            <div class="col-lg-4 mb-4">
                <div class="card">
                    <a href="#!"><img class="card-img-top" src="${stpath}/${post.photo}" alt="게시글 이미지" onerror="this.src='../images/p1.jpg'"/></a>
                    <div class="card-body">
                        <div class="small text-muted"><fmt:formatDate value="${post.board_writeday}" pattern="yyyy년 MM월 dd일"/></div>
                        <h2 class="card-title">${post.board_title}</h2>
                        <div class="bottom-box">
                            <a class="btn-btn-primary" onclick="location.href='/board/detail?board_num=${post.board_num}&currentPage=${currentPage}'">더보기 →</a>
                            <div class="images-heart">
                                <img src="../images/hjhj.png" alt="" class="profile-img2">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>

    <div id="row2" class="row" style="display: none;">
    </div>

    <div id="row3" class="card mb-4" style="display: none;">
        <div class="card-header">투어 즐겨찾기</div>
        <div id="tourFavorites" class="card-body"></div>
    </div>
</div>

<script src="/js/user/myPage.js"></script>