<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap" rel="stylesheet">
    <style>

        body {
            background-color: #f8f8f8;
            font-family: "Bree Serif", serif;
        }

        header {
            height: 100px;
            color: black;
            font-size: 50px;
            display: flex;
            margin-left: 110px;
            align-items: center; /* 수직 가운데 정렬 */
            font-family: "Alfa Slab One", serif;

        }


        main {

            justify-content: center; /* 가로 중앙 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            height: auto; /* 전체 화면 높이에 맞춰 정렬 */
            background-color: #f0f0f0; /* 배경색 */
            padding: 20px;
            border: 1px solid blue;
        }

        .blog-post {
            width: 90%; /* 전체 너비를 사용 */
            background-color: white;
            border: 1px solid blue;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            flex-direction: column; /* 세로 정렬 */
            height: 1500px;
            margin: 30px auto;

        }

        .post-image {
            width: 100%; /* 이미지 너비를 100%로 설정 */
            height: 350px; /* 이미지 높이 설정 */
            overflow: hidden; /* 넘치는 이미지 숨김 */


        }

        .post-image img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* 이미지 비율 유지하며 채우기 */
            border-radius: 8px;
        }

        .post-title {
            margin: 30px auto;
            width: 80%;
            border-left: 6px solid #51e3d4;
            padding: 10px;

        }

        .post-title h2 {
            margin: 1px 0; /* 제목 위아래 여백 설정 */
            font-size: 50px;

        }

        .post-info {
            width: 80%;
            margin: -10px auto; /* 제목 위아래 여백 설정 */
            height: 30px;
            display: flex;
            gap: 10px; /* 요소들 사이의 간격 설정 */
        }

        .post-info  p{
            font-size: 20px;

        }

        .post-info  i{
            font-size: 20px;

        }

        .post-content {
            padding: 20px;
            border: 1px solid darkgreen;
            border-bottom: 4px solid #51e3d4;
            margin: 30px auto;
            width: 80%;
            height: 800px;
        }

        .post-content h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .post-content p {
            font-size: 16px;
            color: #555;
            line-height: 1.6;
        }


        .right-btn {
            right: 0;
            position: fixed;
            bottom: 32px;
            align-self: end;
            margin-right: 20px;
            background-color: white;
            padding: 8px;
            border: 0;
            border-radius: 8px;
            color: #51e3d4;
            filter: drop-shadow(0px 4px 4px #d2dae5);
            width: 70px;
            height: 70px;
        }

        .right-btn:hover {
            background-color: #51e3d4;
            color: white;
            border-radius: 8px;
        }

    </style>
</head>
<body>
<div class="mainLayout">
    <div class="main">
        <tiles:insertAttribute name="main"></tiles:insertAttribute>
    </div>
</div>
</body>
</html>