<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String account = (String) session.getAttribute("$token");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我要投资_e融九州</title>
    <meta content="P2B,银行投资,基金,个人理财，融资项目" name="keywords">
    <meta content="e融九州投融资平台项目详情展示" name="description">
    <link rel="stylesheet" type="text/css" href="content/css/public.css?ucsv=1.1.1"/>
    <link rel="stylesheet" type="text/css" href="content/css/header_footer.css?ucsv=1.1.1"/>
    <link rel="stylesheet" type="text/css" href="content/css/main.css">
    <script type="text/javascript" src="script/lib/angular.min.js"></script>
    <script type="text/javascript" src="script/app/controller/controller.js"></script>
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

<body>


<div class="header header-bg">
    <div class="header-wrap">
        <div class="logo f-left">
            <a href="index.html" target="_blank">
                <img title="尧都农商银行" alt="尧都农商银行" src="content/images/logo.png"></a></div>
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
    <div id="main-nav">
        <ul>
            <li class="mainNav-item" nav="首页"><a href="index.html">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</a>
            </li>
            <li class="mainNav-item current" nav="我要投资"><a href="list.html">我要投资</a></li>
            <li class="mainNav-item" nav="我要借款"><a id="a_gojiekuan" href="https://e.ydnsh.com/Loan"
                                                   action-data="window_4||ui-window-1||400||250" class="openWindow">
                我要借款</a></li>
            <li class="mainNav-item" nav="账户中心"><a href="https://e.ydnsh.com/Center">账户中心</a>
                <ul class="sub-mainNav" style="display: none;">
                    <li><a href="https://e.ydnsh.com/Center">我的账户</a></li>
                    <li><a href="https://e.ydnsh.com/Center/BaseInfo">账号设置</a></li>
                    <li><a href="https://e.ydnsh.com/MsgCenter">消息提醒</a></li>
                </ul>
            </li>

        </ul>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        var nav = "我要投资";
        $("#main-nav").find("li").removeClass("current");
        $("#main-nav").find("[nav=" + nav + "]").addClass("current");

        $(".mainNav-item").mouseover(function () {
            $(this).addClass("current")
            $(this).find(".sub-mainNav").show()
        })
        $(".mainNav-item").mouseout(function () {
            if($(this).attr("nav")==nav) return;
            $(this).removeClass("current")
            $(this).find(".sub-mainNav").hide()
        })
    })
</script>

<script type="text/javascript">
    function TryGetExclusiveImage(p) {
        if (p.ProjectType == 1)
            return '<span class="jieshi ui-icon icon-z" alt="针对特定用户的专项投资项目" jieshi="-10,-50"></span>';
        return "";
    }
    $(function () {
        BindSelect(".interestSelect", function (selVal) {
            $("#txtInterest").val(selVal);
            GoSearch(1);
        });
        BindSelect(".durationSelect", function (selVal) {
            $("#txtDuration").val(selVal);
            GoSearch(1);
        });
        BindSelect(".projectStatusSelect", function (selVal) {
            $("#txtProjectStatus").val(selVal);
            GoSearch(1);
        });
        BindSelect(".projectAmountSelect", function (selVal) {
            $("#txtProjectAmount").val(selVal);
            GoSearch(1);
        });

        //重置筛选条件
        $("#resetSel").live("click", function () {
            $(".ui-search-item").find("a").removeClass();
            $(".ui-search-item").find("a:first").addClass("current");
            $("input:hidden").val("");
            $("#jsqcalculate").val("计算");
            $(".reset").val("重置");
            $("#btnSubmitIntentionApply").val("提交");
            GoSearch(1);
        })


    });
    function BindSelect(target, SelFn) {
        $(target).find(".ui-search-tag").find("a").live("click", function () {
            var selVal = $(this).attr("selVal");
            SelFn(selVal);
            $(target).find(".ui-search-tag").find("a").removeClass();
            $(this).addClass("current");
        });
    }
</script>

<div id="wrap" class="warp-container">
    <div class="container w-list-1086">
        <div class="ui-content">

            <div class="ui-search project-box">
                <a class="ui-help blue-line" href="https://e.ydnsh.com/FAQ/tz_operating">第一次使用？</a>

                <div class="ui-tab ui-search-tab">
                    <ul>
                        <li value="1" class="current"><a class="ui-search-1" href="javascript:void(0)" selval="bank">
                            银行项目</a></li>

                    </ul>
                </div>
                <div class="labelContent project-text" style="display: block;">
                    <div class="ui-search-item interestSelect">
                        <span class="ui-icon">预期收益率：</span>

                        <div class="ui-search-tag">
                            <a href="javascript:void(0)" class="current">全部</a> <a href="javascript:void(0)"
                                                                                   selval="0,5.99">6%以下</a> <a
                                href="javascript:void(0)" selval="6,6.99">6%~7%
                        </a><a href="javascript:void(0)" selval="7,7.99">7%~8%</a> <a href="javascript:void(0)"
                                                                                      selval="8,-1">8%及以上</a>
                        </div>
                    </div>
                    <div class="ui-search-item durationSelect">
                        <span class="ui-icon">投资期限：</span>

                        <div class="ui-search-tag">
                            <a href="javascript:void(0)" class="current">全部</a><a href="javascript:void(0)"
                                                                                  selval="90,179">90~180天</a>
                            <a href="javascript:void(0)" selval="180,359">180~360天</a> <a href="javascript:void(0)"
                                                                                          selval="360,-1">360天及以上</a>
                        </div>
                    </div>
                    <div class="ui-search-item projectStatusSelect">
                        <label class="ui-label">
                            <span class="ui-icon">投资进度：</span>
                        </label>

                        <div class="ui-search-tag">
                            <a href="javascript:void(0)" class="current">全部</a> <a href="javascript:void(0)" selval="3">预热中</a>
                            <a href="javascript:void(0)" selval="4">
                                投标中</a> <a href="javascript:void(0)" selval="5">
                            已完成</a>
                        </div>
                    </div>
                    <div class="ui-search-item projectAmountSelect">
                        <label class="ui-label">
                            <span class="ui-icon">项目发行规模：</span>
                        </label>

                        <div class="ui-search-tag">
                            <a href="javascript:void(0)" class="current">全部</a> <a href="javascript:void(0)"
                                                                                   selval="0,499">500万以下</a> <a
                                href="javascript:void(0)" selval="500,999">500~1000万
                        </a><a href="javascript:void(0)" selval="1000,4999">1000~5000万</a> <a href="javascript:void(0)"
                                                                                              selval="5000,-1">5000万及以上</a>
                        </div>
                    </div>

                    <input type="hidden" id="txtInterest">
                    <input type="hidden" id="txtDuration">
                    <input type="hidden" id="txtProjectStatus">
                    <input type="hidden" id="txtProjectAmount">
                </div>
            </div>


            <div class="module" ng-controller="p2pList">
                <div class="mod-wrap mod-project-inner">
                    <div class="mod-content">
                        <div id="projectList_search" >
                            <div class="project-item"  ng-repeat="item in items">
                                <div class="inner">
                                    <table border="0" cellspacing="0" cellpadding="0" class="ui-table-8" width="100%">
                                        <tbody>
                                        <tr>
                                            <td width="8%" class="ui-line-1"><p class="ui-icon"><img
                                                    src="content/images/{{item.image}}"></p></td>
                                            <td width="38%">
                                                <div class="pro-title pro-name"><h3><a open_win="window_2"
                                                                                       open_win_position="0"
                                                                                       href="javascript:void(0)">{{item.text}}【{{item.id}}】</a>
                                                </h3>                                             <span
                                                        alt="尧都农商银行作为项目见证机构，已对融资方信用等级评定，并对融资项目信息严格审核。"
                                                        class="jieshi ui-icon icon-z"></span> <span
                                                        alt="该项目委托第三方支付公司-中金支付有限公司提供资金监管和清算服务。"
                                                        class="jieshi ui-icon icon-w"></span>

                                                    <p class="pro-text pro-money"><span>金额:￥{{item.scale}}万元</span> <span>最小投资：￥{{item.min}}元 </span>
                                                    </p></div>
                                            </td>
                                            <td width="12%" align="center"><p class="pro-title pro-rate"> {{item.income}}%</p>

                                                <p class="pro-text"> 预期收益率</p></td>
                                            <td width="11%" align="center" class="ui-line-1"><p
                                                    class="pro-title pro-date"> {{item.dateline}}天</p>

                                                <p class="pro-text"> 期 限</p></td>
                                            <td width="11%" align="center"><p class="pro-title pro-date"> 100%</p>

                                                <p class="pro-text"> 进 度</p></td>
                                            <td width="20%" align="right">
                                                <div class="pro-button pro-button-ok"><a href="javascript:void(0)"
                                                                                         class="openWindow"
                                                                                         action-data="window_2||ui-window-1||500||210">完&nbsp;&nbsp;&nbsp;&nbsp;成</a>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="project-bg"></div>
                                </div>
                            </div>
                        </div>

                        <div id="pagerHolder" class="mod-page"></div>

                    </div>
                </div>
            </div>
            <script id="tmpl_projectList" type="text/x-jquery-tmpl">
                {{each(i,v) Data.ResultList}}
                <div class="project-item">
                    <div class="inner">
                        <table border="0" cellspacing="0" cellpadding="0" class="ui-table-8" width="100%">
                            <colgroup>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td width="8%" class="ui-line-1">
                                        <p class="ui-icon">
                                            <img src="/content/images/back_logo_03.gif"></p>
                                    </td>
                                    <td width="38%">
                                        <div class="pro-title pro-name">
                                            <h3>
                                                {{html GetProjectLinkHtml(v)}}</h3>
                                            <span alt="尧都农商银行作为项目见证机构，已对融资方信用等级评定，并对融资项目信息严格审核。" class="jieshi ui-icon icon-z"></span>
                          <span alt="该项目委托第三方支付公司-中金支付有限公司提供资金监管和清算服务。" class="jieshi ui-icon icon-w"></span>
                       
                             {{if  v.ProjectType==1 }}
                          <span alt="为满足特定投资人、融资人的需求成立的VIP项目，目前只对拥有专项识别码的VIP投资人开放投标。" class="jieshi ui-icon icon-v"></span>
                           {{/if}}
                                            <p class="pro-text pro-money">
                                                <span>金额:￥${v.Amount/10000}万元</span> <span>最小投资：￥${v.MinInvestPartsCount*(v.Amount/v.PartsCount)}元 </span>
                                            </p>
                                        </div>
                                    </td>
                                    <td width="12%" align="center">
                                        <p class="pro-title pro-rate">
                                            ${v.InvestmentInterest}%</p>
                                        <p class="pro-text">
                                            预期收益率</p>
                                    </td>
                                    <td width="11%" align="center" class="ui-line-1">
                                        <p class="pro-title pro-date">
                                            ${v.Duration}天</p>
                                        <p class="pro-text">
                                            期 限</p>
                                    </td>
                                    <td width="11%" align="center">
                                        <p class="pro-title pro-date">
                                            %</p>
                                        <p class="pro-text">
                                            进 度</p>
                                    </td>
                                    <td width="20%" align="right">
                                        {{html GetProjectStatusImageHtml(v)}}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="project-bg">
                        </div>
                    </div>
                </div>
                    {{/each}}

            </script>
            <script type="text/javascript">
                function GetProjectLinkHtml(p) {
                    var imgConfig = {
                        "3": '<a href="/home/detail?FinancingId=' + p.FinancingId + '">' + p.ProjectName + '</a>', //已发布预热中
                        "4": '<a href="/home/detail?FinancingId=' + p.FinancingId + '">' + p.ProjectName + '</a>', //已发布投标中
                        "5": '<a open_win="window_2" open_win_position="0" href="javascript:void(0)">' + p.ProjectName + '</a>'//投标结束
                    };
                    var val = imgConfig[p.FinanceApplyStatus];
                    if (p.FinanceApplyStatus == 4 && p.Progress == 1) {
                        val = '<a open_win="win_FinaceClose" open_win_position="0" href="javascript:void(0)">' + p.ProjectName + '</a>';//满标
                    }
                    return val;
                }
                function GetProjectProgress(p) {
                    if (p.FinanceApplyStatus == 5) {
                        return "100";
                    }
                    if (p.FinanceApplyStatus == 3) {
                        return "0";
                    }
                    var pStr = (p.Progress * 100) + "";
                    var dotIndex = pStr.indexOf('.');
                    if (dotIndex > 0) {
                        return pStr.substring(0, dotIndex);
                    }
                    return pStr;
                }
                function GetProjectStatusImageHtml(p) {
                    var pStr = (p.Progress * 100) + "";
                    var dotIndex = pStr.indexOf('.');
                    var progresshtml = "";
                    var progress = "0";
                    if (dotIndex > 0) {
                        progress = pStr.substring(0, dotIndex);
                    }
                    else {
                        progress = pStr;
                    }

                    var key = p.FinanceApplyStatus + "";
                    var isFull = IsFullOrder(p);
                    if (isFull) {
                        key += (isFull ? "_满标" : "");
                    }
                    if (key == "3") {
                        progresshtml = '<div class="pro-button pro-button-preheat"><a href="/home/detail?FinancingId=' + p.FinancingId + '">预&nbsp;&nbsp;热&nbsp;&nbsp;中</a></div>';
                    }
                    else if (key == "4") {
                        progresshtml = '<div class="pro-button"><span style="width:' + progress + '%;"></span><a href="/home/detail?FinancingId=' + p.FinancingId + '">投&nbsp;&nbsp;&nbsp;&nbsp;标</a></div>';
                    }
                    else if (key == "4_满标") {
                        progresshtml = '<div class="pro-button"><span style="width:100%;"></span><a  href="javascript:void(0)" class="openWindow" action-data="win_FinaceClose||ui-window-1||500||210" onclick="OpenWindowFinish(this);" >满&nbsp;&nbsp;&nbsp;&nbsp;标</a></div>';
                    }
                    else if (key == "5") {
                        progresshtml = '<div class="pro-button pro-button-ok"><a  href="javascript:void(0)" class="openWindow" action-data="window_2||ui-window-1||500||210" onclick="OpenWindowFinish(this);" >完&nbsp;&nbsp;&nbsp;&nbsp;成</a></div>';
                    }
                    return progresshtml;
                }
                //【是否满标】规则：项目状态处于投标中，并且投资进度已达100%
                function IsFullOrder(p) {
                    return p.FinanceApplyStatus == 4 && p.Progress == 1;
                }
            </script>
            <script type="text/javascript">
                $(function () {
                    GoSearch(1);
                });
                function GoSearch(pi) {
                    var submitData = {};
                    submitData.targetAction = "CmbFinancingSearch";
                    submitData.PageIndex = pi;
                    submitData.PageSize = 10;
                    submitData.Interest = $("#txtInterest").val();
                    submitData.Duration = $("#txtDuration").val();
                    submitData.ProjectStatus = $("#txtProjectStatus").val();
                    submitData.ProjectAmount = $("#txtProjectAmount").val();
                    RenderTmpl({
                        Data: submitData,
                        TmplSource: "#tmpl_projectList", TmplTarget: "#projectList_search"
                        , After: function (result) {
                            if (result.Data.TotalCount < 1) {
                                $("#projectList_search").html('<div class="no-content"><p>无法找到符合筛选的结果 <input id="resetSel" type="button" class="ui-button-4" value="重置筛选标准"></p></div>');
                                $("#pagerHolder").html("");
                            } else if (result.Data.TotalCount < submitData.PageSize) {
                                $("#pagerHolder").html("");
                            } else {
                                $("#pagerHolder").html(GetPagerHtmlSpan({
                                    index: submitData.PageIndex,
                                    size: submitData.PageSize,
                                    total: result.Data.TotalCount,
                                    fnName: "GoSearch"
                                }));

                            }
                            setTimeout(function () {
                                HeightChange();
                            }, 100);
                            $("#txtFocus").focus();
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
                        }
                    });
                }

                function OpenWindowFinish(obj) {
                    var _top = $(window).scrollTop();
                    var parameters = $(obj).attr("action-data");
                    var paraArr = []
                    paraArr = parameters.split("||")
                    $(".blackBg").show()
                    $("#" + paraArr[0]).show()
                    if (paraArr[4] == "absolute") {
                        $("#" + paraArr[0]).css({position: paraArr[4], top: _top + 80})

                    } else {
                        $("#" + paraArr[0]).find(".prompt_inner").css({
                            width: paraArr[2],
                            height: paraArr[3],
                            top: -paraArr[3] / 2,
                            left: -paraArr[2] / 2
                        })
                    }
                    $("#" + paraArr[0]).find(".prompt_inner").addClass(paraArr[1]);
                }

                //关闭弹窗
                function CloseWindowFinish() {
                    $(".prompt_box").hide()
                    $(".blackBg").hide()
                }

            </script>

        </div>
    </div>
</div>


<script>
    function fillDownlist() {
        //填充银行下拉框
        $("body").append(" <input type='hidden' id='hidbankenum' value='&lt;option value=&#39;100&#39; text=&#39;中国邮政储蓄银行&#39; selected=&#39;selected&#39;&gt;中国邮政储蓄银行&lt;/option&gt;&lt;option value=&#39;102&#39; text=&#39;中国工商银行&#39; selected=&#39;selected&#39;&gt;中国工商银行&lt;/option&gt;&lt;option value=&#39;103&#39; text=&#39;中国农业银行&#39; selected=&#39;selected&#39;&gt;中国农业银行&lt;/option&gt;&lt;option value=&#39;104&#39; text=&#39;中国银行&#39; selected=&#39;selected&#39;&gt;中国银行&lt;/option&gt;&lt;option value=&#39;105&#39; text=&#39;中国建设银行&#39; selected=&#39;selected&#39;&gt;中国建设银行&lt;/option&gt;&lt;option value=&#39;301&#39; text=&#39;交通银行&#39; selected=&#39;selected&#39;&gt;交通银行&lt;/option&gt;&lt;option value=&#39;302&#39; text=&#39;中信银行&#39; selected=&#39;selected&#39;&gt;中信银行&lt;/option&gt;&lt;option value=&#39;303&#39; text=&#39;中国光大银行&#39; selected=&#39;selected&#39;&gt;中国光大银行&lt;/option&gt;&lt;option value=&#39;304&#39; text=&#39;华夏银行&#39; selected=&#39;selected&#39;&gt;华夏银行&lt;/option&gt;&lt;option value=&#39;305&#39; text=&#39;中国民生银行&#39; selected=&#39;selected&#39;&gt;中国民生银行&lt;/option&gt;&lt;option value=&#39;306&#39; text=&#39;广发银行&#39; selected=&#39;selected&#39;&gt;广发银行&lt;/option&gt;&lt;option value=&#39;307&#39; text=&#39;平安银行&#39; selected=&#39;selected&#39;&gt;平安银行&lt;/option&gt;&lt;option value=&#39;308&#39; text=&#39;招商银行&#39; selected=&#39;selected&#39;&gt;招商银行&lt;/option&gt;&lt;option value=&#39;309&#39; text=&#39;兴业银行&#39; selected=&#39;selected&#39;&gt;兴业银行&lt;/option&gt;&lt;option value=&#39;310&#39; text=&#39;上海浦东发展银行&#39; selected=&#39;selected&#39;&gt;上海浦东发展银行&lt;/option&gt;&lt;option value=&#39;422&#39; text=&#39;河北银行&#39; selected=&#39;selected&#39;&gt;河北银行&lt;/option&gt;&lt;option value=&#39;440&#39; text=&#39;徽商银行&#39; selected=&#39;selected&#39;&gt;徽商银行&lt;/option&gt;&lt;option value=&#39;1434&#39; text=&#39;尧都农村商业银行&#39; selected=&#39;selected&#39;&gt;尧都农村商业银行&lt;/option&gt;'/>");
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

<div class="prompt_box" id="win_FinaceClose" style="display: none;">
    <div class="prompt_inner ck_1" style="width:480px;height:250px;left:-200px;">
        <h3 class="title">
            e融九州投融资平台提示您<a href="javascript:void(0)" class="close" close-ui="win_FinaceClose"></a>
        </h3>

        <div class="content">
            <div style="margin-top: 10px;" class="ts">
                此项目已达到项目发行规模（满标），请选择其他项目投标。
            </div>
            <div style="margin-top: 5px; color: #666; text-align: center">
                如有疑问请致电“e融九州投融资平台”客服专线：<span class="red">400-04-96518</span>
            </div>
        </div>
    </div>
</div>


<div class="prompt_box" id="window_2" style="display: none;">
    <div class="prompt_inner ck_1" style="width:480px;height:250px;left:-200px;">
        <h3 class="title">
            e融九州投融资平台提示您<a href="javascript:void(0)" class="close" close-ui="win_FinaceClose"></a>
        </h3>

        <div class="content">
            <div style="margin-top: 10px;" class="ts">
                <img alt="" align="absmiddle" src="./我要投资_e融九州_files/firm_info_34.png">&nbsp;&nbsp;项目已完成，出资人请进入"<a
                    target="_blank" href="https://e.ydnsh.com/Center">账户中心</a>"<br>
                查阅过往出资记录及项目详情!
            </div>
            <div style="margin-top: 5px; color: #666; text-align: center">
                如有疑问请致电“e融九州投融资平台”客服专线：<span class="red">400-04-96518</span>
            </div>
        </div>
    </div>
</div>


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
                    <tbody>
                    <tr>
                        <td width="191" height="50" align="right" valign="middle">
                            <span class="red">*</span>户名：
                        </td>
                        <td width="473" align="left" valign="middle">
                            <input type="text" id="txtAccountName" size="20">

                            <div id="txtAccountNameTip">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="right" valign="middle">
                            <span class="red">*</span>账号：
                        </td>
                        <td align="left" valign="middle">
                            <input type="text" id="txtAccountNo" size="20">

                            <div id="txtAccountNoTip">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="50" align="right" valign="middle">
                            <span class="red">*</span>确认账号：
                        </td>
                        <td align="left" valign="middle">
                            <input type="text" id="txtAgainAccountNo" size="20">

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
                                <option value="100" text="中国邮政储蓄银行" selected="selected">中国邮政储蓄银行</option>
                                <option value="102" text="中国工商银行" selected="selected">中国工商银行</option>
                                <option value="103" text="中国农业银行" selected="selected">中国农业银行</option>
                                <option value="104" text="中国银行" selected="selected">中国银行</option>
                                <option value="105" text="中国建设银行" selected="selected">中国建设银行</option>
                                <option value="301" text="交通银行" selected="selected">交通银行</option>
                                <option value="302" text="中信银行" selected="selected">中信银行</option>
                                <option value="303" text="中国光大银行" selected="selected">中国光大银行</option>
                                <option value="304" text="华夏银行" selected="selected">华夏银行</option>
                                <option value="305" text="中国民生银行" selected="selected">中国民生银行</option>
                                <option value="306" text="广发银行" selected="selected">广发银行</option>
                                <option value="307" text="平安银行" selected="selected">平安银行</option>
                                <option value="308" text="招商银行" selected="selected">招商银行</option>
                                <option value="309" text="兴业银行" selected="selected">兴业银行</option>
                                <option value="310" text="上海浦东发展银行" selected="selected">上海浦东发展银行</option>
                                <option value="422" text="河北银行" selected="selected">河北银行</option>
                                <option value="440" text="徽商银行" selected="selected">徽商银行</option>
                                <option value="1434" text="尧都农村商业银行" selected="selected">尧都农村商业银行</option>
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
                                                       defaulttext="请输入关键字搜索">
                                                <input type="button" class="input-2" style="cursor: pointer;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="display: none;" class="lblinput">
                                <input type="text" class="input-1" id="txtinput" value="">
                            </div>
                            <a href="javascript:void(0);" class="fsxz">手动输入支行全称</a>

                            <div style="clear: both;">
                            </div>
                            <span class="red " id="lblinputmsg" style="position: absolute;"></span>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="calculator-btn">
                    <input type="submit" value="确  认" isrefresh="false">
                    <input type="button" class="reset" value="取  消" close-ui="bankadd">
                </div>
            </div>
        </div>
    </div>
</form>


<div id="divbindmobile" class="prompt_box">
    <div style="width: 704px; left: -352px;" class="bank-add-box">
        <h3 class="title">
            尧都农商银行投融资平台提醒您<a href="javascript:void(0)" class="close" close-ui="divbindmobile"></a></h3>

        <div class="bank-alter-text">
            <p class="note-content">
                请您到新打开页面完成手机号码绑定修改</p>
        </div>
        <div class="calculator-btn">
            <input type="button" value="已完成绑定" close-ui="divbindmobile">
        </div>
    </div>
</div>

<div id="bankorder" class="prompt_box">
    <div style="width: 704px; left: -352px;" class="bank-add-box">
        <h3 class="title">
            e融九州投融资平台提醒您<a class="close" href="javascript:void(0)"></a></h3>

        <div class="bank-alter-text">
            <p class="note-content">
                请你到新打开的网银页面进行支付，支付完成前请不要关闭该窗口</p>
            帮助： <a href="https://e.ydnsh.com/FAQ/Common?q=q4" target="_blank" class="blue">支付遇到问题了？</a>
        </div>
        <div class="calculator-btn">
            <input type="button" value="已完成支付">
            <input type="button" value="修改付款银行" class="alter">
        </div>
    </div>
</div>
<div class="prompt_box" style="z-index: 10000;" id="divonlinebank">
    <div style="left: -335px; top: -225px; width: 670px; height: 450px;" class="prompt_inner ui-window-1">
        <h3 class="title">
            <span class="ico_3">e融九州投融资平台提醒您</span><a href="javascript:void(0)" class="close"
                                                      close-ui="divonlinebank"></a></h3>

        <div class="pay-pop">
            <img alt="" src="./我要投资_e融九州_files/defrayimg_11.png"></div>
        <div class="pay-pop-bun">
            <input type="checkbox" value="" id="choIsTip">&nbsp;下次不再提醒<p>
        </p>
            <span>
                <input type="button" style="cursor: pointer"></span>
        </div>
    </div>
</div>

<div class="prompt_box" id="win_GongGao">
    <div class="prompt_inner ck_1" style="width:400px;height:250px;left:-200px;">
        <h3 class="title">温馨提示<a href="javascript:void(0)" class="close"></a></h3>

        <div class="content">
            <div style="margin-top:0px;">
                <div class="gg-list">
                    <span><b>尧都农商银行借记卡投资温馨说明</b> <strong>2014-10-30</strong> </span>

                    <p>
                        您好！欢迎您访问e融九州投融资平台，您在投资中若使用尧都农商银行借记卡（信合通卡、天河卡）投资，需提前持有效身份证件和银行卡到其任意网点办理开通银联无卡支付业务，交易限额为单笔50000元，日累计100000元，详询客服专线4000496518，给您带来的不便敬请谅解。
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="prompt_box" id="bank-add">
    <div class="prompt_inner ui-window-1">
        <h3 class="title"><span class="ico_2">重要提醒</span><a href="javascript:void(0)" class="close"></a></h3>

        <div class="bank-alter-text">
            <p class="note-content"><b>本次投资回收的本金和利息到期后将汇入此账户</b>，请确认以下信息无误后再进行支付：</p>
            <table class="qrww" cellspacing="1">
                <tbody>
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
                </tbody>
            </table>
        </div>
        <div class="calculator-btn">
            <input type="button" value="确认">
            <input type="button" class="reset close" value="返回修改">
        </div>
    </div>
</div>


<p class="mouseTips" style="left: 599px; top: 942px; display: none;">
    项目委托第三方支付公司——中金支付有限公司进行资金监管及清算服务。尧都银行对融资方还款环节中到期应收款项的兑付过程进行控制。</p>


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
                        <input type="text" size="20" class="textFild" id="jsqAmonut">
                        元
                    </td>
                </tr>
                <tr>
                    <th>
                        预期年化利率 ：
                    </th>
                    <td align="left" valign="middle">
                        <input type="text" size="20" class="textFild" id="jsqYint">
                        %
                    </td>
                </tr>
                <tr>
                    <th>
                        投资期限：
                    </th>
                    <td align="left" valign="middle">
                        <input type="text" size="20" class="textFild" id="jsqDay">
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
                <input type="button" value="计算" id="jsqcalculate">
                <input type="button" class="reset" value="重置">
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


<div class="blackBg" style="display: none;">
</div>


<div class="prompt_box" id="rzsq" style=" display:none">
    <div class="prompt_inner ck_1 ui-window-1">
        <h3 class="title">
            <span class="ico_1">融资申请登记</span><a href="javascript:void(0)" class="close"></a></h3>

        <div class="content" style="height:300px;overflow-y:scroll;">
            <div id="divFinancingIntentionApply">
                <table class="table-yxdj" cellspacing="0">
                    <tbody>
                    <tr>
                        <td colspan="2" class="td-3">
                            <span>暂且仅受理山西省太原地区和临汾地区的融资申请；<br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提交申请后，我们将会有专门人员与您联系。</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            <b>*</b> 申请人姓名：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtFinanciersName" size="20" class="textFild" maxlength="20">
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
                            <input type="text" id="txtAddress" size="20" class="textFild" maxlength="100">
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            主营业务：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtMainBusiness" size="20" class="textFild" maxlength="200">
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            <b>*</b> 融资用途：
                        </td>
                        <td class="td-2">
                            <textarea cols="1" rows="2" id="txtFinancingPurposes" class="textFild">200字以内</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            <b>*</b> 期望融资金额：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtFinancingAmount" rtip="最低10万元" size="20" class="textFild mR"
                                   maxlength="10">万元
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
                            <input type="text" id="txtFinancingInterest" size="20" class="textFild mR">%
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            <b>*</b> 手机号码：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtPhoneNum" rtip="请输入手机号码" size="20" class="textFild">
                        </td>
                    </tr>
                    <tr>
                        <td class="td-1">
                            E-mail：
                        </td>
                        <td class="td-2">
                            <input type="text" id="txtFinancingEmail" rtip="请输入邮箱地址" size="20" class="textFild">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="td-4">
                            <input id="btnSubmitIntentionApply" type="button" value="提交">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="ts" style="margin-top: 80px; text-align: center ; display:none;" id="divSuccessTip">
                <img src="./我要投资_e融九州_files/firm_info_34.png" align="absmiddle">&nbsp;&nbsp;<span
                    style="font-size: 24px;">提交成功！</span><br>

                <p style="font-weight: 400; margin-top: 15px;">
                    我们将会有专门人员与您联系，请耐心等候。</p>
            </div>
        </div>
    </div>
</div>

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
            url: '/Ajax/ProcessRequest',
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


<div id="divQQbox" class="advisory" style="top: 164.5px;">
    <div class="rzsq-kf openWindow" open_win="rzsq"
         action-data="rzsq||ui-window-1||480||400||canDrag||absolute||inIframe" style="cursor: pointer;">
        <a href="javascript:void(0)">融资申请登记</a>
    </div>

    <a href="javascript:void(0)" class="close_kf"></a><a href="javascript:void(0)" class="show_kf">
</a>

    <div class="service-phone">
        客服专线<br>
        <span>400-04-96518</span>
    </div>
    <div class="receipts" open_win="win_Jsq" open_win_position="0" style="cursor: pointer;">
        <a href="javascript:void(0)">收益计算</a></div>
</div>
<div style="z-index: 10000; top: 100px; display: none;" class="prompt_box" id="Borrowservice">
    <div style="width: 740px; left: -370px; display: block;" class="prompt_inner">
        <h3 class="title">
            <span class="ico_3">尧都农商银行提醒您</span><a class="close" href="javascript:void()"></a></h3>

        <div style="padding-right: 0; padding-bottom: 0px; overflow: hidden" class="content">
            <iframe width="100%" height="380px" frameborder="no" src="./我要投资_e融九州_files/BorrowService.htm"
                    allowtransparency="true" scrolling="yes" id="frame_content" name="czWindow">
            </iframe>
        </div>

    </div>
</div>
<script type="text/javascript">
    $(".close_kf").click(function () {
        $.cookie('closecustom', '1', {path: '/', domain: 'e.ydnsh.com'});
        $(this).parent().animate({right: -$(this).parent().width()}, 300, "easeOutQuint");
        $(this).siblings(".show_kf").show();
        $(this).siblings(".show_kf").animate({left: -$(this).siblings(".show_kf").width() / 2}, 300, "easeInElastic");
    });
    $(".show_kf").mouseover(function () {
        $.cookie('closecustom', '0', {path: '/', domain: 'e.ydnsh.com'});
        $(this).hide();
        $(this).parent().animate({right: 0}, 300, "easeOutQuint");
        $(this).css({left: 100});
    });
</script>

<div class="mod-footer">
    <div class="footer-wrap">
        <div class="ui-guide">

            <dl class="ui-guide-item f-left">
                <dt>
                    <img src="./我要投资_e融九州_files/footer2.gif" alt="关于尧都农商银行"></dt>
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
                    <img src="./我要投资_e融九州_files/footer3.gif" alt="关于尧都农商银行"></dt>
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
                                <img alt="尧都银行微信二维码" src="./我要投资_e融九州_files/ewm.png"></b>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="copyright">
            <p>
                <img src="./我要投资_e融九州_files/qthl_logo.png" alt="前途互联"></p>

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
<a href="javascript:void(0)" id="scrolltop" style="right: 0px; bottom: 0px; position: fixed; display: none;"
   class="backTop">
    <img src="./我要投资_e融九州_files/backTop.png"></a>
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


<input type="hidden" id="hidbankenum"
       value="&lt;option value=&#39;100&#39; text=&#39;中国邮政储蓄银行&#39; selected=&#39;selected&#39;&gt;中国邮政储蓄银行&lt;/option&gt;&lt;option value=&#39;102&#39; text=&#39;中国工商银行&#39; selected=&#39;selected&#39;&gt;中国工商银行&lt;/option&gt;&lt;option value=&#39;103&#39; text=&#39;中国农业银行&#39; selected=&#39;selected&#39;&gt;中国农业银行&lt;/option&gt;&lt;option value=&#39;104&#39; text=&#39;中国银行&#39; selected=&#39;selected&#39;&gt;中国银行&lt;/option&gt;&lt;option value=&#39;105&#39; text=&#39;中国建设银行&#39; selected=&#39;selected&#39;&gt;中国建设银行&lt;/option&gt;&lt;option value=&#39;301&#39; text=&#39;交通银行&#39; selected=&#39;selected&#39;&gt;交通银行&lt;/option&gt;&lt;option value=&#39;302&#39; text=&#39;中信银行&#39; selected=&#39;selected&#39;&gt;中信银行&lt;/option&gt;&lt;option value=&#39;303&#39; text=&#39;中国光大银行&#39; selected=&#39;selected&#39;&gt;中国光大银行&lt;/option&gt;&lt;option value=&#39;304&#39; text=&#39;华夏银行&#39; selected=&#39;selected&#39;&gt;华夏银行&lt;/option&gt;&lt;option value=&#39;305&#39; text=&#39;中国民生银行&#39; selected=&#39;selected&#39;&gt;中国民生银行&lt;/option&gt;&lt;option value=&#39;306&#39; text=&#39;广发银行&#39; selected=&#39;selected&#39;&gt;广发银行&lt;/option&gt;&lt;option value=&#39;307&#39; text=&#39;平安银行&#39; selected=&#39;selected&#39;&gt;平安银行&lt;/option&gt;&lt;option value=&#39;308&#39; text=&#39;招商银行&#39; selected=&#39;selected&#39;&gt;招商银行&lt;/option&gt;&lt;option value=&#39;309&#39; text=&#39;兴业银行&#39; selected=&#39;selected&#39;&gt;兴业银行&lt;/option&gt;&lt;option value=&#39;310&#39; text=&#39;上海浦东发展银行&#39; selected=&#39;selected&#39;&gt;上海浦东发展银行&lt;/option&gt;&lt;option value=&#39;422&#39; text=&#39;河北银行&#39; selected=&#39;selected&#39;&gt;河北银行&lt;/option&gt;&lt;option value=&#39;440&#39; text=&#39;徽商银行&#39; selected=&#39;selected&#39;&gt;徽商银行&lt;/option&gt;&lt;option value=&#39;1434&#39; text=&#39;尧都农村商业银行&#39; selected=&#39;selected&#39;&gt;尧都农村商业银行&lt;/option&gt;">
</body>
</html>