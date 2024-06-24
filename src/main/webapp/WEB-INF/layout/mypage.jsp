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
            height: 350px;
            border: none;
            background-image: url('/images/e4.jpg'); /* 배경 이미지 URL */
            background-size: cover; /* 이미지 크기를 컨테이너에 맞게 조정 */
            background-position: center; /* 이미지를 중앙에 위치 */
            background-repeat: no-repeat; /* 이미지 반복 금지 */
            margin-bottom: 20px;
        }

        .text-center my-5 {
            width: auto;
            height: auto;
        }
        .fw-bolder {
            color: white;
            font-size: 80px;
            font-family: "Neuton", serif;
        }

        .card-img-top {
            object-fit: cover;
            height: 300px;
        }

        .row {
            display: flex;
            flex-wrap: wrap; /* 요소들이 줄 바꿈되도록 설정 */
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
            width: 130px; /* 이미지 크기 조정 */
            height: 130px;
            border-radius: 50%; /* 동그라미 모양으로 만들기 */
            object-fit: cover; /* 이미지 비율 유지 */
            float: left; /* 왼쪽으로 정렬 */
            margin-right: 10px; /* 오른쪽 여백 추가 */
            margin-top: 10px;
        }

        .user-info {
            overflow: hidden; /* 텍스트가 넘치지 않도록 처리 */
            padding: 30px; /* 내부 여백 추가 */
            margin-top: 30px; /* 위쪽 마진 추가 */
            align-items: center; /* 수직 가운데 정렬 */
            display: flex;
        }

        .user-info .card-title {
            font-size: 24px; /* 이름의 글자 크기 설정 */
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






    </style>
</head>
<body>


<!-- Page header with logo and tagline-->
<header class="g" id="blog-title-photo">
    <div class="container">
        <div class="text-center my-5">
            <h1 class="fw-bolder">Welcome My Page!</h1>
        </div>
    </div>
</header>


<div class="container">
    <!-- Side widgets-->
    <div class="row2">
        <!-- Search widget-->
        <div class="card mb-4">
            <div class="card-header">내정보</div>
            <div class="card-body">
                <img src="../images/p1.jpg" class="main-profile-img img-fluid mb-3" alt="사용자 사진">
                <div class="user-info d-flex justify-content-between">
                    <h5 class="card-title">이름 : 황재웅</h5>
                    <h5 class="card-title">나이 : 27</h5>
                    <h5 class="card-title">성별 : 남</h5>
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


<div class="container">
    <div class="row">
        <div class="col-lg-4 mb-4">
            <div class="card">
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
        </div>

        <div class="col-lg-4 mb-4">
            <div class="card">
                <a href="#!"><img class="card-img-top" src="/images/ff4.jpg"/></a>
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
        </div>

        <div class="col-lg-4 mb-4">
            <div class="card">
                <a href="#!"><img class="card-img-top" src="/images/ff5.jpg"/></a>
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
        </div>

        <div class="col-lg-4 mb-4">
            <div class="card">
                <a href="#!"><img class="card-img-top" src="/images/ff2.jpg"/></a>
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
        </div>

        <div class="col-lg-4 mb-4">
            <div class="card">
                <a href="#!"><img class="card-img-top" src="/images/ff3.jpg"/></a>
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
        </div>


    </div>
</div>

