<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/board/boardDetail.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Averia+Serif+Libre:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Bebas+Neue&family=Bree+Serif&family=Hind+Vadodara:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<header><a>BIT TRIP</a></header>
<main>
    <div class="blog-post">
        <div class="post-image">
            <img src="/images/e3.jpg" alt="이미지 설명">
        </div>
        <div class="post-title">
            <h2>블로그 제목</h2>
        </div>
        <div class="post-info">
            <i class="bi bi-calendar-check"></i><p>2024.01.17</p>
            <i class="bi bi-person-circle"></i><p>황재웅</p>
            <i class="bi bi-suit-heart-fill" style="color: #FF9EAA;"></i><p>0</p>
        </div>
        <div class="post-content">
            <h2>블로그 제목</h2>
            <p>블로그 내용의 요약본을 여기에 적습니다. 이 요약본은 독자에게 글의 내용을 간략히 소개합니다.</p>
        </div>
        <div class="reply-num">
            <h2>1개의 리뷰</h2>
        </div>
        <div class="post-reply-box">
            <div class="post-reply">
                <h5>황재웅</h5>
                <p>안녕하세요 재밌는 글을 써줘서 감사</p>
                <button type="button" class="post-reply-button">답글</button>
                <div class="post-reply-reply">
                    <h5><i class="bi bi-caret-right-fill"></i> 이현성</h5>
                    <p>감사합니다</p>
                </div>
                <div class="post-reply-reply">
                    <h5><i class="bi bi-caret-right-fill"></i> 손흥민</h5>
                    <p>화이팅</p>
                </div>
            </div>

            <div class="comment-form">
                <textarea rows="4" placeholder="댓글 작성"></textarea>
                <button type="button">등록</button>
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
    <polyline points="5 12 12 5 19 12"></polyline></button>
<button class="right-btn2"><i class="bi bi-suit-heart-fill"></i></button>

