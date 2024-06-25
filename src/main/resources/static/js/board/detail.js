$(function (){
    answer_list();
    $("#btnansweradd").click(function () {
        let num = boardNum;
        let content = $("#acontent").val();
        if (content == '') {
            alert("댓글을 입력후 등록해주세요");
            return;
        }

        $.ajax({
            type: 'post',
            dataType: 'json',
            url: "./ainsert",
            data: {"num": num, "content": content},
            success: function () {
                answer_list();
                $("#acontent").val("");
            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });

    $(document).on("click", ".adel", function () {
        let aidx = $(this).attr("aidx");
        let a = confirm("해당 댓글을 삭제할까요?");
        if (a) {
            $.ajax({
                type: "get",
                dataType: "text",
                data: {"aidx": aidx},
                url: "./adelete",
                success: function () {
                    answer_list();
                },
                error: function (request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            })
        }
    });

    $('#likeBtn').click(function() {
        let userId = sessionLoginId;
        let userIdok = sessionLoginOk;
        console.log(userId);
        console.log(userIdok);
        if(userId == ""){
            alert("로그인하세요");
        }
        else{
            $.ajax({
                url: '${pageContext.request.contextPath}/board/like',
                type: 'POST',
                data: {
                    board_num: boardNum,
                    user_id: userId
                },
                success: function(response) {
                    if (response.success) {
                        console.log(response.success);
                        $('#likeCount').text(response.board_like);
                    } else if(response.success === 0){
                        alert('한 유저당 3번까지만 좋아요를 누를 수 있습니다.');
                    }
                },
                error: function(xhr, status, error) {
                    alert('한 유저당 3번까지만 좋아요를 누를 수 있습니다.');
                    console.error('좋아요 요청 실패:', status, error);
                }
            });
        }
    });
});

function answer_list() {
    let num = boardNum;
    let loginok = sessionLoginOk;
    let loginid = sessionLoginId;

    $.ajax({
        type: "get",
        dataType: "json",
        data: {"num": num},
        url: "./alist",
        success: function (data) {
            $(".answercount").text(data.length);
            let s = "";
            s += `<div class="reply-num"><h2>`+ data.length +`개의 리뷰</h2></div>`;
            $.each(data, function (idx, ele) {
                s += `<div class="post-reply-box">
                        <div class="post-reply">
                            <h5>(${ele.user_id})</h5>작성일 : <span class="aday">${ele.writeday}</span>`;
                if (loginok == 'yes' && loginid == ele.user_id) {
                    s += `<i class="bi bi-trash adel" aidx="${ele.aidx}" style="cursor:pointer;"></i>`;
                }
                s += `<div class="content"><p>${ele.content}</p></div><button type="button" class="post-reply-button">답글</button>
                        </div>
                    </div>`;
            });
            $(".answerlist").html(s);
        },
        error: function (request, status, error) {
            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    })
}
