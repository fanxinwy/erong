function clearDefault(jel) {
    if (jel.val() == jel.attr("defaultText")) {
        jel.val("");
    }
}
function setDefault(jel) {
    if (jel.val() == "") {
        jel.val(jel.attr("defaultText"));
    }
}
jQuery.validator.addMethod("mobile", function (value, element) {
    return this.optional(element) || /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|17[0-9])[0-9]{8}$/.test(value);
}, "请输入正确的手机号码");
jQuery.validator.addMethod("account", function (value, element, params) {
    return this.optional(element) || /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|17[0-9])[0-9]{8}$/.test(value) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(value);
}, "请输入注册的手机号码或者邮箱");
//扩展密码强度验证
jQuery.validator.addMethod("password", function (value, element) {
    return this.optional(element) || /^[\@A-Za-z0-9\~\!@\#\$\%\^\&\*\.\(\)\{\}]*$/.test(value);
}, "请输入6-12位数字或字母组合作为登录密码");

jQuery.validator.addMethod("noteq", function (value, element) {
    return this.optional(element) || value != $(element).attr("defaulttext");
}, "");
$(function () {
    $.metadata.setType("attr", "validate");
    fValidator = $(document.forms).validate({
        onkeyup: false,
        showErrors: function (errorMap, errorList) {
            validateHelper.hideErrors(fValidator.currentElements);
            validateHelper.showErrors(errorMap, errorList);
            //都成功
            if (errorList.length == 0) {
                validateHelper.success(fValidator.currentElements);
            }
        }
    });

});
//包含错误信息的td必须设置class="errorMsg"
var validateHelper =
		{
		    showErrors: function (errorMap, errorList) {
		        if (errorList.length > 0) {
		            var tdElement = this.hideError(errorList[0].element);
		            $("#show_error").html("<div class=\"ui-error\"><b class=\"icon-error\"></b>" + errorList[0].message + "</div>")
		        }
		    },
		    hideErrors: function (elements) {
		        $("#show_error").html('');
		    },
		    hideError: function (element) {
		        $("#show_error").html('');
		        return element;
		    },
		    success: function (elements) {
		        for (var i = 0; i < elements.length; i++) {
		            this.successone(elements[i]);
		        }
		    },
		    successone: function (element) {
		        $("#show_error").html("");

		    }
		}
$(function () {
    $(document.forms).each(function () {
        $(":input[defaultText]").live("focus", function () {
            clearDefault($(this));
        }).live("blur", function () {
            setDefault($(this));
        });
    });
});
function UrlParamsToObject() {
    var URLParams = {};
    var aParams = window.location.search.substr(1).split('&');
    for (i = 0; i < aParams.length; i++) {
        var p = aParams[i].split('=');
        URLParams[p[0]] = decodeURIComponent(p[1]);
    }
    return URLParams;
}
$("[Qiantu_TxtUsername=Qiantu]").live("blur", function () {
    var txt = $(this);
    var l_Type = $(txt).attr("L_Type");
    var show_error = $("[show_error=Qiantu]");
    if (txt.val() == "") { $(show_error).hide(); return; }
    if (!UcsValidate.Mobile_EmailValidate(txt.val())) {
        ShowErrorMsg(l_Type, "请输入正确的手机号码！");
        return;
    }

    var submitData = {};
    submitData.targetAction = "CheckUserName";
    submitData.UserName = txt.val();
    RenderTmpl({
        Data: submitData,
        Async: false,
        SucessFn: function (result) {
            $(show_error).hide();
        },
        ErrorFn: function (result) {
            ShowErrorMsg(l_Type, result.Message);
            $(this).focus();
            return false;
        }
    });
});
$("[Qiantu_BtnLogin=Qiantu]").live("click", function () {
    var btn = $(this);
    var l_Type = $(btn).attr("L_Type");
    var show_error = $("[show_error=Qiantu]");

    var userName = $("[Qiantu_TxtUsername=Qiantu]").val();
    var pwd = $("[Qiantu_TxtPwd=Qiantu]").val();
    var chkbox = $("[Qiantu_Chkbox=Qiantu]").attr("checked");

    var url = UrlParamsToObject()["RequestUrl"];
    if (!UcsValidate.Mobile_EmailValidate(userName)) {
        ShowErrorMsg(l_Type, "请输入正确的手机号码！");
        return;
    }
    if (!pwd || pwd == "") {
        ShowErrorMsg(l_Type, "请输入密码！");
        return;
    }

    var submitData = {};
    submitData.account = userName;
    submitData.password = pwd;
    $("#btnLogin").attr("disabled", "1");
    $("#btnLogin").addClass("lg-submit-btn-gray");
    $("#btnLogin").attr("value", "登 录 中 ...");

    RenderTmpl({
        Url:'user/logon',
        Data: submitData,
        Async: false,
        SucessFn: function (result) {
            if (result.DicData != null) {
                window.location.href = result.DicData.RequestUrl;
            }
            else {
                window.location.href = "index.html";
            }
        },
        ErrorFn: function (result) {
            ShowErrorMsg(l_Type, result.Message);
            if (result.DicData != null) {
                $.ajax({
                    url: '/Account/LoginSendEmail',
                    type: 'post',
                    data: result.DicData,
                    dataType: 'text',
                    error: function (err) {
                        alert("脚本执行异常，请刷新页面重试(ajax error)：" + err.statusText);
                    },
                    success: function (result) {
                    }
                });
            }
            return false;
        }
    });
})
function ShowErrorMsg(l_Type, msg) {
    $("#btnLogin").removeAttr("disabled");
    $("#btnLogin").removeClass("lg-submit-btn-gray");
    $("#btnLogin").attr("value", "登   录");

    var show_error = $("[show_error=Qiantu]");
    if (l_Type == "0") {
        $(show_error).html("<div class=\"ui-error\"><b class=\"icon-error\"></b>" + msg + "</div>");
    }
    else {
        $(show_error).html('<em class="iconfont"></em><span class="error-text">' + msg + '</span>');
    }
    $(show_error).show();
}