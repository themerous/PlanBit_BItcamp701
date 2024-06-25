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
    return "http://apis.data.go.kr/B551011/KorService1/" +
        "searchKeyword1?"+
        "serviceKey=" + key;
        "&MobileApp=AppTest" +
        "&MobileOS=ETC" +
        "&pageNo=1" +
        "&numOfRows=10" +
        "&listYN=Y" +
        "&keyword=" + text +
        "&_type=json";
}

function getSearchInput(key, text){
    return "http://apis.data.go.kr/B551011/KorService1/" +
    "detailCommon1?" +
    "serviceKey=" + key +
    "&numOfRows=10" +
    "&pageNo=1" +
    "&MobileOS=ETC" +
    "&MobileApp=AppTest" +
    "&contentId=" + text +
    "&defaultYN=Y";
}

let text=$("#searchContent").val();

let pageNum = 1;
let areaCode = "";
let contentTypeId = 32;

window.onload = getMap();

function getSearch(){
    let s = ``;
    $.ajax({
        url: getSearchItem(key, text),
        type:"get",
        dataType: "json",
        success: function(d){
            console.log(d);
            $.ajax({
                url: getSearchInput(key, text),
                type:"get",
                dataType:"json",
                success: function (data){
                    console.log(data);
                    for(its of data.response.items.item){
                        s += `<div>`;
                        s += `<img src="` + its.firstimage + `"/>`;
                        s += `<span>`;
                        s += its.overview;
                        s += `</span>`;
                        s += `</div>`;
                    }
                    $("#ll").html(s);
                }
            })

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