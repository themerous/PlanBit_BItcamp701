$(function (){
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

    // 장소 목록을 .post-maplist-box에 추가
    var mapListBox = $('.post-maplist-box');
    mapListBox.empty(); // 기존 내용을 초기화

    var listHTML = '';
    for (var i = 0; i < namesArray.length; i++) {
        listHTML += `<div>${i + 1}번 ${namesArray[i]} (위도: ${latitudesArray[i]}, 경도: ${longitudesArray[i]})</div>`;
    }
    mapListBox.html(listHTML);
});
