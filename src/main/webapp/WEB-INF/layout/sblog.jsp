<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/board/boardList.css">
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
                        <div class="card mb-4">
                            <a href="#!"><img class="card-img-top" src="/images/gg3.jpg"/></a>
                            <div class="card-body">
                                <div class="small text-muted"><fmt:formatDate value="${dto.board_writeday}" pattern="yyyy.MM.dd"/></div>
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
        </div>
    </div>
</div>
