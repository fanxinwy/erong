package nw.mvc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nw.verification.VariableNames;
import nw.verification.image.VerifyCodeUtils;
import nw.verification.message.support.DefaultMessageProcessor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("code")
public class CodeController {

	@RequestMapping(value = "phone/{phonenumb}", method = RequestMethod.GET)
	@ResponseBody
	public void shortMessage(HttpSession session, @PathVariable String phonenumb) {
		session.setAttribute(VariableNames.MSG_VERIFY_CODE, new DefaultMessageProcessor().getCode(phonenumb, 4));
		System.out.println(phonenumb);
	}

	@RequestMapping(value = "image", method = RequestMethod.GET)
	public void imageVerifyCode(HttpSession session, HttpServletResponse response,
			@RequestParam(required = false, defaultValue = "200") int w,
			@RequestParam(required = false, defaultValue = "80") int h) throws IOException {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");

		// 生成随机字串
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		// 存入会话session
		session.setAttribute(VariableNames.IMG_VERIFY_CODE, verifyCode.toLowerCase());
		// 生成图片
		// int w = 200, h = 80;
		VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);

	}

}
