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
   <style>
        body *{
            font-family: "Bree Serif", serif;

        }
        header {
            display: flex;
            width: 90%;
            justify-content: space-between;
            align-items: center;
            color: black;
            height: 20%;
            margin: 10px auto;
            border: 1px solid black;
            padding: 10px;
        }


        /*헤더 왼쪽 박스 */

        .title-left {
            font-size: 50px;
            font-family: "Alfa Slab One", serif;

            color: black;

        }

        .title-left:hover {
            color: #51e3d4;
        }

        /*헤더 중간 박스 */

        .title-center {
            font-size: 10px;
            color: #51e3d4;
        }

        .title-menu ul {
            list-style: none;
            display: flex;
            justify-content: center; /* 가로 방향 가운데 정렬 */
            margin: 0;
            padding: 0;
            gap: 80px;
        }

        .title-center ul li a {
            color: black;
            text-decoration: none;
            padding: 20px;
            transition: background-color 0.3s;
            font-size: 15px;
            font-family: "Alfa Slab One", serif;
        }

        .title-center ul li a:hover {
            color: #51e3d4;
            border-radius: 4px;
            padding: 20px;
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
            border: 1px solid black;
            cursor: pointer;
            width: 120px;
            height: 55px;
            text-align: center;
            font-size: 21px;
            font-family: 'Jua';
        }

        .gaip-button:hover {
            transform: scale(0.9, 0.9);
        }


        .login-button {
            display: inline-flex; /* Flexbox 사용 */
            align-items: center; /* 세로 방향으로 중앙 정렬 */
            justify-content: center; /* 가로 방향으로 중앙 정렬 */
            padding: 10px 20px;
            background-color: black;
            color: white;
            text-decoration: none;
            border: none;

            cursor: pointer;
            width: 120px;
            height: 55px;
            text-align: center;
            font-size: 21px;
            font-family: 'Jua';
        }

        .login-button:hover {
            background-color: #51e3d4;
            transform: scale(0.9, 0.9);
        }




        /*메인 구역 */

        main {
            width: 90%;
            height: 2000px;
            border: 1px solid black;
            margin: 0 auto;

        }

        .main-home1 {
            width: 100%;
            height: 700px;
            margin: 0 auto;
        }

        .main-button {
            width: 200px;
            height: 60px;
            border: 1px solid white;
            color: white;
            text-align: center;
            font-size: 37px;
            position: absolute;
            margin-top: 480px;
            margin-left: 160px;
            border-radius: 4px;
            align-items: center;
        }

        .main-photo-box {
            background-image: linear-gradient(
                    rgba(0, 0, 0, 0.1),
                    rgba(0, 0, 0, 0.1)
            ), url("/images/p1.jpg");
            width: 100%; /* 부모 요소 너비에 맞춤 */
            height: 600px; /* 고정 높이 설정 */
            position: relative;
        }

        .main-title {
            position: absolute;
            font-family: "Alfa Slab One", serif;
            font-size: 40px;
            margin-top: 360px;
            margin-left: 160px;
            color: white;
        }
        .main-mini-title {
            position: absolute;
            width: 600px;
            font-size: 15px;
            color: white;
            margin-top: 420px;
            margin-left: 160px;
        }

        .main-photo1 {
            background-image: url("/images/water.jpg");
            background-size: cover;
            margin-top: 70px;
            margin-left: 160px;
            width: 620px;
            height: 280px;
            position: absolute;
            left: 0;
        }

        .main-photo2 {

            border: 1px solid white;
            margin-top: 70px;
            width: 600px;
            height: 400px;
            position: absolute;
            right: 100px;

        }



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
            width: 80px;
            height: 80px;
            border: none;

        }

        .side-btn-box button i {
            font-size: 35px;

        }

        .side-btn-box button:hover {
            transform: scale(0.9, 0.9);
        }

        .main-home2 {
            border: 1px solid blue;
            width: 100%;
            height: 800px;
            margin: 0 auto;
            background-color: #51e3d4;
        }


        .main-home3 {
            display: grid; /* 내부 div를 가로로 배치 */
            width: 100%;
            height: auto;
            border: 1px solid black;
        }

        .photo-card {
            grid-template-columns: repeat(4, 1fr);
            display: grid;
            height: auto;
            width: 100%;

            background-color: black;
            padding: 15px;
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
            width: 350px;
            height: 250px;
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
</body>
</html>