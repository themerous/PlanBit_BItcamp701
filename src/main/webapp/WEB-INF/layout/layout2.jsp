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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body *{
            font-family: 'Jua';
        }

        body {
            background-size: cover; /* 이미지를 비율에 맞게 늘리거나 축소합니다. */
            background-image: url("../image/p1.jpg");

        }

        .container h1 {
            font-weight: bold;
            margin: 0;
        }

        .container p {
            font-size: 14px;
            font-weight: 100;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin: 20px 0 30px;
        }

        .container span {
            font-size: 12px;
        }

        .container a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
        }
        .container button {
            border-radius: 20px;
            border: 2px solid #51e3d4;
            background-color: #51e3d4;
            color: white;
            font-size: 18px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }

        .container form {
            background-color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }

        .container input {
            background-color: #eee;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
            position: relative;
            overflow: hidden;
            width: 850px;
            max-width: 100%;
            min-height: 580px;
            margin-top: 10%;
        }


        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
        }

        .log-in-container {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
        }


        .overlay {
            background: #51e3d4;
            background: linear-gradient(to right, #51e3d4, #19B3FF);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 0;
            color: #ffffff;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
        }


        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            top: 0;
            height: 100%;
            width: 50%;
        }

        .overlay-right {
            right: 0;
        }


        .social-container a {
            border: 1px solid #dddddd;
            border-radius: 50%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 5px;
            height: 40px;
            width: 40px;
        }

        /* 회원가입 */

        .container2 {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
            position: relative;
            overflow: hidden;
            width: 800px;
            max-width: 100%;
            min-height: 800px;
            margin: 10% auto;
        }


        .register-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;

        }

        .register-title {
            text-align: center;
            margin-bottom: 20px;
            font-size: 35px;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;

        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group .help-block {
            font-size: 12px;
            color: #777;
        }

        .form-group .btn {
            width: 100%;
            padding: 10px;
            background-color: #51e3d4;
            border: none;
            color: #fff;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
        }
        .select-container {
            position: relative;
        }

        .select-container select {
            appearance: none; /* 기본 화살표 제거 */
            -webkit-appearance: none;
            -moz-appearance: none;
        }

        .select-container .fa-chevron-down {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none; /* 아이콘 클릭 불가 */
        }
    </style>
</head>
<body>
	<div class="mainlayout">
      <div class="main">
         <tiles:insertAttribute name="main"></tiles:insertAttribute>
      </div>
   </div>
</body>
</html>