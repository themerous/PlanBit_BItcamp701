//+ 첫 function에 블로그 좋아요 ajax추가하기

$(function(){
    //일단 리스트 다 불러오기

    $.ajax({
        url: "/tour/markList",
        type: "post",
        success: function(data){
            let s = ``;
            for (let d of data){
                s += `<div class="tourList">`;
                s += `<div class="tourListL col-sm-4">`
                s += `<img class="db-pic" src="` + d.photo + `">`;
                s += `</div>`;

                s += `<div class="tourListR col-sm-8">`;
                s += `<p>` + d.title + `</p>`;
                s += `<p>` + d.addr + `</p>`;
                s += `<p>`;
                s += `<a href="` + d.link + `">`+ d.link + `</a>`;
                s += `</p>`;
                s += `<p>` + d.phone_num + `</p>`;
                s += `</div>`;

                s += `</div>`;
            }
            $("#tourFavorites").append(s);
        },
        error: function(){
            console.log("에러임");
        }
    })
})

function myPageLoad(num){
    if(num == 1){
        document.getElementById("row1").style.display = "flex";
        document.getElementById("row2").style.display = "none";
        document.getElementById("row3").style.display = "none";
    }
    else if(num == 2){
        document.getElementById("row1").style.display = "none";
        document.getElementById("row2").style.display = "flex";
        document.getElementById("row3").style.display = "none";
    }
    else if(num == 3){
        document.getElementById("row1").style.display = "none";
        document.getElementById("row2").style.display = "none";
        document.getElementById("row3").style.display = "flex";
    }
}