$(function () {

    // 모달 열기와 관련된 요소 찾기
    var modal = document.getElementById("mapModal");
    var span = document.getElementsByClassName("close")[0];


    // 전역 변수를 사용하여 배열로 변환
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


    // 장소 목록을 .post-maplist-box에 추가
    var mapListBox = $('.post-maplist-box');
    mapListBox.empty(); // 기존 내용을 초기화

    var listHTML = '<ul class="ordered-nav">';
    for (var i = 0; i < namesArray.length; i++) {
        listHTML += `<li class="ordered-nav--link" style="cursor: pointer;" data-lat="${latitudesArray[i]}" data-lng="${longitudesArray[i]}" data-name="${namesArray[i]}" data-address="${addressesArray[i]}">${i + 1}번 여행지 : ${namesArray[i]} </li>`;
    }
    listHTML += '</ul>';
    mapListBox.html(listHTML);

    // 이벤트 위임을 사용하여 리스트 아이템 클릭 이벤트 처리
    $('.post-maplist-box').on('click', '.ordered-nav--link', function () {
        var lat = $(this).data('lat');
        var lng = $(this).data('lng');
        var name = $(this).data('name');
        var address = $(this).data('address');


        // 모달 열기
        modal.style.display = "block";

        // 지도 초기화
        var mapCenter = new kakao.maps.LatLng(lat, lng);
        var mapOption = {
            center: mapCenter,
            level: 3
        };
        var map = new kakao.maps.Map(document.getElementById('modalMap'), mapOption);

        // 커스텀 오버레이 내용
        var content = '<div class="overlay_info">';
        content += `    <a href="https://place.map.kakao.com/" target="_blank"><strong>${name}</strong></a>`;
        content += `    <div class="desc"><span>${address}</span></div>`;
        content += '</div>';

        // 커스텀 오버레이 생성
        var position = new kakao.maps.LatLng(lat, lng);
        var mapCustomOverlay = new kakao.maps.CustomOverlay({
            position: position,
            content: content,
            xAnchor: 0.5,
            yAnchor: 1.1
        });
        mapCustomOverlay.setMap(map);

        // 로드뷰 초기화
        var rvContainer = document.getElementById('roadview');
        var rv = new kakao.maps.Roadview(rvContainer);
        var rvClient = new kakao.maps.RoadviewClient();
        rvClient.getNearestPanoId(mapCenter, 50, function (panoId) {
            rv.setPanoId(panoId, mapCenter);
        });

        kakao.maps.event.addListener(rv, 'init', function () {
            var rvCustomOverlay = new kakao.maps.CustomOverlay({
                position: position,
                content: content,
                xAnchor: 0.5,
                yAnchor: 0.5
            });
            rvCustomOverlay.setMap(rv);

            var projection = rv.getProjection();
            var viewpoint = projection.viewpointFromCoords(rvCustomOverlay.getPosition(), rvCustomOverlay.getAltitude());
            rv.setViewpoint(viewpoint);
        });
    });

    // 모달 닫기
    span.onclick = function () {
        modal.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
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
});
