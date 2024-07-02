<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/board/boardList.css">
<style>
    .profile-img2 {
        width: 30px; /* 프로필 사진의 너비 */
        height: 30px; /* 프로필 사진의 높이 */
        object-fit: cover; /* 이미지가 너무 클 경우 잘라내기 설정 */

    }
        .images-heart {
            display: flex; /* Flexbox 사용 */
            align-items: center; /* 세로 중앙 정렬 */
        }

    /* 북마크 */
    .images-bookmark {
        font-size: 32px;
        margin-right: 7px;
        object-fit: cover;
    }
    .starr {
        width: 33px;
        height: 33px;

        object-fit: cover;
        margin-top: -8px;
    }
</style>
<script>
    let bookmarkedBoardIds = [];
    window.onload = function() {
        if(${sessionScope.loginok != null}) {
            getBookmarkData();
        }
    }
    function getBookmarkData() {
        $.get("/bit/blog/bookmark", function(data) {
            bookmarkedBoardIds = Object.values(data);
            console.log(bookmarkedBoardIds);
            updateBookmarkIcons(); // 북마크 아이콘 상태 업데이트
        }, "json");
    }


</script>
<c:set var="stpath" value="https://kr.object.ncloudstorage.com/hyunsung-bucket/blog_photo"/>
<div class="container">
    <div class="row">
        <!-- Blog entries-->
        <div class="col-lg-8">
            <h2 class="fw-bolder">검색 결과</h2>
            <div class="row">
                <c:if test="${empty boardList}">
                    <h3>검색 결과 없지롱</h3>
                </c:if>
                <c:forEach var="dto" items="${boardList}">
                    <div class="col-lg-6">
                        <div class="card mb-4" style="width: 400px;">

                            <c:if test="${dto.photo!='no' and dto.photo!=null}">
                                <a onclick="location.href='/board/detail?board_num=${dto.board_num}&currentPage=${currentPage}'"><img class="card-img-top" src="${stpath}/${dto.photo}" onerror="this.src='/images/e3.jpg'" ></a>
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
                                        <div class="images-bookmark" data-board-num="${dto.board_num}"></div>
                                        <img src="../images/hjhj.png" alt="" class="profile-img2">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<script>
    function updateBookmarkIcons() {
        document.querySelectorAll('.images-bookmark').forEach(element => {
            const board_num = element.dataset.boardNum;
            if (bookmarkedBoardIds.includes(parseInt(board_num))) {
                element.innerHTML = '<img src="/images/starr.png" class="starr" onclick="delmark(' + board_num + ')"/>';
            } else {
                element.innerHTML = '<i class="bi bi-star" style="color: #fce61b;" onclick="toggleBookmark(' + board_num + ')"></i>';
            }
        });
    }

    function toggleBookmark(board_num) {
        if (!board_num) {
            alert("유효하지 않은 board_num 값입니다.");
            return;
        }
        fetch(`/bit/bookmark?board_num=\${board_num}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                console.log("Response status:", response.status);
                if (response.ok) {
                    getBookmarkData(); // 아이콘 상태를 갱신
                } else {
                    alert("오류가 발생했습니다. 다시 시도해 주세요.");
                }
            })
            .catch(error => {
                console.error("Error:", error);
            });
    }

    function delmark(board_num) {
        if (!board_num) {
            alert("유효하지 않은 board_num 값입니다.");
            return;
        }
        fetch(`/bit/delmark?board_num=\${board_num}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            credentials: 'same-origin'
        })
            .then(response => {
                console.log("응답 상태:", response.status);
                if (response.ok) {
                    getBookmarkData(); // 아이콘 상태를 갱신
                } else {
                    alert("오류가 발생했습니다. 다시 시도해 주세요.");
                }
            })
            .catch(error => {
                console.error("에러:", error);
                alert("오류가 발생했습니다. 다시 시도해 주세요.");
            });
    }
</script>
