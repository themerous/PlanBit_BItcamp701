let key = "fftZaPlUQRLNUdl6u7PIZoE9gBoawB4ituWAHIvMVGpNy9Y48F6v2euQ8bDwl5U7ln/pni5XxVeL0TlNU0qv5w==";
let loading = false;
let pageNum = 1;
let areaCode = "";
let contentTypeId = 32;

window.onload = function(){
    getMapInitial();
    setupInfiniteScroll();
}

function getItem(key, pageNum, area, typeNum) {
    return "http://apis.data.go.kr/B551011/KorService1/" +
        "areaBasedSyncList1?" +
        "serviceKey=" + key +
        "&numOfRows=5" +
        "&pageNo=" + pageNum +
        "&MobileOS=ETC" +
        "&contentTypeId=" + typeNum +
        "&areaCode=" + area +
        "&MobileApp=TestApp" +
        "&_type=json";
}

function getSearchItem(key, text){
    return "https://apis.data.go.kr/B551011/KorService1/" +
        "searchKeyword1?" +
        "serviceKey=" + key +
        "&MobileApp=AppTest" +
        "&MobileOS=ETC" +
        "&listYN=Y" +
        "&&arrange=A" +
        "&keyword=" + text +
        "&_type=json";
}

function getSearchItemInput(key, contentId){
    return "https://apis.data.go.kr/B551011/KorService1/" +
        "detailCommon1?" +
        "serviceKey=" + key +
        "&numOfRows=5" +
        "&pageNo=1" +
        "&MobileOS=ETC" +
        "&MobileApp=AppTest" +
        "&contentId=" + contentId +
        "&overviewYN=Y" +
        "&defaultYN=Y" +
        "&_type=json";
}

function getSearch(){
    $("#result").html("");
    let text1 = $("#tt").val();

    $.ajax({
        url: getSearchItem(key, text1),
        type:"get",
        dataType: "json",
        success: function(d){
            if(d.response.body.items.item == undefined){
                alert("검색 내용이 없습니다.");
                return false;
            }
            let i = 0;
            for(its of d.response.body.items.item){
                let searchPhoto  = its.firstimage == "" ? "/images/noimage2.png" :its.firstimage2 ;

                insertData(its.contentid, searchPhoto, its.title, its.addr1, its.tel, i);
                i++;
            }
        }
    })
}

function insertData(contentid, photo, title, addr, tel, i) {
    $.ajax({
        url: getSearchItemInput(key, contentid),
        type: "get",
        dataType:"json",
        success: function(dd){
            let ss = ``;
            ss += `<div class="searchList">`;
            ss += `<div class="searchListL"><div class="img-box"><img class="searchimageresult" src="${photo}"></div></div>`;
            ss += `<div class="searchListR">`;
            ss += `<p class="tour-title">`;
            ss += `[`+ title+`]`;
            ss += `</p>`;
            ss += `<p>`;
            ss += "주소 : " + addr;
            ss += `<p>`;
            ss += "전화번호 : " + tel;
            ss += `</p>`;
            ss += `<p class="overview">`;
            ss += dd.response.body.items.item[0].overview;
            ss += `</p>`;
            ss += dd.response.body.items.item[0].homepage;
            ss += `</div>`;
            if(check == "yes"){
                ss += `<div id="markInput`+i+`"`+ `style="display: none;"` + `>`;
                ss += `<input name="title" id="sTitle`+i+`" type="hidden" value="`+title+`">`;   //title, photo, serial_num, link, phone_num
                ss += `<input name="addr" id="sAddr`+i+`" type="hidden" value="`+addr+`">`;   //title, photo, serial_num, link, phone_num
                ss += `<input name="photo" id="sPhoto`+i+`" type="hidden" value="`+photo+`">`;
                ss += `<input name="serial_num" id="sSerial_num`+i+`" type="hidden" value="`+contentid+`">`;
                ss += `<div id="sLink`+i+`" style="display: none;">`+dd.response.body.items.item[0].homepage+`</div>    `;
                ss += `<input name="phone_num" id="sPhone_num`+i+`" type="hidden" value="`+tel+`">`;
                ss += `<button type="button" onclick="sendInsert(${i})" class="star"><i class="bi bi-star" style="color: #fce61b"></i></button>`;
                ss += `</div>`;

                ss += `<div id="markDelete`+i+`"` + `style="display: none;"` +`>`;
                ss += `<input name="serial_num" id="dSerial_num`+i+`" type="hidden" value="`+contentid+`">`;
                ss += `<button type="button" onclick="sendDelete(${i})" class="star"><i class="bi bi-star-fill" style="color: #fce61b"></i></button>`;
                ss += `</div>`;
            }
            ss += `</div><br>`;

            $("#result").html($("#result").html() + ss);
            checkFavoriteStatus(contentid, i);
        }
    });
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////

//getMap infinite
// AJAX를 통해 데이터를 가져오는 함수
function getMapInitial() {
    if (loading) return;  // 이미 로딩 중이면 실행하지 않음
    loading = true;       // 로딩 시작
    document.getElementById("mapList").innerHTML="";

    pageNum = 1;
    $.ajax({
        url: getItem(key, pageNum, areaCode, contentTypeId),
        type: 'get',
        dataType: "json",
        success: function(data) {

            let s = '';
            for (let its of data.response.body.items.item) {
                let photo = its.firstimage == "" ? "/images/noimage2.png" : its.firstimage;
                s += `<div class="scrollList">`;
                s += `<img class="api-pic" src="` + photo + `" placeholder="img"/>`;
                s += `<div class="scrollListR">`;
                s += `<br><span>`;
                s += its.title;
                s += `</span><hr>`;
                s += `<br><span>`;
                s += its.addr1;
                s += `</span><hr>`;
                s += `<br><span>`;
                s += its.tel;
                s += `</span><hr>`;
                s += `<br><span>`;
                s += its.contentid;
                s += `</span><hr>`;
                s += `</div>`;
                s += `</div>`;
                s += `<hr>`;
            }
            $("#mapList").html($("#mapList").html()+s);
            $("#tourList")[0].scrollTop = 0;
            // 기존 내용에 추가
            pageNum++;                // 페이지 번호 증가

            loading = false;  // 로딩 완료
        },
        error: function() {
            loading = false;  // 로딩 실패시에도 플래그 초기화

        }
    });
}

// 초기화 함수
function getMapInfinite(){
    if (loading) return;  // 이미 로딩 중이면 실행하지 않음
    loading = true;       // 로딩 시작
    $.ajax({
        url: getItem(key, pageNum, areaCode, contentTypeId),
        type: 'get',
        dataType: "json",
        success: function(data) {
            if (data.response.body.items) {

                let s = '';
                for (let its of data.response.body.items.item) {
                    let photo = its.firstimage == "" ? "/images/noimage2.png" : its.firstimage;
                    s += `<div class="scrollList">`;
                    s += `<img class="api-pic" src="` + photo + `" placeholder="img"/>`;
                    s += `<div class="scrollListR">`;
                    s += `<br><span>`;
                    s += its.title;
                    s += `</span><hr>`;
                    s += `<br><span>`;
                    s += its.addr1;
                    s += `</span><hr>`;
                    s += `<br><span>`;
                    s += its.tel;
                    s += `</span><hr>`;
                    s += `<br><span>`;
                    s += its.contentid;
                    s += `</span><hr>`;
                    s += `</div>`;
                    s += `</div>`;
                    s += `<hr>`;
                }
                $("#mapList").html($("#mapList").html()+s);  // 기존 내용에 추가
                pageNum++;                // 페이지 번호 증가
            }
            loading = false;  // 로딩 완료
        },
        error: function() {
            loading = false;  // 로딩 실패시에도 플래그 초기화
        }
    });
}

// 스크롤 이벤트 설정
function setupInfiniteScroll() {
    $("#tourList").on('scroll', function() {
        if ($("#tourList").scrollTop() + $("#tourList").height() >= $("#tourList")[0].scrollHeight) {
            if (!loading) {  // 로딩 중이 아닐 때만 실행
                getMapInfinite();
            }
        }
    });
}

// 초기화
$(document).ready(function() {
    setupInfiniteScroll();
});

//////////////////////////////////////////////////////////////////////////////////////

function sendInsert(i){
    let linkString = document.getElementById("sLink" + i).firstElementChild != null ? document.getElementById("sLink" + i).firstElementChild.href : "";

    let phoneString = document.getElementById("sPhone_num" + i).value;
    let phoneNumbers = phoneString !== ""
        ? phoneString.match(/(\(?\d{2,4}\)?[\s.-]?\d{3,4}[\s.-]?\d{3,4})/g)
        : [];

    let phoneResult = phoneNumbers.length == 0 ? "" : phoneNumbers[0];

    formData = {
        "title" : document.getElementById("sTitle"+i).value,
        "addr" : document.getElementById("sAddr" + i).value,
        "photo" : document.getElementById("sPhoto" + i).value,
        "serial_num" : document.getElementById("sSerial_num" + i).value,
        "link" : linkString,
        "phone_num" : phoneResult
    }
    $.post({
        url: "/tour/insert",
        data: JSON.stringify(formData),
        contentType : 'application/json; charset=utf-8',
        success: function(d) {

            // 여기서 즐찾 true false 적용
            document.getElementById("markInput" + i).style.display = "none";
            document.getElementById("markDelete" + i).style.display = "block";
        }
    });

}

function sendDelete(i){
    formData = {
        "serial_num" : document.getElementById("dSerial_num" + i).value
    }
    $.post({
        url : "/tour/delete",
        data : JSON.stringify(formData),
        contentType : 'application/json; charset=utf-8',
        success : function(d) {

            document.getElementById("markInput" + i).style.display = "block";
            document.getElementById("markDelete" + i).style.display = "none";
        }
    })

}

function setArea(data) {
    areaCode = data;
}

function setType(data) {
    contentTypeId = data;
}

function checkFavoriteStatus(contentid, i) {
    $.ajax({
        url: "/tour/check",
        type: "post",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({ "serial_num": contentid }),
        success: function(response) {
            if(response.check == 1) {
                document.getElementById("markInput" + i).style.display = "none";
                document.getElementById("markDelete" + i).style.display = "block";
            } else {
                document.getElementById("markInput" + i).style.display = "block";
                document.getElementById("markDelete" + i).style.display = "none";
            }
        }
    });
}