const stpath = "https://kr.object.ncloudstorage.com/hyunsung-bucket/blog_photo";

$(function(){
    $.ajax({
        url: "/bit/blog/getting",
        type: "post",
        success: function(data){
            let s = ``;
            for (element of data) {
                let photoUrl = element.photo == null ? "../images/p1.jpg" : stpath + "/" + element.photo;

                let date = new Date(element.board_writeday);
                let formattedDate = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);

                s += `<div class="col-lg-4 mb-4">`;
                s += `<div class="card">`;
                s += `<a onclick="location.href='/board/detail?board_num=`+element.board_num+`&currentPage=1'">`;
                s += `<img class="card-img-top" src="`+photoUrl +`">`;
                s += `</a>`;
                s += `<div class="card-body">`;
                s += `<div class="small text-muted">`;
                s += `<span>`+element.user_id+`</span>`;
                s += `<span style="color: #8a8a8a; float: right">`+formattedDate+`</span>`;
                s += `</div>`;
                s += `<h2 class="card-title">` + element.board_title + `</h2>`;
                s += `<div class="bottom-box">`;
                s += `<a class="btn-btn-primary" onclick="location.href='/board/detail?board_num=`+element.board_num+`&currentPage=1'">더보기 ->`+`</a>`;
                s += `<div>`;
                s += `<button type="button" class="btn-btn-danger" onclick="blogFavoriteDelete(`+element.board_num+`)">삭제버튼</button>`;
                s += `</div>`;
                s += `</div>`;
                s += `</div>`;
                s += `</div>`;
                s += `</div>`;
            }
            $("#row2").append(s);
        }
    });

    $.ajax({
        url: "/tour/markList",
        type: "post",
        success: function(data){
            let s = ``;
            for (let d of data) {
                s += `<div class="tourList">`;
                s += `<div class="tourListL col-sm-4">`;
                s += `<img class="db-pic" src="` + d.photo + `">`;
                s += `</div>`;
                s += `<div class="tourListR col-sm-6">`;
                s += `<p>` + d.title + `</p>`;
                s += `<p>` + d.addr + `</p>`;
                s += `<p>`;
                s += `<a href="` + d.link + `">`+ d.link + `</a>`;
                s += `</p>`;
                s += `<p>` + d.phone_num + `</p>`;
                s += `</div>`;
                s += `<div class="col-sm-2" style="display: flex; justify-content: flex-end;">`;
                s += `<button class="myPageTourFav" type="button" onclick="myPageTourMarkDelete(`+d.serial_num+`)">`;
                s += `<i class="bi bi-star-fill" style="color: #fce61b"></i>`;
                s += `</button>`;
                s += `</div>`;
                s += `</div>`;
            }
            $("#tourFavorites").append(s);
        },
        error: function() {

        }
    });
});

function blogFavoriteDelete(board_num) {
    if (!board_num) {
        alert("유효하지 않은 board_num 값입니다.");
        return;
    }
    fetch(`/bit/delmark?board_num=${board_num}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        credentials: 'same-origin'
    })
        .then(response => {

            if (response.ok) {
                window.location.reload();
            } else {
                alert("오류가 발생했습니다. 다시 시도해 주세요.");
            }
        })
        .catch(error => {
            alert("오류가 발생했습니다. 다시 시도해 주세요.");
        });
}

function blogLike(board_num) {
    if (!board_num) {
        alert("유효하지 않은 board_num 값입니다.");
        return;
    }
    fetch(`/bit/blog/like?board_num=${board_num}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        credentials: 'same-origin'
    })
        .then(response => {
            if (response.ok) {
                alert("좋아요가 반영되었습니다.");
            } else {
                alert("오류가 발생했습니다. 다시 시도해 주세요.");
            }
        })
        .catch(error => {
            alert("오류가 발생했습니다. 다시 시도해 주세요.");
        });
}

function myPageTourMarkDelete(serial_num) {
    let formData = {"serial_num" : serial_num};
    $.post({
        url : "/tour/delete",
        data : JSON.stringify(formData),
        contentType : 'application/json; charset=utf-8',
        success : function(d) {
            window.location.reload();
        }
    });
}

function myPageLoad(num) {
    if (num == 1) {
        document.getElementById("row1").style.display = "flex";
        document.getElementById("row2").style.display = "none";
        document.getElementById("row3").style.display = "none";
    } else if (num == 2) {
        document.getElementById("row1").style.display = "none";
        document.getElementById("row2").style.display = "flex";
        document.getElementById("row3").style.display = "none";
    } else if (num == 3) {
        document.getElementById("row1").style.display = "none";
        document.getElementById("row2").style.display = "none";
        document.getElementById("row3").style.display = "flex";
    }
}
