<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String account = (String) session.getAttribute("$token");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>{{title}}</title>
    <meta content="{{keywords}}" name="keywords"/>
    <meta content="{{description}}" name="description"/>
    <link rel="stylesheet" type="text/css" href="content/css/public.css?ucsv=1.1.1"/>
    <link rel="stylesheet" type="text/css" href="content/css/header_footer.css?ucsv=1.1.1"/>
    <!--[if lte IE 7]>
    <style type="text/css">
        html .jqueryslidemenu {
            height: 1%;
        }

        /* Holly Hack for IE7 and below */
    </style>
    <![endif]-->
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

<body>
<!--头部-->
<!--logo及主导航-->
<div class="header header-bg">
    <div class="header-wrap" ng-controller="common">
        <div class="logo f-left">
            <a href="http://www.ydnsh.com/" target="_blank">
                <img title="{{name}}" alt="{{name}}" src="content/images/logo.png"></a></div>
        <div class="header-top-right">
            <ul>
                <li><a href="FAQ/introduction">帮助中心</a></li>
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
    <div id="main-nav">
        <ul>
            <li class="mainNav-item current" nav="首页"><a href="">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a></li>
            <li class="mainNav-item" nav="我要投资"><a href="list.html">我要投资</a></li>
            <li class="mainNav-item" nav="我要借款"><a id='a_gojiekuan' href="Loan"
                                                   action-data="window_4||ui-window-1||400||250" class="openWindow">
                我要借款</a></li>
            <li class="mainNav-item" nav="账户中心"><a href="Center">账户中心</a>
                <ul class="sub-mainNav">
                    <li><a href="Center">我的账户</a></li>
                    <li><a href="Center/BaseInfo">账号设置</a></li>
                    <li><a href="MsgCenter">消息提醒</a></li>
                </ul>
            </li>
            <!--<li class="mainNav-item"><a href="关于我们-建设中.html">关于我们</a></li>-->
        </ul>
    </div>
</div>
<!--头部结束-->
<script type="text/javascript">
    $(function () {
        var nav = "首页";
        $("#main-nav").find("li").removeClass("current");
        $("#main-nav").find("[nav=" + nav + "]").addClass("current");

        $(".mainNav-item").mouseover(function () {
            $(this).addClass("current")
            $(this).find(".sub-mainNav").show()
        })
        $(".mainNav-item").mouseout(function () {
            if ($(this).attr("nav") == nav) return;
            $(this).removeClass("current")
            $(this).find(".sub-mainNav").hide()
        })
    })
</script>

<link rel="stylesheet" type="text/css" href="content/css/index.css?ucsv=1.1.1"/>

<script type="text/javascript" src="script/app/loginform.js?ucsv=1.1.1"></script>
<script type="text/javascript">
    $(function () {
        /*切换动画*/
        var timerID = setInterval(AutoPlay, 4000);
        //切换动画代码结束
        var total = $(".project-list li").length;
        for (i = 1; i < total; i++) {
            $(".project-list").children("li").eq((i * 3 - 1)).css("margin-right", 0);
        }

        $(".num").find("li").live("click", function () {
            var thisNum = parseInt($(".num").find(".current").attr("value")) - 1,
                    clickNum = parseInt($(this).attr("value")) - 1;
            if (thisNum == clickNum)
                return;
            $(".banner-item").fadeOut(500);
            $(".banner-item").eq(clickNum).fadeIn(500);
            $(this).siblings("li").removeClass("current");
            $(this).addClass("current");
        });
        $(".banner-wrap").live("mouseout", function () {
            timerID = setInterval(AutoPlay, 4000)
        });
        $(".banner-wrap").live("mouseover", function () {
            clearInterval(timerID);
        });

    })
    function AutoPlay() {
        var thisNum = parseInt($(".num").find(".current").attr("value")) - 1,
                nextNum = thisNum + 1,
                bigNum = $(".num").find("li").length - 1;
        if (thisNum == bigNum) {
            nextNum = 0;
        }
        $(".banner-item").eq(thisNum).fadeOut(500);
        $(".banner-item").eq(nextNum).fadeIn(500);
        $(".num").find("li").removeClass("current");
        $(".num").find("li").eq(nextNum).addClass("current");
    }
</script>
<!--登录框-->
<style type="text/css">
    .auto-tip {
        width: 188px;
        left: 38px;
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
<div class="login-wrap">
    <%if (account == null) {%>
    <div class="login ui-index-login">
        <div class="ui-form">
            <div class="index-login-error" show_error="Qiantu">
                <em class="iconfont"></em><span id="msgShow" class="error-text"></span>
            </div>
            <div class="ui-form-item lg-username">
                <div class="ui-input-box" id="txtUsernameP">
                    <div class="ui-tip" id="UserNameNote">
                        手机号码
                    </div>
                    <input type="text" autocomplete="off" qiantu_txtusername="Qiantu" id="UserName" l_type="1"
                           class="ui-input lg-input-normal"/>
                </div>
            </div>
            <div class="ui-form-item lg-password">
                <div class="ui-input-box">
                    <div class="ui-tip" id="UserPwdNote">
                        输入密码
                    </div>
                    <input type="password" qiantu_txtpwd="Qiantu" class="ui-input lg-input-pw" id="UserPwd"/>
                </div>
            </div>
            <p class="ui-form-other ui-form-other-fg">
                <a target="_blank" href="Account/FindPwdBack" class="textlink forgot blue">
                    忘记密码？</a></p>

            <div class="ui-form-item">
                <input type="button" qiantu_btnlogin="Qiantu" l_type="1" tabindex="4" id="btnLogin"
                       class="ui-button lg-submit-btn" value="登 录"/>
            </div>
            <p class="lg-form-other">
                没有账号？<a title="免费注册" target="_blank" href="Account/Register" class="textlink register blue">免费注册</a></p>
        </div>
    </div>
    <%} else {%>
    <div class="login ui-index-login logged">
        <div class="ui-form">
            <p class="user-name">
                预计到期赚取：</p>

            <p class="money">
                ￥<b class="num">0</b><span>.00</span>&nbsp;元</p>

            <div class="ui-form-item">
                <input type="button" tabindex="4" class="ui-button lg-submit-btn" value="查看我的资产"
                       onclick="window.location.href='/Center'">
            </div>
        </div>
    </div>
    <%}%>

    <script type="text/javascript">
        $(".ui-tip").click(function (e) {
            e.stopPropagation()
            $(this).animate({top: "-12px"}, 300)
            $(this).addClass("ui-tip-focus")
            $(this).siblings(".ui-input").focus();
        })

        $("#UserName,#UserPwd").focus(function (e) {
            e.stopPropagation();
            $(this).siblings(".ui-tip").animate({top: "-12px"}, 300);
            $(this).siblings(".ui-tip").addClass("ui-tip-focus");
        })

        $("#UserName").blur(function (e) {
            var loginUserValue = $("#UserName").val();
            if (loginUserValue == "") {
                $("#UserNameNote").animate({top: "8px"}, 300)
                $("#UserNameNote").removeClass("ui-tip-focus")
            }
        })

        $("#UserPwd").blur(function (e) {
            var loginPwdValue = $("#UserPwd").val();
            if (loginPwdValue == "") {
                $("#UserPwdNote").animate({top: "8px"}, 300)
                $("#UserPwdNote").removeClass("ui-tip-focus")
            }
        })
    </script>
</div>
<script type="text/javascript">
    window.onkeyup = function (e) {
        if (e.keyCode == 13) {
            $("#btnLogin").click();

        }
    }
</script>

<!--登录框结束-->
<!--banner-->
<div class="banner-wrap">
    <div class="banner">
        <div class="banner-item" style="left: 0; display: block;">
            <a href="javascript:void(0)" title="">
                <div class="inner"
                     style="background: url(https://files.wefax.cn/Upload/YaoDu/0/20141225/0-20141225-1743296526-0.jpg) center 0 no-repeat;">
                </div>
            </a>
        </div>
        <div class="banner-item" style="left: 0; display: none;">
            <a href="javascript:void(0)" title="">
                <div class="inner"
                     style="background: url(https://files.wefax.cn/Upload/YaoDu/0/20141128/0-20141128-1615489254-0.jpg) center 0 no-repeat;">
                </div>
            </a>
        </div>
        <div class="banner-item" style="left: 0; display: none;">
            <a href="javascript:void(0)" title="首页焦点图">
                <div class="inner"
                     style="background: url(https://files.wefax.cn/Upload/YaoDu/0/20141031/0-20141031-1555358182-0.jpg) center 0 no-repeat;">
                </div>
            </a>
        </div>
        <div class="num">
            <ul>
                <li value="1" class="current"><a href="javascript:void(0)"></a></li>
                <li value="2"><a href="javascript:void(0)"></a></li>
                <li value="3"><a href="javascript:void(0)"></a></li>
            </ul>
        </div>
    </div>
</div>
<!--banner结束-->
<!--主体-->
<div class="warp">
    <div class="container">
        <div class="ui-content">
            <!--新闻公告-->
            <div class="module">
                <div class="mod-wrap mod-hot-news">
                    <div class="mod-contnet">
                        <ul class="mod-list news-list">
                            <img src="content/images/icon_notice.gif" title="" alt="" class="f-left news-notice"/>
                            <li><a href="javascript:void(0)" class="openWindow"
                                   action-data="win_GongGao||ui-window-1||400||250">
                                <b>生钱树投资理财平台温馨说明</b> </a><span class="news-time">2014-10-30</span><img
                                    src="content/images/icon_new.gif" title="" alt=""/>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--新闻公告结束-->
            <!--服务特点-->
            <div class="module">
                <div class="mod-wrap mod-service">
                    <div class="mod-contnet">
                        <ul class="mod-list">
                            <li class="cell-item"><i class="cell-item-icon">
                                <img name="" src="content/images/icon_td_4.png" alt=""/></i>

                                <h3 class="cell-item-title">
                                    收益率高</h3>

                                <p class="cell-item-content">
                                    预期年化收益率6%-9%</p>
                            </li>
                            <li class="cell-item"><i class="cell-item-icon">
                                <img name="" src="content/images/icon_td_3.png" alt=""/></i>

                                <h3 class="cell-item-title">
                                    投资门槛低</h3>

                                <p class="cell-item-content">
                                    最低1000元即可起投</p>
                            </li>
                            <li class="cell-item"><i class="cell-item-icon">
                                <img name="" src="content/images/icon_td_2.png" alt=""/></i>

                                <h3 class="cell-item-title">
                                    操作方便</h3>

                                <p class="cell-item-content">
                                    操作简单方便24小时在线投标</p>
                            </li>
                            <li class="cell-item" style="border: 0px;"><i class="cell-item-icon">
                                <img name="" src="content/images/icon_td_1.png" alt=""/></i>

                                <h3 class="cell-item-title">
                                    不限银行</h3>

                                <p class="cell-item-content">
                                    支持各家商业银行借记卡投标</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--服务特点结束-->
            <!--统计数字-->
            <div class="module">
                <div class="mod-wrap mod-totalNumber" ng-controller="summary">
                    <p>
                        <span class="cell-num">累计交易金额：<b>￥{{amount}}元</b></span>
                        <span class="cell-num">参与投标人数：<b>{{entrynum}}人</b></span> <a href="javascript:void(0)"
                                                                                     class="cell-button"
                                                                                     open_win="win_Intention"
                                                                                     open_win_position="0">我有投资意向</a>
                    </p>
                </div>
            </div>
            <!--统计数字结束-->
            <div class="module">
                <!--项目列表-->
                <div class="mainBar">
                    <div class="mod-wrap mod-project">
                        <h2 class="mod-title">
                            <span>投资推荐</span></h2>

                        <div class="mod-contnet">
                            <ul class="tap-label project-tab">
                                <li class="current" value="1"><a href="javascript:void(0)" class="jieshi"
                                                                 alt="平台所有项目均由尧都农商银行推荐，并对融资方信息进行审核。">
                                    银行项目</a></li>

                            </ul>
                            <ul style="display: block" ng-controller="p2pList" class="labelContent project-list"
                                id="labelContent">
                                <li ng-repeat="item in items">
                                    <div class="project-title" title="{{item.text}}【{{item.id}}】">
                                        <a class="ui-icon-bank" href="">
                                            <img alt="" src="content/images/{{item.image}}" name="" width="65px"
                                                 height="60px"/></a>

                                        <h3>
                                            <span open_win="window_2" open_win_position="0" style="cursor: pointer;">e融安稳融资项目【TY20150002】</span>
                                        </h3>

                                        <p class="pro-icon">
                                                    <span alt="尧都农商银行作为项目见证机构，已对融资方信用等级评定，并对融资项目信息严格审核。" class="jieshi">
                                                        <img src="content/images/icon_z.png">
                                                    </span><span alt="该项目委托第三方支付公司-中金支付有限公司提供资金监管和清算服务。" class="jieshi">
                                                        <img src="content/images/icon_w.png">
                                                    </span>
                                        </p>
                                    </div>
                                    <div class="project-contnet">
                                        <p class="pro-rate">
                                            <em>{{item.income}}</em>%</p>

                                        <p class="pro-rate-name">
                                            预期收益率</p>

                                        <p class="pro-att">
                                            发行规模:￥{{item.scale}}万</p>

                                        <p class="pro-att">
                                            项目期限:{{item.limit}}天</p>

                                        <div class="pro-button project-over">
                                            <span open_win="window_2" open_win_position="0">完&nbsp;&nbsp;成</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <ul class="labelContent project-list">
                            </ul>
                        </div>
                        <p class="other-label">
                            <a class="more" href="Home/List">更多项目&gt;&gt;</a></p>
                    </div>
                </div>
                <!--项目列表结束-->
                <div class="sideBar">
                    <!--投资3步曲-->
                    <div class="mod-wrap mod-invest-help">
                        <h2 class="mod-title">
                            <span>投资3步曲</span></h2>

                        <div class="mod-contnet">
                            <ul class="mod-list op-list">
                                <li><i class="cell-item-icon ui-icon-reg"></i>

                                    <p class="cell-item-content">
                                        注册会员</p>
                                </li>
                                <li><i class="cell-item-icon ui-icon-sel"></i>

                                    <p class="cell-item-content">
                                        选择项目</p>
                                </li>
                                <li style="padding: 0;"><i class="cell-item-icon ui-icon-pvw"></i>

                                    <p class="cell-item-content">
                                        查看收益</p>
                                </li>
                            </ul>
                            <div class="clear">
                            </div>
                            <ul class="mod-list adv-list">
                                <li><i class="cell-item-icon">
                                    <img name="" src="Content/images/help_icon_1.png" alt=""/></i>

                                    <h3 class="cell-item-title">
                                        安全保障</h3>

                                    <p class="cell-item-content">
                                        项目及融资方经专业机构见证，交易记录可追踪。</p>
                                </li>
                                <li><i class="cell-item-icon">
                                    <img name="" src="Content/images/help_icon_2.png" alt=""/></i>

                                    <h3 class="cell-item-title">
                                        账户安全</h3>

                                    <p class="cell-item-content">
                                        平台采用先进加密技术，严格保密客户信息，第三方支付机构监控资金安全。</p>
                                </li>
                                <li><i class="cell-item-icon">
                                    <img src="Content/images/help_icon_3.png" alt=""/></i>

                                    <h3 class="cell-item-title">
                                        风险控制</h3>

                                    <p class="cell-item-content">
                                        融资方经专业机构信用等级评定，并对其融资项目资金兑付进行风险控制。</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--主体-->
<!--出资意向弹窗-->
<!--投资意向征集弹窗-->
<div class="prompt_box" id="win_Intention" style="display: none;">
    <div class="prompt_inner ck_1 ui-window-1" style="width: 360px; height: 400px; left: -180px;
        top: -200px;">
        <h3 class="title">
            <span class="ico_1">出资意向征集</span><a href="javascript:void(0)" class="close" close-ui="win_Intention"></a>
        </h3>

        <div class="content">
            <div class="hk_list" id="hklist">
                <table border="0" cellspacing="0" cellpadding="0" class="table_5">
                    <tr>
                        <th>
                            <span class="red">*</span> 可投资金额：
                        </th>
                        <td>
                            <input type="text" id="txtCanInvestment" rtip="最低一千" size="20" class="textFild mR"
                                   maxlength="18"/>
                            元
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span class="red">*</span> 期望年化收益率：
                        </th>
                        <td>
                            <input type="text" id="txtExpectYearInterest" rtip="请输入期望年化收益率" size="20"
                                   class="textFild mR"/>
                            %以上
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span class="red">*</span> 投资期限：
                        </th>
                        <td>
                            <select id="ddlDurationString" class="selectBox mR">
                                <option>请选择</option>
                                <option>90天</option>
                                <option>180天</option>
                                <option>360天</option>

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span class="red">*</span> 联系人：
                        </th>
                        <td>
                            <input type="text" id="txtContact" rtip="请输入联系人" size="20" class="textFild" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span class="red">*</span> 手机号码：
                        </th>
                        <td>
                            <input type="text" id="txtMobile" rtip="请输入手机号码" size="20" class="textFild" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            E-mail：
                        </th>
                        <td>
                            <input type="text" id="txtEmail" rtip="请输入邮箱地址" size="20" class="textFild" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                        </td>
                        <td>
                            <div class="calculator_aniu" style="text-align: left; margin-top: 20px;">
                                <input type="button" value="提 交" onclick="ValidateSubmit()"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="ts" style="margin-top: 80px;" id="plsuccesstip">
                <img src="content/images/firm_info_34.png" align="absmiddle">&nbsp;&nbsp;<span style="font-size: 24px;">提交成功！</span><br>

                <p style="font-weight: 400; margin-top: 15px;">
                    我们将根据您的意向，筛选合适的项目并通知您，敬请留意。</p>
            </div>
        </div>
    </div>
</div>
<!--投资意向征集弹窗结束-->

<script type="text/javascript">
    $(function () {
        InitRTip();
    });

    function ValidateSubmit() {

        var txtCanInvestment = $("#txtCanInvestment"),
                txtExpectYearInterest = $("#txtExpectYearInterest"),
                ddlDuration = $("#ddlDurationString"),
                txtContact = $("#txtContact"),
                txtMobile = $("#txtMobile"),
                txtEmail = $("#txtEmail");

        var investreg = /^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
        if (!investreg.test($.trim(txtCanInvestment.val()))) {
            alert("可投资金额格式错误，只保留两位小数！")
            txtCanInvestment.focus();
            return false;
        }
        if (parseFloat($.trim(txtCanInvestment.val())) < 1000) {
            alert("可投资金额最低一千！");
            txtCanInvestment.focus();
            return false;
        }
        if ($.trim(txtExpectYearInterest.val()) == "请输入期望年化收益率") {
            alert("请输入期望年化收益率!");
            txtExpectYearInterest.focus();
            return false;
        }

        if (!investreg.test($.trim(txtExpectYearInterest.val()))) {
            alert("收益率格式错误,只保留两位小数!");
            txtExpectYearInterest.focus();
            return false;
        }


        if (ddlDuration.get(0).selectedIndex == 0) {
            alert("请选择投资期限!");
            ddlDuration.focus();
            return false;
        }

        if ($.trim(txtContact.val()) == "请输入联系人" || $.trim(txtContact.val()) == "") {
            alert("请输入联系人！");
            txtContact.focus();
            return false;
        }

        var reg = /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|17[0-9])[0-9]{8}$/;
        if (!reg.test($.trim(txtMobile.val()))) {
            alert("该手机格式错误，请检查!");
            txtMobile.focus();
            return false;
        }

        var emailreg = /^([a-zA-Z0-9_]||.)+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])/;
        if ($.trim(txtEmail.val()) != "请输入邮箱地址") {
            if (!emailreg.test($.trim(txtEmail.val()))) {
                alert("该邮箱地址格式错误，请检查!");
                txtEmail.focus();
                return false;
            }
        }

        var submitData = {};
        submitData.targetAction = "AddInvestmentApply";

        submitData.CanInvestment = txtCanInvestment.val();
        submitData.ExpectYearInterest = txtExpectYearInterest.val();
        submitData.DurationString = ddlDuration.val();
        submitData.Contact = txtContact.val();
        submitData.Mobile = txtMobile.val();
        submitData.Email = txtEmail.val() == "请输入邮箱地址" ? "" : $.trim(txtEmail.val());

        $.ajax({
            url: 'Ajax/ProcessRequest',
            type: 'post',
            data: submitData,
            dataType: 'text',
            error: function (err) {
                alert("脚本执行异常，请刷新页面重试(ajax error)：" + err.statusText);
            },
            success: function (result) {
                var jsonResult = JSON.parse(result);
                if (jsonResult.IsSuccess == true) {
                    //每次进来都可以重复提交
                    txtCanInvestment.val("最低一千");
                    txtExpectYearInterest.val("请输入期望年化收益率");
                    ddlDuration.val("请选择");
                    txtContact.val("请输入联系人");
                    txtMobile.val("请输入手机号码");
                    txtEmail.val("请输入邮箱地址");
                    $("#hklist").hide();
                    $("#plsuccesstip").show();
                } else {
                    alert(jsonResult.Message);
                }
            }
        });
    }

</script>

<!--出资意向弹窗结束-->
<!--该页面主要为弹出层公用页面--->
<!--出资完成提醒开始--->
<script>
    function fillDownlist() {
        //填充银行下拉框
        $("body").append(" <input type='hidden' id='hidbankenum' value='&lt;option value=&#39;100&#39; text=&#39;中国邮政储蓄银行&#39; selected=&#39;selected&#39;&gt;中国邮政储蓄银行&lt;/option&gt;&lt;option value=&#39;102&#39; text=&#39;中国工商银行&#39; selected=&#39;selected&#39;&gt;中国工商银行&lt;/option&gt;&lt;option value=&#39;103&#39; text=&#39;中国农业银行&#39; selected=&#39;selected&#39;&gt;中国农业银行&lt;/option&gt;&lt;option value=&#39;104&#39; text=&#39;中国银行&#39; selected=&#39;selected&#39;&gt;中国银行&lt;/option&gt;&lt;option value=&#39;105&#39; text=&#39;中国建设银行&#39; selected=&#39;selected&#39;&gt;中国建设银行&lt;/option&gt;&lt;option value=&#39;301&#39; text=&#39;交通银行&#39; selected=&#39;selected&#39;&gt;交通银行&lt;/option&gt;&lt;option value=&#39;302&#39; text=&#39;中信银行&#39; selected=&#39;selected&#39;&gt;中信银行&lt;/option&gt;&lt;option value=&#39;303&#39; text=&#39;中国光大银行&#39; selected=&#39;selected&#39;&gt;中国光大银行&lt;/option&gt;&lt;option value=&#39;304&#39; text=&#39;华夏银行&#39; selected=&#39;selected&#39;&gt;华夏银行&lt;/option&gt;&lt;option value=&#39;305&#39; text=&#39;中国民生银行&#39; selected=&#39;selected&#39;&gt;中国民生银行&lt;/option&gt;&lt;option value=&#39;306&#39; text=&#39;广发银行&#39; selected=&#39;selected&#39;&gt;广发银行&lt;/option&gt;&lt;option value=&#39;307&#39; text=&#39;平安银行&#39; selected=&#39;selected&#39;&gt;平安银行&lt;/option&gt;&lt;option value=&#39;308&#39; text=&#39;招商银行&#39; selected=&#39;selected&#39;&gt;招商银行&lt;/option&gt;&lt;option value=&#39;309&#39; text=&#39;兴业银行&#39; selected=&#39;selected&#39;&gt;兴业银行&lt;/option&gt;&lt;option value=&#39;310&#39; text=&#39;上海浦东发展银行&#39; selected=&#39;selected&#39;&gt;上海浦东发展银行&lt;/option&gt;&lt;option value=&#39;422&#39; text=&#39;河北银行&#39; selected=&#39;selected&#39;&gt;河北银行&lt;/option&gt;&lt;option value=&#39;440&#39; text=&#39;徽商银行&#39; selected=&#39;selected&#39;&gt;徽商银行&lt;/option&gt;&lt;option value=&#39;1434&#39; text=&#39;尧都农村商业银行&#39; selected=&#39;selected&#39;&gt;尧都农村商业银行&lt;/option&gt;'>");
        $("#ddlBankName").html($("#hidbankenum").val());
    }
    $(function () {
        //初始化数据
        fillDownlist();

        //解释标签
        var myText = "";
        $(".jieshi").mousemove(function (e) {
            var postX = e.pageX;
            var postY = e.pageY;
            myText = $(this).attr("alt");
            $(".mouseTips").css({"left": postX - 10, "top": postY - 50, "display": "block"})
            $(".mouseTips").html(myText + "<i></i>");
        })
        $(".jieshi").mouseout(function () {
            $(".mouseTips").hide()
            $(".mouseTips").html(myText + "<i></i>");
        })
    });
</script>
<p class="mouseTips">
    <i></i>
</p>
<!--投标满标弹窗-->
<div class="prompt_box" id="win_FinaceClose" style="display: none;">
    <div class="prompt_inner ck_1" style="width:480px;height:250px;left:-200px;">
        <h3 class="title">
            生钱树投融资平台提示您<a href="javascript:void(0)" class="close" close-ui="win_FinaceClose"></a>
        </h3>

        <div class="content">
            <div style="margin-top: 10px;" class="ts">
                此项目已达到项目发行规模（满标），请选择其他项目投标。
            </div>
            <div style="margin-top: 5px; color: #666; text-align: center">
                如有疑问请致电“生钱树投融资平台”客服专线：<span class="red">400-04-96518</span>
            </div>
        </div>
    </div>
</div>
<!--投标完成弹窗结束-->
<!--投标完成弹窗-->
<div class="prompt_box" id="window_2" style="display: none;">
    <div class="prompt_inner ck_1" style="width:480px;height:250px;left:-200px;">
        <h3 class="title">
            生钱树投融资平台提示您<a href="javascript:void(0)" class="close" close-ui="win_FinaceClose"></a>
        </h3>

        <div class="content">
            <div style="margin-top: 10px;" class="ts">
                <img alt="" align="absmiddle" src="content/images/firm_info_34.png"/>&nbsp;&nbsp;项目已完成，出资人请进入"<a
                    target="_blank" href="Center">账户中心</a>"<br/>
                查阅过往出资记录及项目详情!
            </div>
            <div style="margin-top: 5px; color: #666; text-align: center">
                如有疑问请致电“生钱树投融资平台”客服专线：<span class="red">400-04-96518</span>
            </div>
        </div>
    </div>
</div>
<!--投标完成弹窗结束-->
<!--出资完成提醒结束--->
<!--添加银行卡弹窗-->
<form id="formbank">
    <div class="prompt_box" id="bankadd" style="top: 50%;">
        <div class="bank-add-box ui-window-2" style="width: 704px; left: -352px; top: -300px;">
            <h3 class="title">
                +添加银行卡<a href="javascript:void(0);" class="close" close-ui="bankadd"></a></h3>

            <div class="bank-add-title2">
                账户资料 <span class="red" style="font-size: 12px; margin-left: 15px;">您当前填写的银行账户将用于接收投资本金和利息，请认真填写以下内容，并确保其真实性。</span>
            </div>
            <div class="content">
                <table width="700" border="0" cellspacing="0" cellpadding="0" class="calculator-add">
                    <tr>
                        <td width="191" height="50" align="right" valign="middle">
                            <span class="red">*</span>户名：
                        </td>
                        <td width="473" align="left" valign="middle">
                            <input type="text" id="txtAccountName" size="20"/>

                            <div id="txtAccountNameTip">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="right" valign="middle">
                            <span class="red">*</span>账号：
                        </td>
                        <td align="left" valign="middle">
                            <input type="text" id="txtAccountNo" onpaste="return false" oncontextmenu="return false"
                                   size="20"/>

                            <div id="txtAccountNoTip">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="right" valign="middle">
                            <span class="red">*</span>确认账号：
                        </td>
                        <td align="left" valign="middle">
                            <input type="text" id="txtAgainAccountNo" onpaste="return false"
                                   oncontextmenu="return false"
                                   size="20"/>

                            <div id="txtAgainAccountNoTip">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="right" valign="middle">
                            <span class="red">*</span>开户行：
                        </td>
                        <td align="left" valign="middle">
                            <select style="width: 255px;" id="ddlBankName" class="f-left">
                                <option value='100' text='中国邮政储蓄银行' selected='selected'>中国邮政储蓄银行</option>
                                <option value='102' text='中国工商银行' selected='selected'>中国工商银行</option>
                                <option value='103' text='中国农业银行' selected='selected'>中国农业银行</option>
                                <option value='104' text='中国银行' selected='selected'>中国银行</option>
                                <option value='105' text='中国建设银行' selected='selected'>中国建设银行</option>
                                <option value='301' text='交通银行' selected='selected'>交通银行</option>
                                <option value='302' text='中信银行' selected='selected'>中信银行</option>
                                <option value='303' text='中国光大银行' selected='selected'>中国光大银行</option>
                                <option value='304' text='华夏银行' selected='selected'>华夏银行</option>
                                <option value='305' text='中国民生银行' selected='selected'>中国民生银行</option>
                                <option value='306' text='广发银行' selected='selected'>广发银行</option>
                                <option value='307' text='平安银行' selected='selected'>平安银行</option>
                                <option value='308' text='招商银行' selected='selected'>招商银行</option>
                                <option value='309' text='兴业银行' selected='selected'>兴业银行</option>
                                <option value='310' text='上海浦东发展银行' selected='selected'>上海浦东发展银行</option>
                                <option value='422' text='河北银行' selected='selected'>河北银行</option>
                                <option value='440' text='徽商银行' selected='selected'>徽商银行</option>
                                <option value='1434' text='尧都农村商业银行' selected='selected'>尧都农村商业银行</option>
                            </select>

                            <div id="ddlBankNameTip">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="right" valign="middle">
                            <span class="red">*</span>开户省市：
                        </td>
                        <td align="left" valign="middle" class="selectList">
                            <select name="" style="width: 122px;" id="ddlprovince" class="f-left">
                                <option>请选择</option>
                            </select>
                            <select name="" style="width: 122px;" id="ddlcity" class="f-left">
                                <option>请选择</option>
                            </select>

                            <div id="ddlprovinceTip">
                            </div>
                            <div style="display: none;" class="ui-tips tips-error" id="ddlcityTip">
                                <i></i>请选择开户市!
                                <div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr style="height: 60px;">
                        <td align="right" valign="middle">
                            <span class="red">*</span> 支行名称：
                        </td>
                        <td>
                            <div class="searchSelet2" id="searchSelet" style="">
                                <div class="LB">
                                    <div class="txt" id="txtBranchBankName">
                                    </div>
                                </div>
                                <div class="txtList" id="txtList" style="display: none;">
                                    <div class="kk">
                                        <div class="a-list" id="selectbranck" style="cursor: pointer;">
                                            <span class="a-list-k">无搜索结果</span>
                                        </div>
                                        <b></b>

                                        <div class="search-01">
                                            <div>
                                                <input type="text" class="input-1" id="ddltxtkeyword" value="请输入关键字搜索"
                                                       defaulttext="请输入关键字搜索"/>
                                                <input type="button" class="input-2" onclick="branchbank(true);"
                                                       style="cursor: pointer;"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="display: none;" class="lblinput">
                                <input type="text" class="input-1" id="txtinput" value=""/>
                            </div>
                            <a href="javascript:void(0);" onclick="showInput(this);" class="fsxz">手动输入支行全称</a>

                            <div style="clear: both;">
                            </div>
                            <span class="red " id="lblinputmsg" style="position: absolute;"></span>
                        </td>
                    </tr>
                </table>
                <div class="calculator-btn">
                    <input type="submit" value="确&nbsp;&nbsp;认" isrefresh="false"/>
                    <input type="button" class="reset" value="取&nbsp;&nbsp;消" close-ui="bankadd"/>
                </div>
            </div>
        </div>
    </div>
</form>
<!--添加银行卡结束-->
<!--绑定手机号刷新开始-->
<div id="divbindmobile" class="prompt_box">
    <div style="width: 704px; left: -352px;" class="bank-add-box">
        <h3 class="title">
            尧都农商银行投融资平台提醒您<a href="javascript:void(0)" class="close" close-ui="divbindmobile"></a></h3>

        <div class="bank-alter-text">
            <p class="note-content">
                请您到新打开页面完成手机号码绑定修改</p>
        </div>
        <div class="calculator-btn">
            <input type="button" value="已完成绑定" close-ui="divbindmobile" onclick="bindmobile()"/>
        </div>
    </div>
</div>
<!--绑定手机号刷新结束-->
<div id="bankorder" class="prompt_box">
    <div style="width: 704px; left: -352px;" class="bank-add-box">
        <h3 class="title">
            生钱树投融资平台提醒您<a class="close" href="javascript:void(0)" onclick="CloseDivMsg()"></a></h3>

        <div class="bank-alter-text">
            <p class="note-content">
                请你到新打开的网银页面进行支付，支付完成前请不要关闭该窗口</p>
            帮助： <a href="FAQ/Common?q=q4" target="_blank" class="blue">支付遇到问题了？</a>
        </div>
        <div class="calculator-btn">
            <input type="button" value="已完成支付" onclick="IsPay('complete')"/>
            <input type="button" value="修改付款银行" class="alter" onclick="CloseDivMsg()"/>
        </div>
    </div>
</div>
<div class="prompt_box" style="z-index: 10000;" id="divonlinebank">
    <div style="left: -335px; top: -225px; width: 670px; height: 450px;" class="prompt_inner ui-window-1">
        <h3 class="title">
            <span class="ico_3">生钱树投融资平台提醒您</span><a href="javascript:void(0)" class="close"
                                                     close-ui="divonlinebank"></a></h3>

        <div class="pay-pop">
            <img alt="" src="Content/images/defrayimg_11.png"/></div>
        <div class="pay-pop-bun">
            <input type="checkbox" value="" id="choIsTip"/>&nbsp;下次不再提醒<p>
        </p>
            <span>
                <input type="button" onclick="return SendPayRequest()" style="cursor: pointer"/></span>
        </div>
    </div>
</div>
<!--公告详细成弹窗-->
<div class="prompt_box" id="win_GongGao">
    <div class="prompt_inner ck_1" style="width:400px;height:250px;left:-200px;">
        <h3 class="title">温馨提示<a href="javascript:void(0)" class="close"></a></h3>

        <div class="content">
            <div style="margin-top:0px;">
                <div class="gg-list">
                    <span><b>尧都农商银行借记卡投资温馨说明</b> <strong>2014-10-30</strong> </span>

                    <p>
                        您好！欢迎您访问生钱树投融资平台，您在投资中若使用尧都农商银行借记卡（信合通卡、天河卡）投资，需提前持有效身份证件和银行卡到其任意网点办理开通银联无卡支付业务，交易限额为单笔50000元，日累计100000元，详询客服专线4000496518，给您带来的不便敬请谅解。
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--公告详细弹窗完成-->
<!--确认份额页面新增用户回款账户显示弹窗-->
<div class="prompt_box" id="bank-add">
    <div class="prompt_inner ui-window-1">
        <h3 class="title"><span class="ico_2">重要提醒</span><a href="javascript:void(0)" class="close"></a></h3>

        <div class="bank-alter-text">
            <p class="note-content"><b>本次投资回收的本金和利息到期后将汇入此账户</b>，请确认以下信息无误后再进行支付：</p>
            <table class="qrww" cellspacing="1">
                <tr>
                    <th>开户姓名：</th>
                    <td><span id="spnAccountName"></span></td>
                </tr>

                <tr>
                    <th>账&nbsp;&nbsp;&nbsp;号：</th>
                    <td><span id="spnAccountNum"></span></td>
                </tr>

                <tr>
                    <th>支行名称：</th>
                    <td><span id="spnBankName"></span></td>
                </tr>

                <tr>
                    <th>手机号码：</th>
                    <td><span id="spnPhoneNum"></span></td>
                </tr>
            </table>
        </div>
        <div class="calculator-btn">
            <input type="button" value="确认" onclick="InserOrder()"/>
            <input type="button" class="reset close" value="返回修改"/>
        </div>
    </div>
</div>
<!--确认份额页面新增用户回款账户显示弹窗结束-->


<p class="mouseTips">
    <i></i>
</p>
<!--浮动客服开始--->

<!--浮动客服结束--->

<!--计算器-->
<div class="prompt_box" id="win_Jsq" style="display: none;">
    <div class="prompt_inner ck_1" style="width:340px;height:360px;top:-180px;left:-170px;">
        <h3 class="title">
            <span class="ico_4">收益计算器</span><a href="javascript:void(0)" class="close" close-ui="win_Jsq"></a></h3>

        <div class="content">
            <table border="0" cellspacing="0" cellpadding="0" class="table_5">
                <tbody>
                <tr>
                    <th>
                        投资金额：
                    </th>
                    <td align="left" valign="middle">
                        <input type="text" size="20" class="textFild" id="jsqAmonut"/>
                        元
                    </td>
                </tr>
                <tr>
                    <th>
                        预期年化利率 ：
                    </th>
                    <td align="left" valign="middle">
                        <input type="text" size="20" class="textFild" id="jsqYint"/>
                        %
                    </td>
                </tr>
                <tr>
                    <th>
                        投资期限：
                    </th>
                    <td align="left" valign="middle">
                        <input type="text" size="20" class="textFild" id="jsqDay"/>
                        天
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="result">
                <ul>
                    <li>预期收益：<span id="Income"></span></li>
                    <li>预期本息合计：<span id="totalIncome"></span></li>
                </ul>
            </div>
            <div class="calculator_aniu">
                <input type="button" value="计算" id="jsqcalculate" onclick="Calculate()"/>
                <input type="button" class="reset" value="重置" onclick="ReSetjsq()"/>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    /**
     *收益计算器_计算功能
     **/
    function Calculate() {

        var investreg = /^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
        var numreg = /^-?\d+$/;

        if ($.trim($("#jsqAmonut").val()) == "") {
            alert("请输入投资金额!");
            $("#jsqAmonut").focus();
            return;
        }
        if (!investreg.test($.trim($("#jsqAmonut").val()))) {
            alert("投资金额格式错误，只保留两位小数！")
            $("#jsqAmonut").focus();
            return false;
        }

        if ($.trim($("#jsqYint").val()) == "") {
            alert("请输入预期收益率!");
            $("#jsqYint").focus();
            return;
        }
        if (!investreg.test($.trim($("#jsqYint").val()))) {
            alert("年化利率格式错误，只保留两位小数！")
            $("#jsqYint").focus();
            return false;
        }

        if ($.trim($("#jsqDay").val()) == "") {
            alert("请输入投资期限!");
            $("#jsqDay").focus();
            return;
        }
        if (!numreg.test($.trim($("#jsqDay").val()))) {
            alert("投资期限格式错误，只能输入数字！")
            $("#jsqDay").focus();
            return false;
        }
        $("#Income").html(CalculateInterest(parseFloat($("#jsqAmonut").val()), parseFloat($("#jsqYint").val()) / 100, parseInt($("#jsqDay").val())).toFixed(2));
        $("#totalIncome").html((CalculateInterest(parseFloat($("#jsqAmonut").val()), parseFloat($("#jsqYint").val()) / 100, parseInt($("#jsqDay").val())) + (parseFloat($("#jsqAmonut").val()) )).toFixed(2));
    }
    /**
     *收益计算器_重置功能
     **/
    function ReSetjsq() {
        $("#jsqAmonut").val("");
        $("#jsqYint").val("");
        $("#jsqDay").val("");
        $("#Income").html("");
        $("#totalIncome").html("");
        $("#jsqAmonut").focus();
    }
    //利息计算
    function CalculateInterest(amount, rate, daysCount) {
        var interest = (amount * rate / 360) * daysCount;
        return ToDigits2(interest);
    }
    function ToDigits2(floatVal) {
        var strResult = parseFloat(floatVal).toFixed(4).toString();
        return parseFloat(strResult.substr(0, strResult.length - 2));
    }
</script>

<!--遮罩层-->
<div class="blackBg" style="display: none;">
</div>
<!--融资意向-->
<!--融资申请弹窗-->
<div class="prompt_box" id="rzsq" style=" display:none">
    <div class="prompt_inner ck_1 ui-window-1">
        <h3 class="title">
            <span class="ico_1">融资申请登记</span><a href="javascript:void(0)" class="close" onclick="initDivStatus()"></a>
        </h3>

        <div class="content" style="height:300px;overflow-y:scroll;">
            <div id="divFinancingIntentionApply">
                <table class="table-yxdj" cellspacing="0">
                    <tr>
                        <td colspan="2" class="td-3">
                            <span>暂且仅受理山西省太原地区和临汾地区的融资申请；<br/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提交申请后，我们将会有专门人员与您联系。</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            <b>*</b> 申请人姓名：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtFinanciersName" size="20" class="textFild" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            <b>*</b> 区域：
                        </td>
                        <td class="td-2">
                            <select id="selProvince" style="width: 110px;" class="ddlprovince" name="Province">
                                <option>山西省</option>
                            </select>
                            <select id="selCity" style="width: 110px;" class="ddlcity" name="City">
                                <option>临汾市</option>
                                <option>太原市</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            <b>*</b> 详细地址：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtAddress" size="20" class="textFild" maxlength="100"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            主营业务：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtMainBusiness" size="20" class="textFild" maxlength="200"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            <b>*</b> 融资用途：
                        </td>
                        <td class="td-2">
                            <textarea cols="1" rows="2" id="txtFinancingPurposes" class="textFild"
                                      onblur="initFinancingPurposes(this)"
                                      onfocus="clearFinancingPurposes(this)">200字以内</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            <b>*</b> 期望融资金额：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtFinancingAmount" rtip="最低10万元" size="20" class="textFild mR"
                                   maxlength="10"/>万元
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            <b>*</b> 融资期限：
                        </td>
                        <td class="td-2">
                            <select id="selFinancingDuration" style="width: 110px;">
                                <option>30天</option>
                                <option>60天</option>
                                <option>180天</option>
                                <option>360天</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            期望融资利率：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtFinancingInterest" size="20" class="textFild mR"/>%
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            <b>*</b> 手机号码：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtPhoneNum" rtip="请输入手机号码" size="20" class="textFild"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            E-mail：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtFinancingEmail" rtip="请输入邮箱地址" size="20" class="textFild"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="td-4">
                            <input id="btnSubmitIntentionApply" type="button" value="提交"
                                   onclick="ValidateInputSubmit()"/>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="ts" style="margin-top: 80px; text-align: center ; display:none;" id="divSuccessTip">
                <img src="content/images/firm_info_34.png" align="absmiddle">&nbsp;&nbsp;<span style="font-size: 24px;">提交成功！</span><br>

                <p style="font-weight: 400; margin-top: 15px;">
                    我们将会有专门人员与您联系，请耐心等候。</p>
            </div>
        </div>
    </div>
</div>
<!--融资申请器弹窗结束-->
<script type="text/javascript">
    $(function () {
        InitRTip();
    });

    function initFinancingPurposes(obj) {
        var v = obj.value;
        if (v == "") {
            obj.value = "200字以内";
        }
    }

    function clearFinancingPurposes(obj) {
        if (obj.value == "200字以内") {
            obj.value = "";
        }
    }

    function ValidateInputSubmit() {
        var txtFinanciersName = $("#txtFinanciersName"),
                selProvince = $("#selProvince"),
                selCity = $("#selCity"),
                txtAddress = $("#txtAddress"),
                txtMainBusiness = $("#txtMainBusiness"),
                txtFinancingPurposes = $("#txtFinancingPurposes"),
                txtFinancingAmount = $("#txtFinancingAmount"),
                selFinancingDuration = $("#selFinancingDuration"),
                txtFinancingInterest = $("#txtFinancingInterest"),
                txtPhoneNum = $("#txtPhoneNum"),
                txtFinancingEmail = $("#txtFinancingEmail");

        if ($.trim(txtFinanciersName.val()) == "") {
            alert("请输入申请人姓名！");
            txtFinanciersName.focus();
            return false;
        } else {
            var investreg = /^[\u4E00-\u9FA5\uF900-\uFA2D]+$/
            if (!investreg.test($.trim(txtFinanciersName.val()))) {
                alert("申请人姓名只能输入中文！")
                txtFinanciersName.focus();
                return false;
            }
        }

        if ($.trim(txtAddress.val()) == "") {
            alert("请输入详细地址！");
            txtAddress.focus();
            return false;
        }

        if ($.trim(txtFinancingPurposes.val()) == "200字以内" || $.trim(txtFinancingPurposes.val()) == "") {
            alert("请输入融资用途！");
            txtFinancingPurposes.focus();
            return false;
        } else {
            var v = txtFinancingPurposes.val();
            if (v.length > 200) {
                alert("融资用途限制在200字以内！");
                txtFinancingPurposes.focus();
                return false;
            }
        }

        var investreg = /^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
        if (!investreg.test($.trim(txtFinancingAmount.val()))) {
            alert("期望融资金额格式错误，只保留两位小数！")
            txtFinancingAmount.focus();
            return false;
        }
        if (parseFloat($.trim(txtFinancingAmount.val())) < 10) {
            alert("期望融资金额最低10万元！");
            txtCanInvestment.focus();
            return false;
        }

        if ($.trim(txtFinancingInterest.val()) != "") {
            if (!investreg.test($.trim(txtFinancingInterest.val()))) {
                alert("期望融资利率格式错误,只保留两位小数!");
                txtFinancingInterest.focus();
                return false;
            }
            if (parseFloat($.trim(txtFinancingInterest.val())) > 20) {
                alert("期望融资利率最高20%!");
                txtFinancingInterest.focus();
                return false;
            }
        }

        var reg = /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|17[0-9])[0-9]{8}$/;
        if (!reg.test($.trim(txtPhoneNum.val()))) {
            alert("该手机格式错误，请检查!");
            txtPhoneNum.focus();
            return false;
        }

        if ($.trim(txtFinancingEmail.val()) != "请输入邮箱地址") {
            var emailreg = /^([a-zA-Z0-9_]||.)+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])/;
            if (!emailreg.test($.trim(txtFinancingEmail.val()))) {
                alert("该邮箱地址格式错误，请检查!");
                txtFinancingEmail.focus();
                return false;
            }
        }

        var submitData = {};
        submitData.targetAction = "AddFinancingIntentionApply";

        submitData.FinanciersName = txtFinanciersName.val();
        submitData.Province = selProvince.val();
        submitData.City = selCity.val();
        submitData.Address = txtAddress.val();
        submitData.MainBusiness = txtMainBusiness.val();
        submitData.FinancingPurposes = txtFinancingPurposes.val();
        submitData.FinancingAmount = txtFinancingAmount.val();
        if ($.trim(txtFinancingInterest.val()) != "") {
            submitData.FinancingInterest = txtFinancingInterest.val();
        }
        submitData.FinancingDuration = selFinancingDuration.val();
        submitData.PhoneNum = txtPhoneNum.val();
        if ($.trim(txtFinancingEmail.val()) != "请输入邮箱地址") {
            submitData.Email = txtFinancingEmail.val();
        }

        $.ajax({
            url: 'Ajax/ProcessRequest',
            type: 'post',
            data: submitData,
            dataType: 'text',
            error: function (err) {
                alert("脚本执行异常，请刷新页面重试(ajax error)：" + err.statusText);
            },
            success: function (result) {
                var jsonResult = JSON.parse(result);
                if (jsonResult.IsSuccess == true) {
                    //每次进来都可以重复提交
                    txtFinanciersName.val("");
                    selCity.html(" <option>临汾市</option><option>太原市</option>");
                    txtAddress.val("");
                    txtMainBusiness.val("");
                    txtFinancingPurposes.val("200字以内");
                    txtFinancingPurposes.text("200字以内");
                    txtFinancingAmount.val("最低10万元");
                    txtFinancingInterest.val("");
                    selFinancingDuration.val("30天");
                    txtPhoneNum.val("请输入手机号码");
                    txtFinancingEmail.val("请输入邮箱地址");
                    $("#divFinancingIntentionApply").hide();
                    $("#divSuccessTip").show();
                } else {
                    alert(jsonResult.Message);
                }
            }
        });
    }

    function initDivStatus() {
        $("#divFinancingIntentionApply").show();
        $("#divSuccessTip").hide();
    }
</script>

<!--浮动客服开始--->
<div id="divQQbox" class="advisory">
    <div class="rzsq-kf openWindow" open_win="rzsq"
         action-data="rzsq||ui-window-1||480||400||canDrag||absolute||inIframe" style="cursor: pointer;">
        <a href="javascript:void(0)">融资申请登记</a>
    </div>

    <a href="javascript:void(0)" class="close_kf"></a><a href="javascript:void(0)" class="show_kf">
</a>

    <div class="service-phone">
        客服专线<br/>
        <span>400-04-96518</span>
    </div>
    <div class="receipts" open_win="win_Jsq" open_win_position="0" style="cursor: pointer;">
        <a href="javascript:void(0)">收益计算</a></div>
</div>
<div style="z-index: 10000; top: 100px; display: none;" class="prompt_box" id="Borrowservice">
    <div style="width: 740px; left: -370px; display: block;" class="prompt_inner">
        <h3 class="title">
            <span class="ico_3">尧都农商银行提醒您</span><a class="close"
                                                   onclick="javascript:$('#Borrowservice').hide();$('.blackBg').hide();"
                                                   href="javascript:void()"></a></h3>

        <div style="padding-right: 0; padding-bottom: 0px; overflow: hidden" class="content">
            <iframe width="100%" height="380px" frameborder="no" src="About/BorrowService.html?v=1"
                    allowtransparency="true" scrolling="yes" id="frame_content" name="czWindow">
            </iframe>
        </div>

    </div>
</div>
<script type="text/javascript">
    $(".close_kf").click(function () {
        $.cookie('closecustom', '1', {path: '', domain: 'e.ydnsh.com'});
        $(this).parent().animate({right: -$(this).parent().width()}, 300, "easeOutQuint");
        $(this).siblings(".show_kf").show();
        $(this).siblings(".show_kf").animate({left: -$(this).siblings(".show_kf").width() / 2}, 300, "easeInElastic");
    });
    $(".show_kf").mouseover(function () {
        $.cookie('closecustom', '0', {path: '', domain: 'e.ydnsh.com'});
        $(this).hide();
        $(this).parent().animate({right: 0}, 300, "easeOutQuint");
        $(this).css({left: 100});
    });
</script>
<!--浮动客服结束--->
<div class="mod-footer">
    <div class="footer-wrap">
        <div class="ui-guide">
            <!--  -->
            <dl class="ui-guide-item f-left">
                <dt>
                    <img src="content/images/footer2.gif" alt="关于尧都农商银行"/></dt>
                <dt>平台介绍</dt>
                <dd>
                    <a href="FAQ/introduction" target="_blank">平台简介</a></dd>
                <dd>
                    <a href="FAQ/Common?isNoun=1" target="_blank">名词解释</a></dd>
                <dd>
                    <a href="FAQ/directive_title" target="_blank">安全保障</a></dd>
            </dl>
            <dl class="ui-guide-item f-left">
                <dt>
                    <img src="content/images/footer3.gif" alt="关于尧都农商银行"/></dt>
                <dt>操作指引</dt>
                <dd>
                    <a href="FAQ/Login" target="_blank">注册登录</a></dd>
                <dd>
                    <a href="FAQ/tz_operating" target="_blank">投资指引</a></dd>
                <dd>
                    <a href="FAQ/rz_operating" target="_blank">融资指引</a></dd>
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
                                <img alt="尧都银行微信二维码" src="Content/Images/ewm.png"></b>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="copyright">
            <p>
                <img src="content/images/qthl_logo.png" alt="前途互联"/></p>

            <p class="company-name">
                晋ICP备11001340号</p>
            <br/>

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
    <img src="content/images/backTop.png"/></a>
<style type="text/css">
    <!--
    .backTop {
        bottom: 0;
        position: fixed;
        right: 0;
    }

    -->
</style>
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

<!--操作提示窗口-->
<div class="prompt_box" style="display: none" id="winOperateTip">
</div>
<script id="tmpl_winOperateTip" type="text/x-jquery-tmpl">
<div style="width: 440px;left:-220px;" class="prompt_inner ck_1">
    <h3 class="title">
        <span class="icon_2"></span><a class="close" id="opwin_btn_close" href="javascript:void(0)"></a></h3>
    <div class="bank-alter-text">
        <p class="note-content" style="margin: 50px 0;text-align:center;font-size:14px;">
            ${message}</p>
    </div>
    <div class="calculator-btn" id="opwin_btns">
    </div>
</div>

</script>
<script id="tmpl_winOperateTip_btns_default" type="text/x-jquery-tmpl">
<div class="calculator_aniu">
<input type="button" value="${okTitle}" title="${okTitle}" id="opwin_btn_ok" />
<input type="button" value="${cancelTitle}" class="alter" title="${cancelTitle}" id="opwin_btn_cancel" />
</div>

</script>


</body>
</html>