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
            background-image: url('/images/e3.jpg'); /* 배경 이미지 URL */
            background-size: cover; /* 이미지 크기를 컨테이너에 맞게 조정 */
            background-position: center; /* 이미지를 중앙에 위치 */
            background-repeat: no-repeat; /* 이미지 반복 금지 */
            margin-bottom: 20px;
            display: flex;
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 */
        }



        #blog-title-photo h1 {
            color: white;
            font-size: 90px;
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
                <a href="#!"><img class="card-img-top" src="/images/ff6.jpg"/></a>
                <div class="card-body">
                    <div class="small text-muted">2024년 6월 22일</div>
                    <h2 class="card-title">가을에 가장 여행하기 좋은 장소!</h2>
                    <p class="card-text">오늘은 가을에 가장 여행하기 좋은 장소 7곳을 소개해보려고 한다.</p>
                    <div class="bottom-box">
                        <a class="btn-btn-primary" href="">더보기 →</a>
                        <div class="images-heart">
                            <img src="../images/e2.jpg" alt="" class="profile-img">
                            <i class="bi bi-suit-heart-fill" style="color: #FF9EAA;"></i>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Nested row for non-featured blog posts-->
            <div class="row">

                <c:forEach var="dto" items="${boardList}">
                <div class="col-lg-6">
                    <div class="card mb-4">
                        <a href="#!"><img class="card-img-top" src="/images/gg3.jpg"/></a>
                        <div class="card-body">

                            <div class="small text-muted"><fmt:formatDate value="${dto.board_writeday}" pattern="yyyy.MM.dd"/>
                            </div>
                            <h2 class="card-title h4">${dto.board_title}</h2>

                            <div class="bottom-box">

                                <div class="images-heart">

                                    <a href="#!"><img src="../images/e2.jpg" alt="" class="profile-img">
                                            ${dto.user_id}
                                    </a>
                                    <i class="bi bi-suit-heart-fill" style="color: #FF9EAA;"></i>
                                </div>
                                <a class="btn-btn-primary" onclick="location.href='/board/detail?board_num=${dto.board_num}&currentPage=${currentPage}'">더보기 →</a>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>

            <!-- 무한로딩 창-->
            <div id="loading-indicator">
                <img src="loading.gif" alt="로딩 중...">
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
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <ul class="c-box">
                                <li><a href="#!">#특별한</a></li>
                                <li><a href="#!">#가족과</a></li>
                                <li><a href="#!">#휴가</a></li>
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
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var page = 1; // 초기 페이지 번호
    var isLoading = false; // 추가 데이터 로딩 중 여부

    $(document).ready(function() {
        // 초기 데이터 로드
        loadMoreData(page);

        // 스크롤 이벤트를 감지하여 추가 데이터 로드
        $(window).scroll(function() {
            // 스크롤바가 페이지 하단에 도달했을 때 추가 데이터 로드
            if ($(window).scrollTop() + $(window).height() >= $(document).height() && !isLoading) {
                isLoading = true; // 로딩 중 상태로 변경
                page++; // 페이지 번호 증가
                loadMoreData(page); // 추가 데이터 로딩 함수 호출
            }
        });
    });

    function loadMoreData(page) {
        // Ajax를 통해 데이터 로드
        $.ajax({
            url: 'loadMoreData.jsp', // 실제 데이터를 가져오는 URL 설정
            type: 'GET',
            data: { page: page }, // 페이지 번호 전달
            dataType: 'html', // 받을 데이터 타입 설정
            success: function(html) {
                $('#blog-posts').append(html); // 데이터를 추가하여 페이지에 렌더링
                isLoading = false; // 로딩 완료 상태로 변경
            },
            error: function(xhr, status, error) {
                console.error('Error loading data:', error);
                isLoading = false; // 로딩 완료 상태로 변경
            }
        });
    }
</script>


