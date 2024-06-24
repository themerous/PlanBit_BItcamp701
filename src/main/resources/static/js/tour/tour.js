const key = "fftZaPlUQRLNUdl6u7PIZoE9gBoawB4ituWAHIvMVGpNy9Y48F6v2euQ8bDwl5U7ln/pni5XxVeL0TlNU0qv5w==";

function getItem(key, pageNum, area, typeNum) {
    return "http://apis.data.go.kr/B551011/KorService1/" +
        "areaBasedSyncList1?" +
        "serviceKey=" + key +
        "&numOfRows=10" +
        "&pageNo=" + pageNum +
        "&MobileOS=ETC" +
        "&contentTypeId=" + typeNum +
        "&areaCode=" + area +
        "&MobileApp=TestApp" +
        "&_type=json";
}

function getOutLine(key, area, eachId) {
    return "http://apis.data.go.kr/B551011/KorService1/" +
        "areaBasedSyncList1?" +
        "serviceKey=" + key +
        "&numOfRows=10" +
        "&MobileOS=ETC" +
        "&contentId=" + eachId +
        "&areaCode=" + area +
        "&MobileApp=TestApp" +
        "&_type=json" +
        "&&addrinfoYN=Y" +
        "&&overviewYN=Y";
}

let pageNum = 1;
let areaCode = "";
let contentTypeId = 32;

window.onload = getMap();

function getMap() {
    let s = ``;

    $.ajax({
        url: getItem(key, 1, areaCode, contentTypeId),
        type: 'get',
        dataType: "json",
        success: function (data) {
            console.log(data.response.body.items.item);
            for (let its of data.response.body.items.item) {
                let photo = its.firstimage == "" ? "/images/koreaMap.png" :its.firstimage ;
                s += `<img class="api-pic" src="` + photo + `" placeholder="img"/>`;
                s += `<br><span>`;
                s += its.addr1;
                s += `</span><hr>`;
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