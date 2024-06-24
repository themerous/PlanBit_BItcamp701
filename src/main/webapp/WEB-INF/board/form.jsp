<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.css"
	rel="stylesheet">
<style>
body {
	background-color: #f5f5f5;
}

.container {
	background-color: white;
	padding: 20px;
	margin-top: 30px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '����', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 480px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .info .placey {
	color: #009900;
}

#placesList .info .placex {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>

<div class="container">
	<h2>�� �ۼ�</h2>
	<form action="./boardinsert" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${board_num}"> <input
			type="hidden" id="isMapSectionAdded" name="isMapSectionAdded"
			value="false">

		<!-- ���� �Է�â -->
		<div class="form-group">
			<label for="title">����</label> <input type="text" class="form-control"
				id="title" name="title" placeholder="������ �Է����ּ���" required>
		</div>

		<!-- ���� ���� ���ε� -->
		<div class="form-group">
			<label for="upload">���λ���</label> <input type="file"
				class="form-control-file" id="upload" name="upload"
				onchange="previewImage(event)"> <img id="preview"
				class="preview-img" src="#" alt="�̸����� �̹���" style="display: none;">
		</div>

		<!-- ���� �Է�â -->
		<div class="form-group">
			<label for="summernote">����</label>
			<textarea id="summernote" name="content" class="form-control"
				placeholder="������ �Է����ּ���" required></textarea>
		</div>

		<!-- �����ϱ� ��ư -->
		<button type="" class="btn btn-primary">�����ϱ�</button>

		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#myModal" onclick="toggleMapSection()">Open
			modal</button>
	</form>


	<!-- -------------------------------------------------------------------------------------- -->
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-fullscreen"
			style="width: 100vw; margin: 0;">
			<form action="./mapinsert" method="post">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Modal Heading</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							onclick="toggleMapSection()"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">

						<div id="mapSection" style="display: none;">
							<div id="wrapper">
								<div class="map_wrap" id="map_wrap">
									<div id="map"
										style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
									<div id="menu_wrap" class="bg_white">
										<div class="option">
											<div>
												Ű���� : <input type="text" id="keyword" size="15">
												<button onclick="searchPlaces(); return false;">�˻��ϱ�</button>
											</div>
										</div>
										<hr>
										<ul id="placesList"></ul>
										<div id="pagination"></div>
									</div>
								</div>

								<!-- -------------------------------------------------------------------------------------- -->
								<button type="" class="btn btn-primary">�����ϱ�</button>
								<button type="button" class="btn btn-primary"
									onclick="addNewBox()">�߰�</button>
								<!-- Kakao Map API -->
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f6609502fa3f00b4b14ebbdcdf59da6&libraries=services"></script>
								<script>
                                var markers = []; // �⺻ ��Ŀ���� ���� �迭
                                var customMarkers = []; // Ŀ���� ��Ŀ���� ���� �迭
                                var map, ps, infowindow, polyline;

                                // ������ �ʱ�ȭ�ϴ� �Լ�
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

                                // Ű����� ��Ҹ� �˻��ϴ� �Լ�
                                function searchPlaces() {
                                    var keyword = document.getElementById('keyword').value;
                                    if (!keyword.replace(/^\s+|\s+$/g, '')) {
                                        alert('Ű���带 �Է����ּ���!');
                                        return false;
                                    }
                                    ps.keywordSearch(keyword, placesSearchCB);
                                }

                                // ��� �˻��� �ݹ� �Լ�
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
                                        alert('�˻� ����� �������� �ʽ��ϴ�.');
                                        return;
                                    } else if (status === kakao.maps.services.Status.ERROR) {
                                        alert('�˻� ��� �� ������ �߻��߽��ϴ�.');
                                        return;
                                    }
                                }

                                // �˻��� ��ҵ��� ǥ���ϴ� �Լ�
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
                                                    alert("�ڽ� �ȿ� ������ �ֽ��ϴ�. �߰� ��ư�� ���� ���ο� �ڽ��� ������ �ּ���.");
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

                                // ����Ʈ �������� �����ϴ� �Լ�
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

                                // ��Ŀ�� �߰��ϴ� �Լ�
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

                                // Ŀ���� ��Ŀ�� �߰��ϴ� �Լ�
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

                                // ���������츦 ǥ���ϴ� �Լ�
                                function displayInfowindow(marker, title) {
                                    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
                                    infowindow.setContent(content);
                                    infowindow.open(map, marker);
                                }

                                // ��带 ��� �����ϴ� �Լ�
                                function removeAllChildNods(el) {
                                    while (el.hasChildNodes()) {
                                        el.removeChild(el.lastChild);
                                    }
                                }

                                // ��Ŀ�� �����ϴ� �Լ�
                                function removeMarker() {
                                    for (var i = 0; i < markers.length; i++ ) {
                                        markers[i].setMap(null);
                                    }
                                    markers = [];
                                }

                                // �ڽ��� ������Ʈ�ϴ� �Լ�
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

                                // ���� ������ ����ϴ� �Լ�
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

                                // ���ο� �ڽ��� �߰��ϴ� �Լ�
                                function addNewBox() {
                                    var container = document.getElementById('address-container');
                                    var boxes = container.getElementsByClassName('address-box');

                                    // ���� �ڽ����� ��ȸ�ϸ� ���� ����ִ��� Ȯ��
                                    for (var i = 0; i < boxes.length; i++) {
                                        var box = boxes[i];
                                        var pname = box.querySelector('.pname').value.trim();
                                        var paddress = box.querySelector('.paddress').value.trim();
                                        var latclick = box.querySelector('.latclick').value.trim();
                                        var lngclick = box.querySelector('.lngclick').value.trim();

                                        // ���� �ϳ��� ��������� ���â�� ���� �Լ� ����
                                        if (pname === '' || paddress === '' || latclick === '' || lngclick === '') {
                                            alert('�ڽ� �ȿ� ���� ��� �ֽ��ϴ�. ��� ������ �Է����ּ���.');
                                            return;
                                        }
                                    }

                                    // ���� ��� ä���� ������ ���ο� �ڽ� �߰�
                                    var newBox = document.createElement('div');
                                    newBox.className = 'address-box';
                                    newBox.innerHTML = `
                                        <input type="text" class="fulladdress" name="fulladdress" style="width:90%;" disabled><br>
                                        <input type="text" class="pname" name="mapname" value="">
                                        <input type="text" class="paddress" name="addr" value="">
                                        <input type="text" class="latclick" name="lat" value="">
                                        <input type="text" class="lngclick" name="lng" value="">
                                        <button type="button" class="btn btn-danger" onclick="deleteBox(this)">����</button>
                                    `;
                                    container.appendChild(newBox);
                                }

                                // �ڽ��� �����ϴ� �Լ�, Ŀ���� ��Ŀ�� �Բ� ����
                                function deleteBox(button) {
                                    var box = button.parentNode;
                                    var lat = parseFloat(box.querySelector('.latclick').value);
                                    var lng = parseFloat(box.querySelector('.lngclick').value);

                                    // Ŀ���� ��Ŀ�� ã�Ƽ� ����
                                    for (var i = 0; i < customMarkers.length; i++) {
                                        var marker = customMarkers[i].marker;
                                        var markerTitle = customMarkers[i].title;
                                        if (markerTitle === box.querySelector('.pname').value) {
                                            // setTimeout�� ����Ͽ� �񵿱� ó�� �ð��� Ȯ��
                                            setTimeout(function() {
                                                marker.setMap(null); // ��Ŀ ����
                                                customMarkers.splice(i, 1); // �迭���� ����
                                            }, 100); // 100ms �Ŀ� ����
                                            break;
                                        }
                                    }

                                    // �������� ������Ʈ
                                    var path = polyline.getPath().filter(function(latlng) {
                                        return !(latlng.getLat() === lat && latlng.getLng() === lng);
                                    });
                                    polyline.setPath(path);

                                    // �ڽ� ��� ����
                                    box.parentNode.removeChild(box);
                                }

                                // ����� ���� ������ ������ �ٽ� �ʱ�ȭ
                                $('#myModal').on('shown.bs.modal', function () {
                                    if ($('#map').length > 0) {
                                        $('#map').remove();  // ���� ���� ��� ����
                                    }
                                    $('#map_wrap').append('<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>');

                                    initializeMap();
                                });

                                // ����� ���� �� �̺�Ʈ �ڵ鷯
                                $('#myModal').on('hidden.bs.modal', function () {
                                    clearSearchResults(); // �˻� ��� �ʱ�ȭ
                                    clearAddressBoxes();  // �߰��� �ּ� �ڽ� �ʱ�ȭ
                                    polyline.setPath([]); // �������� �ʱ�ȭ
                                });

                                // �˻� ��� �ʱ�ȭ �Լ�
                                function clearSearchResults() {
                                    $('#placesList').empty(); // ��� ��� �ʱ�ȭ
                                    removeMarker(); // ��Ŀ ���� �Լ� ȣ��
                                }

                                // �ּ� �ڽ� �ʱ�ȭ �Լ�
                                function clearAddressBoxes() {
                                    $('#address-container').empty(); // �ּ� �ڽ� �ʱ�ȭ
                                    // �⺻ �ּ� �ڽ� �ϳ��� �߰�
                                    var defaultBox = `
                                    <div class="address-box">
                                        <input type="text" class="fulladdress" name="fulladdress" style="width:90%;" disabled><br>
                                        <input type="text" class="pname" name="mapname" value="">
                                        <input type="text" class="paddress" name="paddress" value="">
                                        <input type="text" class="latclick" name="lat" value="">
                                        <input type="text" class="lngclick" name="lng" value="">
                                    </div>
                                    `;
                                    $('#address-container').append(defaultBox);
                                }
                            </script>
								<div id="address-container">
									<!-- ���� �� �浵 ��ǥ �� ��ġ���� -->
									<div class="address-box">
										<input type="text" class="fulladdress" name="fulladdress"
											style="width: 90%;" disabled><br> <input
											type="text" class="pname" name="mapname" value=""> <input
											type="text" class="paddress" name="paddress" value="">
										<input type="text" class="latclick" name="lat" value="">
										<input type="text" class="lngclick" name="lng" value="">

										<%--                                    <button type="button" class="btn btn-danger" onclick="deleteBox(this)">����</button>--%>
									</div>
								</div>

							</div>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal" onclick="toggleMapSection()">Close</button>
					</div>

				</div>
			</form>
		</div>
	</div>
	<!-- -------------------------------------------------------------------------------------- -->
</div>
<script>
    $(document).ready(function() {
        // ����� ���� �� �̺�Ʈ �ڵ鷯 ���
        $('#myModal').on('shown.bs.modal', function () {
            // Ű���� �Է¶��� ���� "��Ʈķ��"�� ����
            $('#keyword').val('��Ʈķ��');
        });
        // ����� ���� �� ���� �˻� ��� �ʱ�ȭ
        $('#myModal').on('hidden.bs.modal', function () {
            clearSearchResults(); // �˻� ��� �ʱ�ȭ
            clearAddressBoxes();  // �߰��� �ּ� �ڽ� �ʱ�ȭ
        });

        // �˻� ��� �ʱ�ȭ �Լ�
        function clearSearchResults() {
            $('#placesList').empty(); // ��� ��� �ʱ�ȭ
            removeMarker(); // ��Ŀ ���� �Լ� ȣ��
            polyline.setPath([]); // �������� �ʱ�ȭ
        }

        // �ּ� �ڽ� �ʱ�ȭ �Լ�
        function clearAddressBoxes() {
            $('#address-container').empty(); // �ּ� �ڽ� �ʱ�ȭ
            // �⺻ �ּ� �ڽ� �ϳ��� �߰�
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.js"></script>
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