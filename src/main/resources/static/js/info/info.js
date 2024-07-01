$(window).keydown(function(e) {
    key = (e.keyCode) ? e.keyCode : e.which;
    $('.key.c' + key).addClass('keydown');

});

$(window).keyup(function(e) {
    key = (e.keyCode) ? e.keyCode : e.which;
    $('.key.c' + key).removeClass('keydown');
});
