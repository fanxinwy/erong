
var fValidator;
//扩展手机号码验证
jQuery.validator.addMethod("mobile", function (value, element) {
    return this.optional(element) || /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|17[0-9])[0-9]{8}$/.test(value);
}, "请输入正确的手机号码");
jQuery.validator.addMethod("account", function (value, element, params) {
    return this.optional(element) || /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|17[0-9])[0-9]{8}$/.test(value) || UcsValidate.EmailValidate(value);
}, "请输入注册的手机号码或者邮箱");
//扩展密码强度验证
jQuery.validator.addMethod("password", function (value, element) {
    return this.optional(element) || /^(?=.*?[a-zA-Z])(?=.*?[0-9])[a-zA-Z0-9]{6,}$/.test(value);
}, "请输入6-12位数字或字母组合作为登录密码");

jQuery.validator.addMethod("noteq", function (value, element) {
    return this.optional(element) || value != $(element).attr("defaulttext");
}, "");
jQuery.validator.addMethod("chinese", function (value, element) {
    return this.optional(element) || /^[\u4E00-\u9FA5\uF900-\uFA2D]+$/.test(value);
}, "");
jQuery.validator.addMethod("IdCard", function (value, element) {
    return this.optional(element) || /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(value);
}, "");
jQuery.validator.addMethod("Cname", function (value, element) {
    return this.optional(element) || /^[\u4E00-\u9FA5\uF900-\uFA2D]+$/.test(value) || /^[a-zA-Z]+$/.test(value) || /^[\u4E00-\u9FA5\uF900-\uFA2Da-zA-Z]+$/.test(value);
}, "");
jQuery.validator.addMethod("EnglishAndNum", function (value, element) {
    return this.optional(element) || /^[0-9]+$/.test(value) || /^[a-zA-Z]+$/.test(value) || /^[a-zA-Z0-9]+$/.test(value);
}, "");

$(function () {
    $.metadata.setType("attr", "validate");
    fValidator = $(document.forms).validate({
        ignore: ".ignore",
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
		        for (var i = 0; i < errorList.length; i++) {
		            var tdElement = this.hideError(errorList[i].element);

		            var errorTd = "<img class=\"error-ts\" src=\"content/images/icon_c.png\">";

		            $(errorTd).insertAfter(errorList[i].element);

		            $(".v_err", getelement(errorList[i].element)).show();
		            $(".ts-red", getelement(errorList[i].element)).text(errorList[i].message);
		        }
		    },
		    hideErrors: function (elements) {
		        for (var i = 0; i < elements.length; i++) {
		            this.hideError(elements[i]);
		        }
		    },
		    hideError: function (element) {
		        var curE = $("#" + element.id);
		        //td 
		        var tdElement = curE.parents("td");
		        //tr
		        //var trElement = tdElement.parent();
		        //清除错误图标
		        //		        curE.nextAll(".error").remove();
		        //		        //清除错误提示
		        //		        //tdElement.nextAll(".errorMsg").html("");
		        //		        tdElement.children(".error").remove();
		        //		        getelement(element).children(".error").remove();
		        $(".error-ts", element.parentNode).hide();
		        $(".correct-ts", element.parentNode).hide();

		        $(".v_err", getelement(element)).hide();
		        $(".v_suc", getelement(element)).hide();
		        return tdElement;

		    },
		    success: function (elements) {
		        for (var i = 0; i < elements.length; i++) {
		            this.successone(elements[i]);
		        }
		    },
		    successone: function (element) {

		        var errorTd = "<img class=\"correct-ts\" src=\"content/images/icon_o.png\">";
		        $(errorTd).insertAfter(element);
		        $(".v_suc", getelement(element)).show();
		        // $(imgRight).insertAfter(element);

		    }
		}
function getelement(obj) {

    if ($(obj).parent(".msg_div").length == 0) {
        return getelement($(obj).parent());
    } else {
        return $(obj).parent(".msg_div");
    }
}