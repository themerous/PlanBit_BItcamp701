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
   <style>
        body *{
            font-family: 'Jua';

        }
        header {
            display: flex;
            width: 100%;
            justify-content: space-between;
            align-items: center;
            padding: 1px 10px;
            color: white;
            position: fixed;
            z-index: 1;
        }

        .title-left {
            font-size: 60px;
        }

        .title-right button {
            background: none;
            color: white;
            cursor: pointer;
            font-size: 4em;
            border: none;
        }
        .sidebar {
            height: 100%;
            width: 0;
            position: fixed;
            top: 0;
            right: 0;
            background-color: white;
            overflow-x: hidden;
            transition: 0.5s;
            color: #51e3d4;
            cursor: pointer;
            border: 2px solid #51e3d4;
        }
        .sidebar-content p{
            padding: 1px;
            font-size: 1.8em;
            padding-left: 20px;
        }
        .sidebar-content button {
            background: none;
            border: none;
            color: #51e3d4;
            font-size: 2.6em;
            cursor: pointer;
            padding-left: 10px;
        }

        main{
            background-image: url("../images/p2.jpg");
            background-size: cover; /* 이미지를 비율에 맞게 늘리거나 축소합니다. */
            background-position: center; /* 이미지를 수평 및 수직으로 가운데로 정렬합니다. */
            width: 100%;
            height: 700px;
            position: absolute;
            top: 0;
        }

        .search-box{
            padding: 10px;
            position: absolute;
            top: 50%;
            left: 50%;
            height: 8%;
            background-color: #fff;
            border: 1px solid #51e3d4;
            border-radius: 30px;
            width:30%;
            transform: translate(-50%, -50%);
        }

        .search-btn{
            text-decoration: none;
            float: right;
            width: 10%;
            height: 30px;
            background-color: #fff;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #51e3d4;
            font-size: 23px;
        }

        .search-txt{
            display: flex;
            border:none;
            background: none;
            outline: none;
            float: left;
            font-size: 1.2rem;

        }
    </style>
</head>
<body>
      <header>
         <tiles:insertAttribute name="header"></tiles:insertAttribute>
      </header>
      <main>
         <tiles:insertAttribute name="main"></tiles:insertAttribute>
      </main>
</body>
</html>