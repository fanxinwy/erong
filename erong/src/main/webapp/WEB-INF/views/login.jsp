<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String account = (String) session.getAttribute("$token");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
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
            <a href="index.html" target="_blank">
                <img title="{{name}}" alt="{{name}}" src="content/images/logo.png"></a></div>
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

<script type="text/javascript" src="script/app/loginform.js"></script>
<link rel="stylesheet" type="text/css" href="content/css/login.css">
<style type="text/css">
    .auto-tip {
        width: 252px;
        left: 48px;
    }

    .auto-tip li {
        height: 22px;
        line-height: 22px;
        font-size: 12px;
        padding-left: 10px;
    }

    .auto-tip li b {
        font-weight: 400;
    }

    .auto-tip li.hoverBg {
        background: #ddd;
        cursor: pointer;
        background: #cee7ff;
    }

    .hidden {
        display: none;
    }
</style>


<form action="./登录_files/登录.htm" method="post">
    <div class="warp">
        <div class="container">
            <div class="ui-content">

                <div class="login-wrap w-980">
                    <div class="login login-bg">
                        <div class="ui-form w-305 f-right">
                            <div class="ui-form-item lg-username" id="txtUsernameP">
                                <span class="login-note login-note-focus" id="loginNoteUserName" style="top: -14px;">手机号码</span>
                                <input id="loginUserName" type="text" maxlength="11" autocomplete="off"
                                       qiantu_txtusername="Qiantu" l_type="0"
                                       class="ui-input w-300 login-ui-input on-foucs" name="UserName"
                                       validate="{account:true,required:true,noteq:true,messages:{account:&#39;请输入您的手机号&#39;,required:&#39;请输入您的手机号&#39;,noteq:&#39;请输入您的手机号&#39;}}">
                            </div>
                            <div class="ui-form-item lg-password">
                                <span class="login-note" id="loginNotePwd">输入密码</span>
                                <input id="loginPassword" name="Pwd" maxlength="16" qiantu_txtpwd="Qiantu"
                                       type="password" class="ui-input  w-300 login-ui-input on-foucs"
                                       validate="{required:true,messages:{required:&#39;请填写密码&#39;}}">
                            </div>
                            <div id="show_error" show_error="Qiantu" style="display: none;"></div>
                            <p class="ui-form-other ui-form-other-fg">

                                <a target="_blank" href="https://e.ydnsh.com/Account/FindPwdBack"
                                   class="textlink forgot f-right">忘记密码？</a></p>

                            <div class="ui-form-item">
                                <input type="button" tabindex="4" qiantu_btnlogin="Qiantu" l_type="0" id="btnLogin"
                                       class="ui-button lg-submit-btn" value="登  录">

                                <p class="lg-form-other">
                                    没有帐号，<a title="免费注册" target="_blank" href="https://e.ydnsh.com/Account/Register"
                                            class="textlink">快来注册</a>吧！</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
    $("body").attr("class", "gray-bg");
    $(document).keyup(function (e) {
        if (e.keyCode == 13) {
            $("#btnLogin").click();

        }
    })

    $(function () {
        if ($("#loginUserName").val() != "") {
            $("#loginUserName").siblings(".login-note").animate({top: "-14px"}, 300)
            $("#loginUserName").siblings(".login-note").addClass("login-note-focus")
        }
        if ($("#loginPassword").val() != "") {
            $("#loginPassword").siblings(".login-note").animate({top: "-14px"}, 300)
            $("#loginPassword").siblings(".login-note").addClass("login-note-focus")
        }

    });

    $(".login-note").click(function (e) {
        e.stopPropagation()
        $(this).animate({top: "-14px"}, 300)
        $(this).addClass("login-note-focus")
        $(this).siblings(".ui-input").focus();
    })

    $("#loginUserName,#loginPassword").focus(function (e) {
        e.stopPropagation()
        $(this).siblings(".login-note").animate({top: "-14px"}, 300)
        $(this).siblings(".login-note").addClass("login-note-focus")
    })

    $("#loginUserName").blur(function (e) {
        var loginUserValue = $("#loginUserName").val();
        if (loginUserValue == "") {
            $("#loginNoteUserName").animate({top: "8px"}, 300)
            $("#loginNoteUserName").removeClass("login-note-focus")
        }
    })

    $("#loginPassword").blur(function (e) {
        var loginPwdValue = $("#loginPassword").val();
        if (loginPwdValue == "") {
            $("#loginNotePwd").animate({top: "8px"}, 300)
            $("#loginNotePwd").removeClass("login-note-focus")
        }
    })
</script>


<div class="mod-footer">
    <div class="footer-wrap">
        <div class="ui-guide">

            <dl class="ui-guide-item f-left">
                <dt>
                    <img src="./登录_files/footer2.gif" alt="关于尧都农商银行"></dt>
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
                    <img src="./登录_files/footer3.gif" alt="关于尧都农商银行"></dt>
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
                                <img alt="尧都银行微信二维码" src="./登录_files/ewm.png"></b>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="copyright">
            <p>
                <img src="./登录_files/qthl_logo.png" alt="前途互联"></p>

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
    <img src="./登录_files/backTop.png"></a>
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