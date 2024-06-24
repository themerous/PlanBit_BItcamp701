<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/board/boardDetail.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Averia+Serif+Libre:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Bebas+Neue&family=Bree+Serif&family=Hind+Vadodara:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<header><a>BIT TRIP</a></header>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f6609502fa3f00b4b14ebbdcdf59da6"></script>
<script type="text/javascript">
    $(function (){
        answer_list();
        $("#btnansweradd").click(function () {
            let num = ${dto.board_num};
            let content = $("#acontent").val();
            if (content == '') {
                alert("댓글을 입력후 등록해주세요");
                return;
            }

            $.ajax({
                type: 'post',
                dataType: 'json',
                url: "./ainsert",
                data: {"num": num, "content": content},
                success: function () {
                    answer_list();
                    $("#acontent").val("");
                },
                error: function (request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        });

        $(document).on("click", ".adel", function () {
            let aidx = $(this).attr("aidx");
            let a = confirm("해당 댓글을 삭제할까요?");
            if (a) {
                $.ajax({
                    type: "get",
                    dataType: "text",
                    data: {"aidx": aidx},
                    url: "./adelete",
                    success: function () {
                        answer_list();
                    },
                    error: function (request, status, error) {
                        console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                })
            }
        });

        $('#likeBtn').click(function() {
            let userId = '${sessionScope.loginid}';
            let userIdok = '${sessionScope.loginok}';
            console.log(userId);
            console.log(userIdok);
            if(userId == ""){
                alert("로그인하세요");
            }
            else{
                $.ajax({
                    url: '${pageContext.request.contextPath}/board/like',
                    type: 'POST',
                    data: {
                        board_num: ${dto.board_num},
                        user_id: userId
                    },
                    success: function(response) {
                        if (response.success) {
                            console.log(response.success);
                            $('#likeCount').text(response.board_like);
                        } else if(response.success === 0){
                            alert('한 유저당 3번까지만 좋아요를 누를 수 있습니다.');
                        }
                    },
                    error: function(xhr, status, error) {
                        alert('한 유저당 3번까지만 좋아요를 누를 수 있습니다.');
                        console.error('좋아요 요청 실패:', status, error);
                    }
                });
            }
        });
    });

    function answer_list() {
        let num = ${dto.board_num};
        let loginok = '${sessionScope.loginok}';
        let loginid = '${sessionScope.loginid}';

        $.ajax({
            type: "get",
            dataType: "json",
            data: {"num": num},
            url: "./alist",
            success: function (data) {
                $(".answercount").text(data.length);
                let s = "";
                s += `<div class="reply-num"><h2>`+ data.length +`개의 리뷰</h2></div>`;
                $.each(data, function (idx, ele) {
                    s += `<div class="post-reply-box">
                        <div class="post-reply">
                            <h5>(\${ele.user_id})</h5>작성일 : <span class="aday">\${ele.writeday}</span>`;
                    if (loginok == 'yes' && loginid == ele.user_id) {
                        s += `<i class="bi bi-trash adel" aidx="\${ele.aidx}" style="cursor:pointer;"></i>`;
                    }
                    s += `<div class="content"><p>\${ele.content}</p></div><button type="button" class="post-reply-button">답글</button>
                        </div>
                    </div>`;
                });
                $(".answerlist").html(s);
            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        })
    }
</script>
<main>
    <div class="blog-post">
        <div class="post-image">
            <img src="/images/e3.jpg" alt="이미지 설명">
        </div>
        <div class="post-title">
            <h2>${dto.board_title}</h2>
        </div>
        <div class="post-info">
            <i class="bi bi-calendar-check"></i><p><fmt:formatDate value="${dto.board_writeday}" pattern="yyyy.MM.dd HH:mm"/></p>
            <i class="bi bi-person-circle"></i><p>${dto.user_id}</p>
            <i class="bi bi-suit-heart-fill" style="color: #FF9EAA;"></i>좋아요 (<span id="likeCount">${like}</span>) <p>조회수: ${dto.board_views}</p>
        </div>
        <div class="post-content">
            <pre>${dto.board_content}</pre>
        </div>
        <div id="map" style="width:100%;height:350px;"></div>
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
            <div class="comment-section">
                <h5>댓글</h5>
                <hr>
                <div class="answerlist"></div>
                <c:if test="${sessionScope.loginok!=null}">
                    <textarea id="acontent" class="form-control" placeholder="댓글을 입력하세요..."></textarea>
                    <button type="button" class="btn btn-outline-success mt-2" id="btnansweradd">등록</button>
                </c:if>
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
    <polyline points="5 12 12 5 19 12"></polyline>
</button>
<button class="right-btn2" id="likeBtn" type="button"><i class="bi bi-suit-heart-fill"></i></button>

<script type="text/javascript">
    var placeNames = '${placeNames}';
    var placeAddresses = '${placeAddresses}';
    var placeLatitudes = '${placeLatitudes}';
    var placeLongitudes = '${placeLongitudes}';

    var namesArray = placeNames.split(',');
    var addressesArray = placeAddresses.split(',');
    var latitudesArray = placeLatitudes.split(',');
    var longitudesArray = placeLongitudes.split(',');

    var positions = [];
    for (var i = 0; i < namesArray.length; i++) {
        positions.push({
            title: namesArray[i],
            latlng: new kakao.maps.LatLng(parseFloat(latitudesArray[i]), parseFloat(longitudesArray[i]))
        });
    }

    var mapOption = {
        center: new kakao.maps.LatLng(positions[0].latlng.getLat(), positions[0].latlng.getLng()),
        level: 9
    };

    var map = new kakao.maps.Map(document.getElementById('map'), mapOption);

    // 마커 생성 및 인포윈도우 표시
    var markers = [];
    for (var i = 0; i < positions.length; i++) {
        var marker = new kakao.maps.Marker({
            map: map,
            position: positions[i].latlng
        });

        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="padding:5px;font-size:12px;">' + namesArray[i] + '</div>'
        });

        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

        markers.push(marker);
    }

    // 마커에 마우스 오버시 인포윈도우 표시 함수
    function makeOverListener(map, marker, infowindow) {
        return function () {
            infowindow.open(map, marker);
        };
    }

    // 마커에 마우스 아웃시 인포윈도우 닫기 함수
    function makeOutListener(infowindow) {
        return function () {
            infowindow.close();
        };
    }

    // 마커 사이의 선을 그리기 위한 객체 생성
    var linePath = [];
    for (var i = 0; i < positions.length; i++) {
        linePath.push(positions[i].latlng);
    }

    var polyline = new kakao.maps.Polyline({
        path: linePath, // 선을 구성하는 좌표배열 입니다
        strokeWeight: 2, // 선의 두께 입니다
        strokeColor: '#FF0000', // 선의 색깔입니다
        strokeOpacity: 0.7, // 선의 불투명도 입니다
        strokeStyle: 'solid' // 선의 스타일입니다
    });

    // 지도에 선을 표시합니다
    polyline.setMap(map);

    // 마커 간의 거리와 도보 시간 계산 및 인포윈도우 표시
    for (var i = 0; i < positions.length - 1; i++) {
        for (var j = i + 1; j < positions.length; j++) {
            var distanceService = new kakao.maps.DistanceMatrixService();

            distanceService.request({
                origins: [positions[i].latlng],
                destinations: [positions[j].latlng],
                travelMode: kakao.maps.TravelMode.WALKING
            }, makeDistanceCallback(i, j));
        }
    }

    // 거리와 도보 시간 요청 후 처리할 콜백 함수 생성
    function makeDistanceCallback(i, j) {
        return function (response, status) {
            if (status === kakao.maps.services.Status.OK) {
                var distance = response.distances[0][0];
                var duration = response.durations[0][0];

                var content = `<div style="padding:5px;font-size:12px;">
                                ${positions[i].title} - ${positions[j].title}<br>
                                거리: ${distance} m<br>
                                예상 도보 시간: ${duration} 분
                               </div>`;

                var infowindow = new kakao.maps.InfoWindow({
                    content: content,
                    position: new kakao.maps.LatLng((positions[i].latlng.getLat() + positions[j].latlng.getLat()) / 2,
                        (positions[i].latlng.getLng() + positions[j].latlng.getLng()) / 2)
                });

                infowindow.open(map);
            }
        };
    }
</script>
