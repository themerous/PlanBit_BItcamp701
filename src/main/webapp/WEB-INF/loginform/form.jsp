<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/loginlayout.css">
<script src="/js/login/loginform.js"></script>
    <style>
        @import url(https://fonts.googleapis.com/icon?family=Material+Icons);
        @import url('https://fonts.googleapis.com/css?family=Raleway');
        .wrapper {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
        }
        .box {
            display: block;
            min-width: 300px;
            height: 285px;
            margin: 10px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
            transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
            overflow: hidden;
        }
        .upload-options {
            position: relative;
            height: 75px;
            background-color: cadetblue;
            cursor: pointer;
            overflow: hidden;
            text-align: center;
            transition: background-color ease-in-out 150ms;
        }
        .upload-options:hover {
            background-color: lightblue;
        }
        .upload-options input {
            width: 0.1px;
            height: 0.1px;
            opacity: 0;
            overflow: hidden;
            position: absolute;
            z-index: -1;
        }
        .upload-options label {
            display: flex;
            align-items: center;
            width: 100%;
            height: 100%;
            font-weight: 400;
            text-overflow: ellipsis;
            white-space: nowrap;
            cursor: pointer;
            overflow: hidden;
            background-color: #51e3d4;
        }
        .upload-options label::after {
            content: 'add';
            font-family: 'Material Icons';
            position: absolute;
            font-size: 2.5rem;
            color: rgba(230, 230, 230, 1);
            top: calc(50% - 2.5rem);
            left: calc(50% - 1.25rem);
            z-index: 0;
        }
        .js--image-preview {
            height: 225px;
            width: 100%;
            position: relative;
            overflow: hidden;
            background-image: url('');
            background-color: white;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .js--image-preview::after {
            content: "photo_size_select_actual";
            font-family: 'Material Icons';
            position: relative;
            font-size: 4.5em;
            color: rgba(230, 230, 230, 1);
            top: calc(50% - 3rem);
            left: calc(50% - 2.25rem);
            z-index: 0;
        }
        .js--no-default::after {
            display: none;
        }
        i.material-icons {
            transition: color 100ms ease-in-out;
            font-size: 2.25em;
            line-height: 55px;
            color: white;
            display: block;
        }
        .drop {
            display: block;
            position: absolute;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 100%;
            transform: scale(0);
        }
        .animate {
            animation: ripple 0.4s linear;
        }
        @keyframes ripple {
            100% {
                opacity: 0;
                transform: scale(2.5);
            }
        }
    </style>
</head>
<body>
    <div class="container2" id="container2">
        <div class="register-container">
            <div class="register-title">회원가입</div>
            <form action="./insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요" maxlength="20" required="required">
                </div>
                <div class="form-group" id="info__id">
                    <label for="id">이메일</label>
                    <input type="email" id="id" name="id" class="form-control" placeholder="이메일를 입력하세요" maxlength="20" required="required">
                    <button type="button" class="idbtn" id="btncheckid">중복확인</button>
                    <small class="help-block" id="id-msg">이메일는 6-20자의 영문, 숫자, @ 조합으로 입력하세요.</small>
                </div>
                <div class="form-group">
                    <label for="pw">비밀번호</label>
                    <input type="password" id="pw" name="pw" class="form-control" placeholder="비밀번호를 입력하세요" maxlength="20" required="required">
                    <small class="help-block" id="pw-msg">비밀번호는 8-20자의 영문, 숫자, 특수문자 조합으로 입력하세요.</small>
                </div>
                <div class="form-group">
                    <label for="text-pw">비밀번호 확인</label>
                    <input type="password" id="test-pw" name="test-pw" class="form-control" placeholder="비밀번호를 다시 입력하세요" maxlength="20" required="required">
                    <small class="help-block" id="test-pw-msg"></small>
                </div>
                <div class="form-group">
                    <label for="photo">이미지</label>
                    <div class="wrapper">
                        <div class="box">
                            <div class="js--image-preview"></div>
                            <div class="upload-options">
                                <label>
                                    <input type="file" name="myfile" class="image-upload" accept="image/*" required="required"/>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn">회원가입</button>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        function initImageUpload(box) {
            let uploadField = box.querySelector('.image-upload');

            uploadField.addEventListener('change', getFile);

            function getFile(e){
                let file = e.currentTarget.files[0];
                checkType(file);
            }

            function previewImage(file){
                let thumb = box.querySelector('.js--image-preview'),
                    reader = new FileReader();

                reader.onload = function() {
                    thumb.style.backgroundImage = 'url(' + reader.result + ')';
                }
                reader.readAsDataURL(file);
                thumb.className += ' js--no-default';
            }

            function checkType(file){
                let imageType = /image.*/;
                if (!file.type.match(imageType)) {
                    throw 'Datei ist kein Bild';
                } else if (!file){
                    throw 'Kein Bild gewählt';
                } else {
                    previewImage(file);
                }
            }
        }

        // initialize box-scope
        var boxes = document.querySelectorAll('.box');

        for (let i = 0; i < boxes.length; i++) {
            let box = boxes[i];
            initDropEffect(box);
            initImageUpload(box);
        }

        /// drop-effect
        function initDropEffect(box){
            let area, drop, areaWidth, areaHeight, maxDistance, dropWidth, dropHeight, x, y;

            // get clickable area for drop effect
            area = box.querySelector('.js--image-preview');
            area.addEventListener('click', fireRipple);

            function fireRipple(e){
                area = e.currentTarget;
                // create drop
                if(!drop){
                    drop = document.createElement('span');
                    drop.className = 'drop';
                    this.appendChild(drop);
                }
                // reset animate class
                drop.className = 'drop';

                // calculate dimensions of area (longest side)
                areaWidth = getComputedStyle(this, null).getPropertyValue("width");
                areaHeight = getComputedStyle(this, null).getPropertyValue("height");
                maxDistance = Math.max(parseInt(areaWidth, 10), parseInt(areaHeight, 10));

                // set drop dimensions to fill area
                drop.style.width = maxDistance + 'px';
                drop.style.height = maxDistance + 'px';

                // calculate dimensions of drop
                dropWidth = getComputedStyle(this, null).getPropertyValue("width");
                dropHeight = getComputedStyle(this, null).getPropertyValue("height");

                // calculate relative coordinates of click
                // logic: click coordinates relative to page - parent's position relative to page - half of self height/width to make it controllable from the center
                x = e.pageX - this.offsetLeft - (parseInt(dropWidth, 10)/2);
                y = e.pageY - this.offsetTop - (parseInt(dropHeight, 10)/2) - 30;

                // position drop and animate
                drop.style.top = y + 'px';
                drop.style.left = x + 'px';
                drop.className += ' animate';
                e.stopPropagation();
            }
        }
    </script>
</body>
</html>
