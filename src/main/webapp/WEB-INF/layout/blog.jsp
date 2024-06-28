<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
        body * {
            font-family: "IBM Plex Sans KR", sans-serif;
        }

        #blog-title-photo {
            width: 100%;
            height: 400px;
            border: none;
            /*background-image: url('/images/e3.jpg'); !* 배경 이미지 URL *!*/
            /*background-size: cover; !* 이미지 크기를 컨테이너에 맞게 조정 *!*/
            /*background-position: center; !* 이미지를 중앙에 위치 *!*/
            /*background-repeat: no-repeat; !* 이미지 반복 금지 *!*/
            background: linear-gradient(to right, #19B3FF,#51e3d4);
            margin-bottom: 20px;
            display: flex;
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 */
        }



        #blog-title-photo h1 {
            color: rgba(255, 255, 255, 0.9); /* 흰색을 50% 불투명도로 설정 */
            font-size: 100px;
            font-family: "Neuton", serif;
            text-align: center; /* 텍스트를 중앙으로 정렬 */
        }

        .card-img-top {
            object-fit: cover;
            height: 300px;
        }

        .row {
            display: flex;
            flex-wrap: wrap; /* 요소들이 줄 바꿈되도록 설정 */
            justify-content: flex-start; /* 요소들이 왼쪽 정렬되도록 설정 */
        }



        .col-lg-6 {
            width: 400px;
            display: flex;
            flex-direction: column;
            align-items: center; /* 요소들을 수평 중앙 정렬 */
            justify-content: center; /* 요소들을 수직 중앙 정렬 */
            padding: 10px; /* 내부 여백 */
            box-sizing: border-box; /* 패딩과 보더를 포함한 박스 크기 계산 */
            flex: 0 0 calc(50% - 20px); /* 각 요소가 너비의 50%를 차지하고 간격을 포함하여 계산 */
            margin: 10px; /* 각 요소 사이에 10px 간격을 추가 */


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




        .c-box li {
            list-style: none;
        }
        .c-box a{
            color: #51e3d4;
            text-decoration: none;
            font-size: 20px;
            font-weight: bold;
        }

        .card-blog {
            background: linear-gradient(to right, #19B3FF,#51e3d4);
            border-radius: 4px;
            height: 400px;
        }

        .card-body1 {
            font-size: 40px;
            color: white;
            height: auto;
            padding: 40px;
        }

        .small-text-muted {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
        .card-body1-btn {
            margin-top: 10px;
            border-radius: 4px;
            background-color: white;
            border: none;
            color: #51e3d4;
            font-size: 27px;
            padding: 5px 15px;
            font-weight: bold;
        }

        .bottom-box {
            display: flex;
            justify-content: space-between; /* 아이콘과 링크를 양쪽 끝에 배치 */
            align-items: center; /* 수직 중앙 정렬 */

        }

        .profile-img {
            width: 30px; /* 프로필 사진의 너비 */
            height: 30px; /* 프로필 사진의 높이 */
            border-radius: 50%; /* 동그라미 모양으로 만드는 속성 */
            object-fit: cover; /* 이미지가 너무 클 경우 잘라내기 설정 */
            margin-right: 10px; /* 프로필 사진과 버튼 사이의 간격 */
        }

        .images-heart {
            display: flex; /* Flexbox 사용 */
            align-items: center; /* 세로 중앙 정렬 */
        }

        .bottom-box i{
            font-size: 30px;
        }

        .loading-indicator {
            text-align: center;
            margin: 20px 0;
            display: none; /* 초기에는 숨김 */
        }
        .text-shadow{
            text-shadow: 0 0 20px #fefcc9, 10px -10px 30px #feec85, -20px -20px 40px #ffae34, 20px -40px 50px #ec760c, -20px -60px 60px #cd4606, 0 -80px 70px #973716, 10px -90px 80px #451b0e;
        }
</style>
<!-- Page header with logo and tagline-->
<div class="g" id="blog-title-photo">
            <h1 class="fw-bolder">Welcome to Blog Home!</h1>
</div>
<!-- Page content-->
<div class="container">
    <div class="row">
        <!-- Blog entries-->
        <div class="col-lg-8">
            <!-- Featured blog post-->
            <div class="card mb4">
                <p class="text-shadow">불탄다 불타</p>
                <c:if test="${not empty topViewedBoard}">
                    <a href="#!"><img class="card-img-top" src="${topViewedBoard.photo}"  onerror="this.src='/images/e3.jpg'"/></a>
                    <div class="card-body">
                        <div class="small text-muted">
                            <fmt:formatDate value="${topViewedBoard.board_writeday}" pattern="yyyy.MM.dd" />
                        </div>
                        <h2 class="card-title">${topViewedBoard.board_title}</h2>
                        <div class="bottom-box">
                            <a class="btn-btn-primary" onclick="location.href='/board/detail?board_num=${dto.board_num}&currentPage=${currentPage}'">더보기 →</a>
                            <div class="images-heart">
                                <img src="../images/e2.jpg" alt="" class="profile-img">
                                <i class="bi bi-suit-heart-fill" style="color: #FF9EAA;"></i>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
            <c:set var="stpath" value="https://kr.object.ncloudstorage.com/hyunsung-bucket/blog_photo"/>

            <!-- Nested row for non-featured blog posts-->
            <div class="row">

                <c:forEach var="dto" items="${boardList}">
                <div class="col-lg-6">
                    <div class="card mb-4" style="width: 400px;">
                        <c:if test="${dto.photo!='no' and dto.photo!=null}">
                            <img class="card-img-top" src="${stpath}/${dto.photo}" onerror="this.src='/images/e3.jpg'" onclick="location.href='/board/detail?board_num=${dto.board_num}&currentPage=${currentPage}'">
                        </c:if>
                        <c:if test="${dto.photo==null}">
                            <img class="card-img-top" src="/images/ff.jpg">
                        </c:if>
                        <div class="card-body">

                            <div class="small-text-muted">
                                <span>${dto.user_id}</span>
                                <span style="color: #8a8a8a"><fmt:formatDate value="${dto.board_writeday}" pattern="yyyy.MM.dd"/></span>
                            </div>
                            <h2 class="card-title h4">${dto.board_title}</h2>

                            <div class="bottom-box">

                                <a class="btn-btn-primary" onclick="location.href='/board/detail?board_num=${dto.board_num}&currentPage=${currentPage}'">더보기 →</a>

                                <div class="images-heart">
                                    <img src="../images/e2.jpg" alt="" class="profile-img">
                                    <i class="bi bi-suit-heart-fill" style="color: #FF9EAA;"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>



            <!-- Pagination-->
            <nav aria-label="Pagination">
                <hr class="my-0" />
            </nav>
        </div>
        <!-- Side widgets-->
        <div class="col-lg-4">
            <!-- Search widget-->
            <div class="card mb-4">
                <div class="card-header">검색</div>
                <div class="card-body">
                    <form action="./search" method="get">
                        <div class="input-group">
                            <select class="form-select" name="category" aria-label="Search category">
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                                <option value="author">작성자</option>
                            </select>
                            <input class="form-control" type="text" name="query" placeholder="검색어를 입력하세요..." aria-label="Enter search term..." aria-describedby="button-search" />
                            <button class="btn-btn-primary" id="button-search" type="submit">검색</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Categories widget-->
            <div class="card mb-4">
                <div class="card-header">카테고리</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <ul class="c-box">
                                <li><a href="#!">#추천 여행지</a></li>
                                <li><a href="#!">#데이트</a></li>
                                <li><a href="#!">#멋진</a></li>
                                <li><a href="#!">#특별한</a></li>
                                <li><a href="#!">#휴가</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <ul class="c-box">
                                <li><a href="#!">#가족과</a></li>
                                <li><a href="#!">#분위기 좋은</a></li>
                                <li><a href="#!">#친구와</a></li>
                                <li><a href="#!">#아름다운</a></li>
                                <li><a href="#!">#재밌는</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
            <!-- Side widget-->
            <div class="card-blog">
                <div class="card-body1">나만의 여행플래너를 계획하고 블로그를 작성해보자!
                <br><button class="card-body1-btn" onclick="location.href='/board/form'">작성하기</button>
                </div>

            </div>
        </div>
    </div>
</div>


