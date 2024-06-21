<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 20px;
            margin-top: 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 0;
        }
        .btn-primary {
            background-color: #1ec800;
            border-color: #1ec800;
            border-radius: 0;
        }
        .preview-img {
            margin-top: 10px;
            max-width: 200px;
        }
        .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
        .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
        .map_wrap {position:relative;width:100%;height:480px;}
        #menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
        .bg_white {background:#fff;}
        #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
        #menu_wrap .option{text-align: center;}
        #menu_wrap .option p {margin:10px 0;}
        #menu_wrap .option button {margin-left:5px;}
        #placesList li {list-style: none;}
        #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
        #placesList .item span {display: block;margin-top:4px;}
        #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        #placesList .info .gray {color:#8a8a8a;}
        #placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
        #placesList .info .tel {color:#009900;}
        #placesList .info .placey {color:#009900;}
        #placesList .info .placex {color:#009900;}
        #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
        #placesList .item .marker_1 {background-position: 0 -10px;}
        #placesList .item .marker_2 {background-position: 0 -56px;}
        #placesList .item .marker_3 {background-position: 0 -102px}
        #placesList .item .marker_4 {background-position: 0 -148px;}
        #placesList .item .marker_5 {background-position: 0 -194px;}
        #placesList .item .marker_6 {background-position: 0 -240px;}
        #placesList .item .marker_7 {background-position: 0 -286px;}
        #placesList .item .marker_8 {background-position: 0 -332px;}
        #placesList .item .marker_9 {background-position: 0 -378px;}
        #placesList .item .marker_10 {background-position: 0 -423px;}
        #placesList .item .marker_11 {background-position: 0 -470px;}
        #placesList .item .marker_12 {background-position: 0 -516px;}
        #placesList .item .marker_13 {background-position: 0 -562px;}
        #placesList .item .marker_14 {background-position: 0 -608px;}
        #placesList .item .marker_15 {background-position: 0 -654px;}
        #pagination {margin:10px auto;text-align: center;}
        #pagination a {display:inline-block;margin-right:10px;}
        #pagination .on {font-weight: bold; cursor: default;color:#777;}
    </style>
<div class="container">
    <h2>글 작성</h2>
    <form action="./boardinsert" method="post" enctype="multipart/form-data">
        <input type="hidden" name="board_num" value="${board_num}">
        <input type="hidden" id="isMapSectionAdded" name="isMapSectionAdded" value="false">

        <!-- 제목 입력창 -->
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" required>
        </div>

        <!-- 메인 사진 업로드 -->
        <div class="form-group">
            <label for="upload">메인사진</label>
            <input type="file" class="form-control-file" id="upload" name="upload" onchange="previewImage(event)">
            <img id="preview" class="preview-img" src="#" alt="미리보기 이미지" style="display: none;">
        </div>

        <!-- 내용 입력창 -->
        <div class="form-group">
            <label for="summernote">내용</label>
            <textarea id="summernote" name="content" class="form-control" placeholder="내용을 입력해주세요" required></textarea>
        </div>

        <!-- 저장하기 버튼 -->
        <button type="submit" class="btn btn-primary">저장하기</button>

        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" onclick="toggleMapSection()">
            Open modal
        </button>
    </form>


    <!-- -------------------------------------------------------------------------------------- -->
    <!-- The Modal -->
    <form action="./mapinsert" method="post">
    <div class="modal" id="myModal">
        <div class="modal-dialog modal-fullscreen" style="width: 100vw; margin: 0;">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Modal Heading</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="toggleMapSection()"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">

                    <div id="mapSection" style="display: none;">
                        <div id="wrapper">
                            <div class="map_wrap" id="map_wrap">
                                <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                                <div id="menu_wrap" class="bg_white">
                                    <div class="option">
                                        <div>
                                            키워드 : <input type="text" id="keyword" size="15">
                                            <button onclick="searchPlaces(); return false;">검색하기</button>
                                        </div>
                                    </div>
                                    <hr>
                                    <ul id="placesList"></ul>
                                    <div id="pagination"></div>
                                </div>
                            </div>

                            <!-- -------------------------------------------------------------------------------------- -->
                            <button type="submit" class="btn btn-primary">저장하기</button>
                            <button type="button" class="btn btn-primary" onclick="addNewBox()">추가</button>
                            <!-- Kakao Map API -->
                            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f6609502fa3f00b4b14ebbdcdf59da6&libraries=services"></script>
                            <script>
                                var markers = []; // 기본 마커들을 담을 배열
                                var customMarkers = []; // 커스텀 마커들을 담을 배열
                                var map, ps, infowindow, polyline;

                                // 지도를 초기화하는 함수
                                function initializeMap() {
                                    var mapContainer = document.getElementById('map');
                                    var mapOption = {
                                        center: new kakao.maps.LatLng(37.4994078625536, 127.029037792462),
                                        level: 3
                                    };

                                    map = new kakao.maps.Map(mapContainer, mapOption);
                                    ps = new kakao.maps.services.Places();
                                    infowindow = new kakao.maps.InfoWindow({zIndex: 1});
                                    polyline = new kakao.maps.Polyline({
                                        map: map,
                                        path: [],
                                        strokeWeight: 5,
                                        strokeColor: '#FF0000',
                                        strokeOpacity: 0.8,
                                        strokeStyle: 'solid'
                                    });
                                }

                                // 키워드로 장소를 검색하는 함수
                                function searchPlaces() {
                                    var keyword = document.getElementById('keyword').value;
                                    if (!keyword.replace(/^\s+|\s+$/g, '')) {
                                        alert('키워드를 입력해주세요!');
                                        return false;
                                    }
                                    ps.keywordSearch(keyword, placesSearchCB);
                                }

                                // 장소 검색의 콜백 함수
                                function placesSearchCB(data, status, pagination) {
                                    if (status === kakao.maps.services.Status.OK) {
                                        displayPlaces(data);
                                        displayPagination(pagination);

                                        var bounds = new kakao.maps.LatLngBounds();
                                        for (var i = 0; i < data.length; i++) {
                                            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                                        }
                                        map.setBounds(bounds);
                                    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                                        alert('검색 결과가 존재하지 않습니다.');
                                        return;
                                    } else if (status === kakao.maps.services.Status.ERROR) {
                                        alert('검색 결과 중 오류가 발생했습니다.');
                                        return;
                                    }
                                }

                                // 검색된 장소들을 표시하는 함수
                                function displayPlaces(places) {
                                    var listEl = document.getElementById('placesList'),
                                        menuEl = document.getElementById('menu_wrap'),
                                        fragment = document.createDocumentFragment(),
                                        bounds = new kakao.maps.LatLngBounds();

                                    removeAllChildNods(listEl);
                                    removeMarker();

                                    for (var i = 0; i < places.length; i++) {
                                        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                                            marker = addMarker(placePosition, i + 1),
                                            itemEl = getListItem(i, places[i]);

                                        bounds.extend(placePosition);

                                        (function(marker, pname, praddress, paddress, plat, plng) {
                                            itemEl.onclick = function() {
                                                var boxes = document.querySelectorAll('.address-box');
                                                var currentBox = boxes[boxes.length - 1];

                                                if (currentBox.querySelector('.fulladdress').value !== "") {
                                                    alert("박스 안에 내용이 있습니다. 추가 버튼을 눌러 새로운 박스를 생성해 주세요.");
                                                    return;
                                                }

                                                if (praddress) {
                                                    currentBox.querySelector('.fulladdress').value = "[" + pname + "]" + praddress;
                                                } else {
                                                    currentBox.querySelector('.fulladdress').value = "[" + pname + "]" + paddress;
                                                }

                                                currentBox.querySelector('.pname').value = pname;
                                                if (praddress) {
                                                    currentBox.querySelector('.paddress').value = praddress;
                                                } else {
                                                    currentBox.querySelector('.paddress').value = paddress;
                                                }
                                                currentBox.querySelector('.latclick').value = plat;
                                                currentBox.querySelector('.lngclick').value = plng;

                                                var path = polyline.getPath();
                                                path.push(new kakao.maps.LatLng(plat, plng));
                                                polyline.setPath(path);

                                                addCustomMarker(new kakao.maps.LatLng(plat, plng), pname);

                                                displayInfowindow(marker, pname);
                                            };

                                            itemEl.onmouseover = function () {
                                                displayInfowindow(marker, pname);
                                            };

                                            itemEl.onmouseout = function () {
                                                infowindow.close();
                                            };
                                        })(marker, places[i].place_name, places[i].road_address_name, places[i].address_name, places[i].y, places[i].x);

                                        fragment.appendChild(itemEl);
                                    }

                                    listEl.appendChild(fragment);
                                    menuEl.scrollTop = 0;

                                    map.setBounds(bounds);
                                }

                                // 리스트 아이템을 생성하는 함수
                                function getListItem(index, places) {
                                    var el = document.createElement('li'),
                                        itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
                                            '<div class="info" style="cursor:pointer;">' +
                                            '   <h5>' + places.place_name + '</h5>';

                                    if (places.road_address_name) {
                                        itemStr += '    <span>' + places.road_address_name + '</span>' +
                                            '    <span class="jibun gray">' + places.address_name + '</span>';
                                    } else {
                                        itemStr += '    <span>' + places.address_name + '</span>';
                                    }
                                    itemStr += '  <span class="tel">' + places.phone + '</span>';
                                    el.innerHTML = itemStr;
                                    el.className = 'item';

                                    return el;
                                }

                                // 마커를 추가하는 함수
                                function addMarker(position, idx) {
                                    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png',
                                        imageSize = new kakao.maps.Size(36, 37),
                                        imgOptions =  {
                                            spriteSize : new kakao.maps.Size(36, 691),
                                            spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10),
                                            offset: new kakao.maps.Point(13, 37)
                                        },
                                        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                                        marker = new kakao.maps.Marker({
                                            position: position,
                                            image: markerImage
                                        });

                                    marker.setMap(map);
                                    markers.push(marker);
                                    return marker;
                                }

                                // 커스텀 마커를 추가하는 함수
                                function addCustomMarker(position, title) {
                                    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
                                        imageSize = new kakao.maps.Size(24, 35),
                                        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
                                        marker = new kakao.maps.Marker({
                                            position: position,
                                            image: markerImage,
                                            title: title
                                        });

                                    marker.setMap(map);
                                    customMarkers.push({marker: marker, title: title});
                                }

                                // 인포윈도우를 표시하는 함수
                                function displayInfowindow(marker, title) {
                                    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
                                    infowindow.setContent(content);
                                    infowindow.open(map, marker);
                                }

                                // 노드를 모두 제거하는 함수
                                function removeAllChildNods(el) {
                                    while (el.hasChildNodes()) {
                                        el.removeChild(el.lastChild);
                                    }
                                }

                                // 마커를 제거하는 함수
                                function removeMarker() {
                                    for (var i = 0; i < markers.length; i++ ) {
                                        markers[i].setMap(null);
                                    }
                                    markers = [];
                                }

                                // 박스를 업데이트하는 함수
                                function updateBox(box, pname, praddress, paddress, plat, plng) {
                                    var fulladdress = box.querySelector('.fulladdress');
                                    var pnameInput = box.querySelector('.pname');
                                    var paddressInput = box.querySelector('.paddress');
                                    var latclick = box.querySelector('.latclick');
                                    var lngclick = box.querySelector('.lngclick');

                                    if (praddress) {
                                        fulladdress.value = "[" + pname + "]" + praddress;
                                    } else {
                                        fulladdress.value = "[" + pname + "]" + paddress;
                                    }

                                    pnameInput.value = pname;
                                    if (praddress) {
                                        paddressInput.value = praddress;
                                    } else {
                                        paddressInput.value = paddress;
                                    }
                                    latclick.value = plat;
                                    lngclick.value = plng;
                                }

                                // 지도 섹션을 토글하는 함수
                                function toggleMapSection() {
                                    var mapSection = document.getElementById('mapSection');
                                    var isMapSectionAdded = document.getElementById('isMapSectionAdded');

                                    if (mapSection.style.display === 'none') {
                                        mapSection.style.display = 'block';

                                        initializeMap();
                                        isMapSectionAdded.value = 'true';

                                    } else {
                                        mapSection.style.display = 'none';
                                        $(".fulladdress")[0].value = "";
                                        $(".pname")[0].value = "";
                                        $(".paddress")[0].value = "";
                                        $(".latclick")[0].value = "";
                                        $(".lngclick")[0].value = "";

                                        isMapSectionAdded.value = 'false';
                                    }
                                }

                                // 새로운 박스를 추가하는 함수
                                function addNewBox() {
                                    var container = document.getElementById('address-container');
                                    var boxes = container.getElementsByClassName('address-box');

                                    // 기존 박스들을 순회하며 값이 비어있는지 확인
                                    for (var i = 0; i < boxes.length; i++) {
                                        var box = boxes[i];
                                        var pname = box.querySelector('.pname').value.trim();
                                        var paddress = box.querySelector('.paddress').value.trim();
                                        var latclick = box.querySelector('.latclick').value.trim();
                                        var lngclick = box.querySelector('.lngclick').value.trim();

                                        // 값이 하나라도 비어있으면 경고창을 띄우고 함수 종료
                                        if (pname === '' || paddress === '' || latclick === '' || lngclick === '') {
                                            alert('박스 안에 값이 비어 있습니다. 모든 정보를 입력해주세요.');
                                            return;
                                        }
                                    }

                                    // 값이 모두 채워져 있으면 새로운 박스 추가
                                    var newBox = document.createElement('div');
                                    newBox.className = 'address-box';
                                    newBox.innerHTML = `
        <input type="text" class="fulladdress" name="fulladdress" style="width:90%;" disabled><br>
        <input type="text" class="pname" name="pname" value="">
        <input type="text" class="paddress" name="paddress" value="">
        <input type="text" class="latclick" name="latclick" value="">
        <input type="text" class="lngclick" name="lngclick" value="">
        <button type="button" class="btn btn-danger" onclick="deleteBox(this)">삭제</button>
    `;
                                    container.appendChild(newBox);
                                }

                                // 박스를 삭제하는 함수, 커스텀 마커도 함께 삭제
                                function deleteBox(button) {
                                    var box = button.parentNode;
                                    var lat = parseFloat(box.querySelector('.latclick').value);
                                    var lng = parseFloat(box.querySelector('.lngclick').value);

                                    // 커스텀 마커를 찾아서 제거
                                    for (var i = 0; i < customMarkers.length; i++) {
                                        var marker = customMarkers[i].marker;
                                        var markerTitle = customMarkers[i].title;
                                        if (markerTitle === box.querySelector('.pname').value) {
                                            // setTimeout을 사용하여 비동기 처리 시간을 확보
                                            setTimeout(function() {
                                                marker.setMap(null); // 마커 제거
                                                customMarkers.splice(i, 1); // 배열에서 제거
                                            }, 100); // 100ms 후에 제거
                                            break;
                                        }
                                    }

                                    // 폴리라인 업데이트
                                    var path = polyline.getPath().filter(function(latlng) {
                                        return !(latlng.getLat() === lat && latlng.getLng() === lng);
                                    });
                                    polyline.setPath(path);

                                    // 박스 요소 제거
                                    box.parentNode.removeChild(box);
                                }

                                // 모달이 열릴 때마다 지도를 다시 초기화
                                $('#myModal').on('shown.bs.modal', function () {
                                    if ($('#map').length > 0) {
                                        $('#map').remove();  // 기존 지도 요소 제거
                                    }
                                    $('#map_wrap').append('<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>');

                                    initializeMap();
                                });

                                // 모달이 닫힐 때 이벤트 핸들러
                                $('#myModal').on('hidden.bs.modal', function () {
                                    clearSearchResults(); // 검색 결과 초기화
                                    clearAddressBoxes();  // 추가된 주소 박스 초기화
                                    polyline.setPath([]); // 폴리라인 초기화
                                });

                                // 검색 결과 초기화 함수
                                function clearSearchResults() {
                                    $('#placesList').empty(); // 장소 목록 초기화
                                    removeMarker(); // 마커 제거 함수 호출
                                }

                                // 주소 박스 초기화 함수
                                function clearAddressBoxes() {
                                    $('#address-container').empty(); // 주소 박스 초기화
                                    // 기본 주소 박스 하나를 추가
                                    var defaultBox = `
                                    <div class="address-box">
                                        <input type="text" class="fulladdress" name="fulladdress" style="width:90%;" disabled><br>
                                        <input type="text" class="pname" name="pname" value="">
                                        <input type="text" class="paddress" name="paddress" value="">
                                        <input type="text" class="latclick" name="latclick" value="">
                                        <input type="text" class="lngclick" name="lngclick" value="">
                                    </div>
                                    `;
                                    $('#address-container').append(defaultBox);
                                }
                            </script>
                            <div id="address-container">
                                <!-- 위도 및 경도 좌표 및 위치정보 -->
                                <div class="address-box">
                                    <input type="text" class="fulladdress" name="fulladdress" style="width:90%;" disabled><br>
                                    <input type="text" class="pname" name="pname" value="">
                                    <input type="text" class="paddress" name="paddress" value="">
                                    <input type="text" class="latclick" name="latclick" value="">
                                    <input type="text" class="lngclick" name="lngclick" value="">

                                    <%--                                    <button type="button" class="btn btn-danger" onclick="deleteBox(this)">삭제</button>--%>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="toggleMapSection()">Close</button>
                </div>

            </div>
        </div>
    </div>
    </form>
    <!-- -------------------------------------------------------------------------------------- -->
</div>
<script>
    $(document).ready(function() {
        // 모달이 열릴 때 이벤트 핸들러 등록
        $('#myModal').on('shown.bs.modal', function () {
            // 키워드 입력란의 값을 "비트캠프"로 설정
            $('#keyword').val('비트캠프');
        });
        // 모달이 닫힐 때 이전 검색 결과 초기화
        $('#myModal').on('hidden.bs.modal', function () {
            clearSearchResults(); // 검색 결과 초기화
            clearAddressBoxes();  // 추가된 주소 박스 초기화
        });

        // 검색 결과 초기화 함수
        function clearSearchResults() {
            $('#placesList').empty(); // 장소 목록 초기화
            removeMarker(); // 마커 제거 함수 호출
            polyline.setPath([]); // 폴리라인 초기화
        }

        // 주소 박스 초기화 함수
        function clearAddressBoxes() {
            $('#address-container').empty(); // 주소 박스 초기화
            // 기본 주소 박스 하나를 추가
            var defaultBox = `
            <div class="address-box">
                <input type="text" class="fulladdress" name="fulladdress" style="width:90%;" disabled><br>
                <input type="text" class="pname" name="pname" value="">
                <input type="text" class="paddress" name="paddress" value="">
                <input type="text" class="latclick" name="latclick" value="">
                <input type="text" class="lngclick" name="lngclick" value="">
            </div>
            `;
            $('#address-container').append(defaultBox);
        }
    });

    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('preview');
            output.src = reader.result;
            output.style.display = 'block';
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.js"></script>
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true
        });
    });
</script>