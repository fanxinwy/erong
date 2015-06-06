<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String account = (String) session.getAttribute("$token");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注册－设置密码</title>
    <link rel="stylesheet" type="text/css" href="content/css/public.css">
    <link rel="stylesheet" type="text/css" href="content/css/header_footer.css">
    <script type="text/javascript" src="script/lib/jquery-1.4.4.min.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/lib/json2.min.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/lib/jquery.extend.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/lib/jquery.tmpl.min.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/lib/jquery.metadata.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/lib/jquery.validate.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/app/UcsValidate.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/app/Common.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/app/fn_qiantu.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/app/OperateTip.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/app/easing.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/app/util/validate/formValidator-4.1.3.min.js?ucsv=1.1.1"></script>
    <script type="text/javascript" src="script/app/util/validate/formValidatorRegex.js?ucsv=1.1.1"></script>
</head>
<body class="gray-bg">

<div class="login-header-top">
    <div class="header-wrap login-header w-980">
        <div class="logo f-left">
            <a href="/" target="_blank">
                <img title="尧都农商银行" alt="尧都农商银行" src="content/images/logo.png"></a><a href="/"><img
                title="尧都农商银行" alt="尧都农商银行" src="content/images/logo_1.png"></a></div>
        <div class="header-top-right">
            <ul>
                <li><a href="https://e.ydnsh.com/FAQ/introduction">帮助中心</a></li>
<%if (account != null) {%>
                <li><span>|</span>您好，<a href="/Center" class="blue"><%=account%>
                </a>
                    <a href="user/logout">退出</a></li>
                <%} else {%>
                <li>
                    <input type="button" value="登录" class="ui-btn-1"/></li>
                <li>
                    <input type="button" value="注册" class="ui-btn-2"/></li>
                <%}%>
            </ul>
            <div class="clear">
            </div>
            <p>
                <i></i><b>客服专线：</b><span>400-04-96518</span></p>
        </div>
    </div>
</div>

<script type="text/javascript" src="script/app/jquery.validate.init.js"></script>
<link rel="stylesheet" type="text/css" href="content/css/login.css">
<script>
    $("body").toggleClass("gray-bg");
</script>

<div class="warp">
    <div class="container w-980">

        <div class="reg">
            <h3 class="reg_tt1">
            </h3>
            <div id="regbmg">
                <form id="aregister">
                    <ul>
                        <li>
                            <label>
                                用 户 名：
                            </label>
                            <input id="username" name="username" type="text" value="">
                            <span class="userb" id="username_notice" style="line-height:50px"><img class="ntmg" src="../../files/img/tipimg-y.png">请输入4-12位英文,数字或不超过6个汉字 </span>
                        </li>
                        <li>
                            <label>
                                密　　码：
                            </label>
                            <input id="firstpwd" name="password" type="password" value="">
                        <span class="firstpwdb" id="password_notice" style="line-height:50px">
                        </span>
                        </li>
                        <li>
                            <label>
                                确认密码：
                            </label>
                            <input id="checkpwd" name="confirm_password" type="password" value="">
                        <span class="checkpwdb" id="conform_password_notice" style="line-height:50px">
                        </span>
                        </li>
                        <li>
                            <label>
                                手机号码：
                            </label>
                            <input id="customphone" name="phone" type="text" value="">
                        <span class="phoneb" id="phone_notice" style="line-height:50px">
                        </span>
                        </li>
                        <li>
                            <label>
                                推荐人：
                            </label>
                            <input id="invite_username" name="invite_username" type="text" size="22" value="" maxlength="60">
                        <span class="nameb" id="realname_notice" style="line-height:50px">
                        </span>
                        </li>
                        <li>
                            <label>
                                验 证 码：
                            </label>
                            <div class="fleft" style="padding-top:6px;">
                                <input name="valicode" id="valicode" type="text" size="11" maxlength="5" style="float:left;width:60px;" tabindex="3">
                                &nbsp;&nbsp;&nbsp;
                                <img src="http://www.wzdai.com/validimg.html?t=0.5109502871055156" alt="点击刷新" id="validmage" onclick="this.src='http://www.wzdai.com/validimg.html?t=' + Math.random();" align="absmiddle" style="cursor: pointer; float: left;">
                            </div>
                        <span id="yz_notice" style="line-height:50px">
                        </span>
                        </li>
                        <li class="formBtn">
                            <input style="margin:16px 8px 0 0;" id="dianji" name="" type="checkbox" value="" checked="checked">
                            <font>
                                我已阅读并且同意
                                <a class="fontBlue" href="../../files/docdata/reg.doc">
                                    《温州贷服务协议》
                                </a>
                            </font>
                        </li>
                        <li class="formBtn">
                            <a id="gonext" href="javascript:;">
                                <input class="btnRed_F" id="zhuce" type="button" value="下一步">
                            </a>
                            <input type="hidden" name="actionType" value="register">
                            <input type="hidden" value="register">
                        </li>
                        <div class="security-pro">
                            <i class="ticons">
                            </i>
                            <b>
                                您的信息通过加密保护，数据传输安全
                            </b>
                        </div>
                    </ul>
                </form>
                <ul id="secondpager" style="display:none">
                    <li id="phoneli">
                        <label>
                            短信验证：
                        </label>
                        <input id="rephone" name="phone" type="text" value="" disabled="disabled">
                    <span class="phoneb1" id="phone_notice" style="line-height:50px">
                    </span>
                    </li>
                    <li class="snone" id="emailli">
                        <label>
                            　Email：
                        </label>
                    <span style="position:relative;">
                        <div id="mailListBox_0" class="justForJs out_box" style="min-width:242px;_width:242px;position:absolute;left:0; display:none;top:47px;z-index:1;">
                        </div>
                        <input id="customemail" name="email" type="text" value="">
                    </span>
                    <span class="emailb" id="email_notice" style="line-height:50px">
                    </span>
                    </li>
                    <li class="formBtn nextbg">
                        <a id="gonext" href="javascript:;">
                            <input class="btnRed_F" id="syazhen" type="button" value="下一步">
                        </a>
                    </li>
                    <li class="security-pro">
                        <b>您也可以<a class="bluea" id="changem">使用邮箱验证&gt;</a></b>
                    </li>
                    <div class="security-pro">
                        <i class="ticons">
                        </i>
                        <b>
                            您的信息通过加密保护，数据传输安全
                        </b>
                    </div>
                </ul>
            </div>
        </div>
        <div class="ui-content reg-bg4"></div>
</div>


<script>
    function password(v) {
        var length = v.value.length;
        if (length >= 12) {
            $(".ui-paw-pow span").attr("class", "ui-pow-1 ui-pow-2 ui-pow-3");
            $(".ui-paw-pow span").css("width", "100%");
            $(".ui-text").text("强度：强");
        }
        else if (length < 12 && length >= 9) {
            $(".ui-paw-pow span").attr("class", "ui-pow-1 ui-pow-2");
            $(".ui-paw-pow span").css("width", "66%");
            $(".ui-text").text("强度：中");
        }
        else if (length < 9) {
            $(".ui-paw-pow span").attr("class", "ui-pow-1");
            $(".ui-paw-pow span").css("width", "33%");
            $(".ui-text").text("强度：低");
        }
    }
    //    function idchange() {
    //        var v = $("input[name='IDcard']").val();
    //        var length = v.length;
    //        var idstr = "";
    //        var mod = length % 4;
    //        if (length <= 4) { idstr = v; } else {
    //            for (var i = 0; i < v.length / 4; i++) {
    //                var t = (i * 4);
    //                if (((length / 4) - i) >= 1) {
    //                    idstr += v[t + 0] + v[t + 1] + v[t + 2] + v[t + 3]+" ";
    //                } else {
    //                for (var j = 0; j < mod; j++) {
    //                    idstr += v[t + j];
    //                }

    //                }

    //            }
    //        }
    //    $(".enlarge-text").text(idstr);
    //    }

    function idchange() {
        var v = $("input[name='IDcard']").val();

        $(".enlarge-text").text(v);
    }
</script>


<div class="mod-footer">
    <div class="footer-wrap">
        <div class="ui-guide">

            <dl class="ui-guide-item f-left">
                <dt>
                    <img src="content/images/footer2.gif" alt="关于尧都农商银行"></dt>
                <dt>平台介绍</dt>
                <dd>
                    <a href="https://e.ydnsh.com/FAQ/introduction" target="_blank">平台简介</a></dd>
                <dd>
                    <a href="https://e.ydnsh.com/FAQ/Common?isNoun=1" target="_blank">名词解释</a></dd>
                <dd>
                    <a href="https://e.ydnsh.com/FAQ/directive_title" target="_blank">安全保障</a></dd>
            </dl>
            <dl class="ui-guide-item f-left">
                <dt>
                    <img src="content/images/footer3.gif" alt="关于尧都农商银行"></dt>
                <dt>操作指引</dt>
                <dd>
                    <a href="https://e.ydnsh.com/FAQ/Login" target="_blank">注册登录</a></dd>
                <dd>
                    <a href="https://e.ydnsh.com/FAQ/tz_operating" target="_blank">投资指引</a></dd>
                <dd>
                    <a href="https://e.ydnsh.com/FAQ/rz_operating" target="_blank">融资指引</a></dd>
            </dl>
            <div class="f-left footer-contact">
                <table width="140" cellspacing="0" cellpadding="0" border="0">
                    <tbody>
                    <tr>
                        <td height="24" valign="middle">
                            平台运营商服务热线：
                        </td>
                    </tr>
                    <tr>
                        <td height="24" valign="middle">
                            400-100-1008
                        </td>
                    </tr>
                    <tr>
                        <td height="24" valign="middle">
                            <p>
                                平台服务信箱：</p>
                        </td>
                    </tr>
                    <tr>
                        <td height="24" valign="middle">
                            service@ucsmy.com
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="f-left footer-contact">
                <table width="170" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td height="30" valign="top">
                            微信二维码
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" colspan="2">
                            <b class="icon_ewm">
                                <img alt="尧都银行微信二维码" src="content/images/ewm.png"></b>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="copyright">
            <p>
                <img src="content/images/qthl_logo.png" alt="前途互联"></p>

            <p class="company-name">
                晋ICP备11001340号</p>
            <br>

            <p style="color: #666;">
                客服专线：<span style="font-size: 18px;">400-04-96518</span></p>

            <p style="color: #666;">
                人工服务时间：8:00-22:00</p>

            <p style="color: #666;">
                客服信箱：hlwjr@ydnsh.com</p>
        </div>
    </div>
</div>
<a href="javascript:void(0)" id="scrolltop" style="right: 0px; bottom: 0px; position: fixed;
        display: none" class="backTop">
    <img src="content/images/backTop.png"></a>
<script type="text/javascript">
    $(function () {
        //返回到顶部
        $(window).scroll(function () {
            var top = $(window).scrollTop();
            if (top > 500) {
                $("#scrolltop").fadeIn();
            } else {
                $("#scrolltop").fadeOut();
            }
        });
        InitFloatTips();
    });
    //浮动
    $("#scrolltop").click(function () {
        $("html,body").animate({scrollTop: 0});
    });
</script>


</body>
</html>