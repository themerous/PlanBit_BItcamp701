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
    return "https://apis.data.go.kr/B551011/KorService1/searchKeyword1?" +
        "serviceKey=" + key +
        "&MobileApp=AppTest" +
        "&MobileOS=ETC" +
        "&pageNo=1" +
        "&numOfRows=10" +
        "&listYN=Y" +
        "&&arrange=A" +
        "&contentTypeId=12" +
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
        "&_type=json";
}

let pageNum = 1;
let areaCode = "";
let contentTypeId = 32;

window.onload = getMap();

function getSearch(){
    var text1 = $("#tt").val();
    let ss = ``;

    $.ajax({
        url: getSearchItem(key, text1),
        type:"get",
        dataType: "json",
        success: function(d){
            for(its of d.response.body.items.item){
                let searchPhoto = its.firstimage == "" ? "/images/noimage1.png" :its.firstimage2 ;
                ss += `<img class="api-pic" src="` + searchPhoto + `" placeholder="img"/>`;
                ss += `<span>`;
                ss += its.title+`:`;
                ss += `</span>`;
                $.ajax({
                    url: getSearchItemInput(key, its.contentid),
                    type: "get",
                    dataType:"json",
                    success: function(dd){
                        console.log(dd.response.body.items.item[0].overview);
                        ss += `<span>`;
                        ss += dd.response.body.items.item[0].overview;
                        ss += `</span>`;
                        $("#resultTest").html(ss);
                    }
                })

            }
            $("#resultTest").html(ss);
        }
    })
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
                s += `</div><hr>`;

            }
            $("#mapList").html(s);
        }
    })
}

function setArea(data) {
    areaCode = data;
}

function setType(data) {
    contentTypeId = data;
}

function setText(data){
    text = data;
}