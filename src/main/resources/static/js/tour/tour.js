const key = "fftZaPlUQRLNUdl6u7PIZoE9gBoawB4ituWAHIvMVGpNy9Y48F6v2euQ8bDwl5U7ln/pni5XxVeL0TlNU0qv5w==";

function getItem(key, pageNum, area, typeNum) {
    return "http://apis.data.go.kr/B551011/KorService1/" +
        "areaBasedSyncList1?" +
        "serviceKey=" + key +
        "&numOfRows=20" +
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

let pageNum = 1;
let areaCode = "";
let contentTypeId = 32;

window.onload = getMap();

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
                let searchPhoto  = its.firstimage == "" ? "/images/noimage1.png" :its.firstimage2 ;

                insertData(its.contentid, searchPhoto, its.title, its.tel, i);
                i++;
            }
        }
    })
}

function insertData(contentid, photo, title, tel, i) {
    $.ajax({
        url: getSearchItemInput(key, contentid),
        type: "get",
        dataType:"json",
        success: function(dd){
            let ss = ``;
            ss += `<div class="searchList">`;
            ss += `<div class="searchListL"><img class="searchimageresult" src="${photo}"></div>`;
            ss += `<div class="searchListR">`;
            ss += `<p>`;
            ss += title+`:`;
            ss += `</p>`;
            ss += `<p>`;
            ss += "전화번호" + tel;
            ss += `</p>`;
            ss += `<p class="overview">`;
            ss += dd.response.body.items.item[0].overview;
            ss += `</p>`;
            ss += dd.response.body.items.item[0].homepage;
            ss += `</div>`;
            if(check == "yes"){
                ss += `<div id="markInput`+i+`"`+ `style="display: none;"` + `>`;
                ss += `<input name="title" id="sTitle`+i+`" type="hidden" value="`+title+`">`;   //title, photo, serial_num, link, phone_num
                ss += `<input name="photo" id="sPhoto`+i+`" type="hidden" value="`+photo+`">`;
                ss += `<input name="serial_num" id="sSerial_num`+i+`" type="hidden" value="`+contentid+`">`;
                ss += `<div id="sLink`+i+`" style="display: none;">`+dd.response.body.items.item[0].homepage+`</div>    `;
                ss += `<input name="phone_num" id="sPhone_num`+i+`" type="hidden" value="`+tel+`">`;
                ss += `<button type="button" onclick="sendInsert(${i})">즐겨찾기</button>`;
                ss += `</div>`;

                ss += `<div id="markDelete`+i+`"` + `style="display: none;"` +`>`;
                ss += `<input name="serial_num" id="dSerial_num`+i+`" type="hidden" value="`+contentid+`">`;
                ss += `<button type="button" onclick="sendDelete(${i})">즐겨찾기해제</button>`;
                ss += `</div>`;
            }
            ss += `</div><br>`;

            $("#result").html($("#result").html() + ss);
            checkFavoriteStatus(contentid, i);
        }
    });
}

function getMap() {
    let s = ``;

    $.ajax({
        url: getItem(key, pageNum, areaCode, contentTypeId),
        type: 'get',
        dataType: "json",
        success: function (data) {
            for (let its of data.response.body.items.item) {
                let photo = its.firstimage == "" ? "/images/noimage1.png" :its.firstimage ;
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
            $("#mapList").html(s);
        }
    })
}

function sendInsert(i){
    let linkString = document.getElementById("sLink" + i).firstElementChild != null ? document.getElementById("sLink" + i).firstElementChild.href : "";

    let phoneString = document.getElementById("sPhone_num" + i).value;
    let phoneNumbers = phoneString !== ""
        ? phoneString.match(/(\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}) | (\(?\d{3}\)?[\s.-]?\d{4}[\s.-]?\d{4}) | (\d{3}[\s.-]?\d{4}[\s.-]?\d{4}) | ((02)[\s.-]?\d{3}[\s.-]?\d{4}) | ((02)[\s.-]?\d{4}[\s.-]?\d{4})/g)
        : [];
    console.log(phoneNumbers);
    let phoneResult = phoneNumbers.length == 0 ? "" : phoneNumbers[0];

    formData = {
        "title" : document.getElementById("sTitle"+i).value,
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
            console.log("성공");
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
            console.log("삭제 성공");
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
