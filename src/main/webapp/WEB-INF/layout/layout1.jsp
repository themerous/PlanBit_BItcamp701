<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Averia+Serif+Libre:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Bebas+Neue&family=Bree+Serif&family=Hind+Vadodara:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Concert+One&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cardo:ital,wght@0,400;0,700;1,400&family=Neuton:ital,wght@0,200;0,300;0,400;0,700;0,800;1,400&family=Playfair+Display+SC:ital,wght@0,400;0,700;0,900;1,400;1,700;1,900&display=swap" rel="stylesheet">
   <style>

        body *{
            font-family: "Bree Serif", serif;

        }
        header {
            display: flex;
            width: 100%;
            justify-content: space-between;
            align-items: center;
            color: black;
            height: 10%;
            padding: 10px;
            position: sticky;
            top: 0; /* 도달했을때 고정시킬 위치 */
            z-index: 10;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* 그림자 추가 */
        }


        /*헤더 왼쪽 박스 */

        .title-left {
            font-size: 35px;
            font-family: "Alfa Slab One", serif;
            color: #51e3d4;
        }


        /*헤더 중간 박스 */

        .title-center {
            color: #51e3d4;
        }

        .title-menu ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
            gap: 150px;

        }

        .title-center ul li a {
            color: black;
            text-decoration: none;
            padding: 10px;
            transition: background-color 0.3s;
            font-size: 20px;
            font-family: "Neuton", serif;
            border-radius: 4px;

        }

        .title-center ul li a:hover {
            color: white;
            border-radius: 4px;
            background-color: #51e3d4;
        }


        /*헤더 오른쪽 박스 */

        .title-right {
            display: flex;
            height: 100%; /* 부모 요소의 전체 높이 */
            padding: 10px 0; /* 상하 여백 */
            align-items: center; /* 세로 방향으로 중앙 정렬 */
            gap: 10px;


        }

        .gaip-button {
            display: inline-flex; /* Flexbox 사용 */
            align-items: center; /* 세로 방향으로 중앙 정렬 */
            justify-content: center; /* 가로 방향으로 중앙 정렬 */
            padding: 10px 20px;
            color: black;
            text-decoration: none;
            cursor: pointer;
            width: 120px;
            height: 45px;
            text-align: center;
            font-size: 20px;
            font-family: 'Jua';
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 4px;
        }

        .gaip-button:hover {
            transform: scale(0.9, 0.9);
        }


        .login-button {
            display: inline-flex; /* Flexbox 사용 */
            align-items: center; /* 세로 방향으로 중앙 정렬 */
            justify-content: center; /* 가로 방향으로 중앙 정렬 */
            padding: 10px 20px;
            background-color: #51e3d4;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100px;
            height: 50px;
            text-align: center;
            font-size: 20px;
            font-family: 'Jua';
        }

        .login-button:hover {
            transform: scale(0.9, 0.9);
        }





        /*메인 구역 */

        main {
            width: 100%;
            height: auto;
            margin: 0 auto;

        }

        .main-home1 {
            width: 100%;
            height: auto;
            margin: 0 auto;
        }



        .main-photo-box {

            width: 100%; /* 부모 요소 너비에 맞춤 */
            height: 650px; /* 고정 높이 설정 */
            position: relative;
            background: linear-gradient(to right, #19B3FF,#51e3d4);

        }



        .main-title {
            position: absolute;
            font-family: "Alfa Slab One", serif;
            font-size: 75px;
            margin-top: 170px;
            margin-left: 160px;
            color: white;
        }

        .main-mini-title {
            position: absolute;
            width: 600px;
            font-size: 23px;
            color: white;
            margin-top: 280px;
            margin-left: 160px;

        }

        .main-photo1 {
            background-image: url("/images/p1.jpg");
            background-size: cover;
            margin-top: 120px;
            margin-right: 200px;
            width: 660px;
            height: 400px;
            position: absolute;
            right: 0;
        }

        .main-button {
            width: 200px;
            height: 60px;
            text-align: center;
            font-size: 27px;
            position: absolute;
            margin-top: 410px;
            margin-left: 160px;
            border-radius: 4px;
            align-items: center;
            background-color: rgba(255, 255, 255, 0.5); /* 흰색의 50% 투명도 */
            font-family: "Alfa Slab One", serif;
            line-height: 60px; /* 버튼 높이와 동일한 line-height 설정 */
            color: white;
        }





        /* 사이드 버튼 */

        aside {
            width: auto;
            height: auto;
            position: fixed;
            right: 0;
            bottom: 0;
            z-index: 4;
        }

        .side-btn-box {
            display: flex;           /* Flexbox 사용 */
            flex-direction: column;  /* 세로 정렬 */
            align-items: center;     /* 가로 중앙 정렬 */
            gap: 15px;               /* 버튼 사이 간격 추가 */
        }

        .side-btn-box button{
            border-radius: 4px;
            background-color: white;
            padding: 8px;
            color: #51e3d4;
            filter: drop-shadow(0px 4px 4px #d2dae5);
            width: 70px;
            height: 70px;
            border: none;

        }

        .side-btn-box button i {
            font-size: 30px;

        }

        .side-btn-box button:hover {
            transform: scale(0.9, 0.9);
        }






        .main-home2 {
            width: 100%;
            height: 800px;
            background-image: url("/images/tri3.png");
            background-size: cover;
        }












        .main-home3 {
            width: 100%;
            height: 1000px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px; /* 원하는 간격을 설정할 수 있습니다 */
            padding: 10px; /* 원하는 패딩을 설정할 수 있습니다 */
            position: relative; /* 버튼의 위치를 이 컨테이너를 기준으로 조정 */
        }

        .main-blog {
            text-align: center; /* 텍스트 정렬을 가운데로 설정 */
            height: auto;
        }

        .main-blog-title {
            color: white;
            width: 100%;
            height: 20%;
            background-image: url("/images/e4.jpg");
            background-size: cover;
            text-align: center;
            display: flex;
            align-items: center; /* 텍스트를 수직 가운데로 정렬 */
            justify-content: center; /* 텍스트를 수평 가운데로 정렬 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);

        }

        .main-blog-title p {
            font-size: 50px;
        }

        .main-blog-content {
            width: 100%;
            height: auto;
            margin-top: 10px;
        }

        .blog-item2 {
            position: relative;
            width: 100%; /* 이미지 컨테이너의 너비 */
            height: 250px; /* 이미지 컨테이너의 높이 */
            overflow: hidden; /* 넘치는 이미지를 숨김 */
            margin-bottom: 10px; /* 이미지 사이의 위아래 간격 설정 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .blog-item2 img {
            width: 100%;
            object-fit: cover; /* 이미지 비율 유지 */
            transition: transform 0.2s ease;
            height: 100%;
        }

        .blog-item-hover {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.3); /* 배경 색상과 투명도 */
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0; /* 기본적으로 숨김 */
            transition: opacity 0.3s ease;
        }

        .blog-item-hover p {
            text-align: center;
            font-size: 30px;
        }

        .blog-item2:hover .blog-item-hover {
            opacity: 1; /* 호버 시 나타나도록 함 */
        }








        .main-blog2 {

            height: auto;
            display: flex;
            padding: 10px;
            flex-direction: column; /* 아이템의 요소들을 위아래로 정렬 */
            margin-top: 170px;
            cursor: pointer;
            align-items: center;


        }

        .blog-item {
            display: flex;
            margin-bottom: 30px; /* 각 블로그 아이템 사이의 간격 */
            border: 1px solid #d2dae5;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* 그림자 효과 추가 */
            width: 80%;

        }

        .blog-item:hover {
            transform: scale(0.9, 0.9);
        }

        .blog-item img {
            width: 170px;
            height: 200px;
            margin-right: 20px; /* 이미지와 텍스트 사이의 간격 */
            object-fit: cover; /* 이미지 비율 유지 */
        }


        .blog-item-content {
            flex: 1; /* 텍스트 컨텐츠가 남은 공간을 차지하도록 설정 */

        }
        .blog-item-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: left;
            width: 170px;
            font-family: "IBM Plex Sans KR", sans-serif;
        }
        .blog-item-text {
            font-size: 16px;
            text-align: left;
            width: 170px;
            border-bottom: 1px solid #ccc ;
            font-family: "IBM Plex Sans KR", sans-serif;
        }

        .blog-item-icon {
            display: flex;
            margin-right: 20px;
            justify-content: flex-end; /* 아이콘을 오른쪽 끝으로 정렬 */
            margin-top: 5px; /* 아이콘 위 여백 설정 */
            gap: 5px;
        }

        .blog-item-icon i {
            font-size: 17px;
        }

        .plus {
            align-items: center; /* 세로 방향으로 중앙 정렬 */
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            background-color: #51e3d4;
            cursor: pointer;
            width: 150px;
            height: 55px;
            text-align: center;
            font-size: 21px;
            font-family: 'Jua';
            position: absolute;
            bottom: 50px; /* 부모 컨테이너 하단에서 20px 떨어진 위치 */
            right: 75px; /* 부모 컨테이너 오른쪽에서 20px 떨어진 위치 */
        }

        .plus:hover {
            transform: scale(0.9, 0.9);
        }

        .chu-blog {
            position: absolute;
            right: 660px;
            top: 30px;
            font-size: 33px;
            border-left: 6px solid #51e3d4;
            align-items: center; /* 수직 중앙 정렬 */
            justify-content: center; /* 수평 중앙 정렬 */
            font-family: "IBM Plex Sans KR", sans-serif;
            padding-top: 6px; /* 글씨를 아래로 이동 */
        }

        .category {
            position: absolute;
            top: 120px;
            width: auto;
            right: 350px;

        }

        .category-btn {
            align-items: center; /* 세로 방향으로 중앙 정렬 */
            color: #51e3d4;
            text-decoration: none;
            border: none;
            background-color: white;
            cursor: pointer;
            width: 100px;
            height: 35px;
            font-size: 22px;
            font-family: 'Jua';


        }















        .main-home4 {
            width: 100%;
            height: 800px;
            background-color: #eeeeee;
        }








        .main-home5 {
            display: grid; /* 내부 div를 가로로 배치 */
            width: 100%;
            height: auto;

        }

        .photo-card {
            grid-template-columns: repeat(4, 1fr);
            display: grid;
            height: auto;
            width: 100%;
            gap: 20px;
            padding: 15px;
            margin-top: 20px;
        }

        #photo-up {
            display: flex;
        }

        #photo-down {
            display: flex;
            flex-direction: row-reverse;
        }

        .photo-div {
            display: flex;
            background-color: white;
            width: 300px;
            height: 200px;
            overflow: hidden; /* 내용을 박스 안에 고정 */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            position: relative;
        }


        .photo-div img {
            width: 100%;
            height: 100%; /* 이미지 높이를 div의 전체 높이에 맞춤 */
            object-fit: cover; /* 이미지가 박스를 꽉 채우도록 */
            transition: transform 0.2s;
        }

        .photo-div:hover {
            transform: scale(0.9, 0.9);

        }








        /* 풋터  */

        .footer {
            margin-top: 50px;
            width: 100%;
            background: white;
            border-top: 1px solid black;
            font-family: 'Open Sans', sans-serif;

        }
        .footer .footer-row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 3rem;
            padding: 50px;
        }
        .footer-row .footer-col h4 {
            color: black;
            font-size: 1.2rem;
            font-weight: 400;
            font-family: 'Open Sans', sans-serif;
        }
        .footer-col .links {
            margin-top: 20px;
        }
        .footer-col .links li {
            list-style: none;
            margin-bottom: 10px;
        }
        .footer-col .links li a {
            text-decoration: none;
            color: black;
            font-family: 'Open Sans', sans-serif;
        }
        .footer-col .links li a:hover {
            color: #fff;
        }
        .footer-col p {
            margin: 20px 0;
            color: black;
            max-width: 300px;
            font-family: 'Open Sans', sans-serif;
        }
        .footer-col form {
            display: flex;
            gap: 5px;
        }
        .footer-col input {
            height: 40px;
            border-radius: 6px;
            background: none;
            width: 100%;
            outline: none;
            border: 1px solid #7489C6 ;
            caret-color: #fff;
            color: #fff;
            padding-left: 10px;
            font-family: 'Open Sans', sans-serif;
        }
        .footer-col input::placeholder {
            color: #ccc;
        }
        .footer-col form button {
            background: #fff;
            outline: none;
            border: none;
            padding: 10px 15px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: 0.2s ease;
            font-family: 'Open Sans', sans-serif;
        }
        .footer-col form button:hover {
            background: #cecccc;
        }
        .footer-col .icons {
            display: flex;
            margin-top: 30px;
            gap: 30px;
            cursor: pointer;
        }
        .footer-col .icons i {
            color: #afb6c7;
        }
        .footer-col .icons i:hover  {
            color: #fff;
        }
        @media (max-width: 768px) {
            .footer {
                position: relative;
                bottom: 0;
                left: 0;
                transform: none;
                width: 100%;
                border-radius: 0;
            }

            .footer .footer-row {
                padding: 20px;
                gap: 1rem;
            }

            .footer-col form {
                display: block;
            }

            .footer-col form :where(input, button) {
                width: 100%;
            }

            .footer-col form button {
                margin: 10px 0 0 0;
            }
        }
    </style>
</head>
<body>
      <header>
         <tiles:insertAttribute name="header"></tiles:insertAttribute>
      </header>
      <aside>
          <tiles:insertAttribute name="sidebutton"></tiles:insertAttribute>
      </aside>
      <main>
         <tiles:insertAttribute name="main"></tiles:insertAttribute>
      </main>
    <footer>
        <tiles:insertAttribute name="footer"></tiles:insertAttribute>
    </footer>
</body>
</html>