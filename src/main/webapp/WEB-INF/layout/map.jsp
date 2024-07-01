<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div><h3>실시간 교통 상황</h3></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f6609502fa3f00b4b14ebbdcdf59da6&libraries=services"></script>
<div id="map" style="width:100%;height:700px;"></div>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.4994078625536, 127.029037792462), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 지도에 교통정보를 표시하도록 지도타입을 추가합니다
    map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);

    // 아래 코드는 위에서 추가한 교통정보 지도타입을 제거합니다
    // map.removeOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
</script>

