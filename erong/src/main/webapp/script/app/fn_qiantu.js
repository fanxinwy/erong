//标签切换
$(".tap-label li").live("click", function () {
    $(this).siblings("li").removeClass("current");
    $(this).addClass("current");
    $(this).closest(".tap-label").siblings(".labelContent").hide();
    $(this).closest(".tap-label").siblings(".labelContent").eq($(this).attr("value") - 1).show();
});
//浮动客服
function InitFloatTips() {
    var tips = document.getElementById('divQQbox');
    if (tips == null) { return false; }
    $(tips).show();
    var theTop = 160/*这是默认高度,越大越往下*/;
    var old = theTop;
    var timerID;
    var thisNum = 0;
    var nextNum;
    var bigNum = $(".num ul").children().length - 1;
    var tt = 50;
    if (window.innerHeight) {
        pos = window.pageYOffset
    } else if (document.documentElement && document.documentElement.scrollTop) {
        pos = document.documentElement.scrollTop
    } else if (document.body) {
        pos = document.body.scrollTop;
    }
    pos = pos - tips.offsetTop + theTop;
    pos = tips.offsetTop + pos / 10;
    if (pos < theTop) pos = theTop;
    if (pos != old) {
        tips.style.top = pos + "px";
        tt = 10;
    }
    old = pos;
    setTimeout(InitFloatTips, tt);
}
//自定义弹出窗口
$("[open_win]").live("click", function () {
    var w_id = $(this).attr("open_win");
    var position = parseInt($(this).attr("open_win_position"));
    if (position && position != 0) {
        var offset = $(this).offset();
        var myHeight = $(this).height();
        $("#" + w_id).css({ top: offset.top + myHeight + position }).show();
    }
    else {
        $("#" + w_id).show();
        if (w_id == "win_Intention") {
            $("#hklist").show();
            $("#plsuccesstip").hide();
        }
    }
    $(".blackBg").show();
});
//右上角关闭按钮
$("[close-ui]").live("click", function () {
    $("#" + $(this).attr("close-ui")).hide();
    $(".blackBg").hide();
});
//解释标签
$("[jieshi]").live("mouseover", function (e) {
    var postX = e.pageX;
    var postY = e.pageY;
    var myText = $(this).attr("alt");
    var p = $(this).attr("jieshi"),
        px = parseInt(p.split(',')[0]) || 0,
        py = parseInt(p.split(',')[1]) || 0;
    $(".mouseTips").html(myText + "<i></i>");
    $(".mouseTips").css({ "left": postX + px, "top": postY + py }).show();
})
$("[jieshi]").live("mouseout", function () {
    $(".mouseTips").hide();
});
//首页列表背景色切换
$(".project-list li").live("mouseover", function () {
    $(this).addClass("current")
});
$(".project-list li").live("mouseout", function () {
    $(this).removeClass("current")
});
//列表页行背景色切换
$(".project-item").live("mouseover", function () {
    $(this).addClass("current")
});
$(".project-item").live("mouseout", function () {
    $(this).removeClass("current")
});