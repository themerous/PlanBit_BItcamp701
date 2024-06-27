<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/board/boardDetail.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Averia+Serif+Libre:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Bebas+Neue&family=Bree+Serif&family=Hind+Vadodara:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<%--카카오 맵 api 항상 처음에 실행되어야함--%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f6609502fa3f00b4b14ebbdcdf59da6"></script>

<%--detail.jsp 댓글, 좋아요 기능 포함--%>
<script>
    let boardNum = ${dto.board_num};
    let sessionLoginId = '${sessionScope.loginid}';
    let sessionLoginOk = '${sessionScope.loginok}';
    let user_id = '${dto.user_id}';
</script>
<script src="/js/board/detail.js"></script>


<header><a>BIT TRIP</a></header>
<main>
    <div class="blog-post">
        <div class="post-image">
            <img src="/images/e3.jpg" alt="이미지 설명">
        </div>
        <div class="post-title">
            <h2>${dto.board_title}</h2>
        </div>
        <div class="post-info">
            <i class="bi bi-calendar-check"></i><p><fmt:formatDate value="${dto.board_writeday}" pattern="yyyy.MM.dd HH:mm"/></p>
            <i class="bi bi-person-circle"></i><p>${dto.user_id}</p>
            <i class="bi bi-suit-heart-fill" style="color: #FF9EAA;"></i><p id="likeCount">${like}</p> <p>조회수:&nbsp; ${dto.board_views}</p>
            <div class="post-info-btn">
                <c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.user_id}">
                    <button type="button" class="post-info-up"
                            onclick="location.href='./updateform?board_num=${dto.board_num}&currentPage=${currentPage}'">수정
                    </button>
                    <button type="button" class="post-info-del" onclick="del()">삭제</button>
                </c:if>
                <button type="button" class="post-info-list"
                        onclick="location.href='/bit/blog'">목록
                </button>
            </div>
        </div>
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
        </div>
        <div class="post-content">
            <pre>${dto.board_content}</pre>
        </div>


        <%--        카카오 맵 api detailmap.js 지도를 불러오고 게시글 작성할때 넣었던 좌표값 불러옴--%>
        <%--        c:if 문을 사용하여 게시글 작성했을때 지도를 포함시키지않았다면 지도 표시 x--%>
        <c:if test="${not empty placeNames and not empty placeLatitudes and not empty placeLongitudes}">
            <div id="map" style="width:100%;height:350px;"></div>
            <script>
                var placeNames = '${placeNames}';
                var placeAddresses = '${placeAddresses}';
                var placeLatitudes = '${placeLatitudes}';
                var placeLongitudes = '${placeLongitudes}';
            </script>
            <script src="${pageContext.request.contextPath}/js/board/detailmap.js"></script>
        </c:if>


        <div class="post-reply-box">
            <%--            <div class="post-reply">--%>
            <%--                <h5>황재웅</h5>--%>
            <%--                <p>안녕하세요 재밌는 글을 써줘서 감사</p>--%>
            <%--                <button type="button" class="post-reply-button">답글</button>--%>
            <%--                <div class="post-reply-reply">--%>
            <%--                    <h5><i class="bi bi-caret-right-fill"></i> 이현성</h5>--%>
            <%--                    <p>감사합니다</p>--%>
            <%--                </div>--%>
            <%--            </div>--%>

            <%--            댓글 기능 6/25 기능 구현 완료(css 디자인 미완)--%>
            <div class="post-reply">
                <div class="answerlist" ></div>
                <c:if test="${sessionScope.loginok!=null}">
                    <div class="comment-form">
                        <textarea id="acontent" class="form-control" placeholder="댓글을 입력하세요..."></textarea>
                        <button type="button" class="" id="btnansweradd">등록</button>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="post-next-blog-title"><h2>다른 게시물</h2></div>
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

<button class="right-btn1"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin=
                                        "round" class="feather feather-arrow-up"><line x1="12" y1="19" x2="12" y2=
        "5"></line><polyline points="5 12 12 5 19 12"></polyline></svg>
    <line x1="12" y1="19" x2="12" y2="5"></line>
    <polyline points="5 12 12 5 19 12"></polyline>
</button>
<button class="right-btn2" id="likeBtn" type="button"><i class="bi bi-suit-heart-fill"></i></button>