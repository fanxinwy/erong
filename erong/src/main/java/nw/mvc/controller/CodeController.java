package nw.mvc.controller;

import static nw.mvc.ResponseUtils.jsonView;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nw.verification.image.VerifyCodeUtils;
import nw.verification.message.MessageProcessor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("code")
public class CodeController {
	
	public static final String VERIFY_CODE = "verifycode";
	
	@Autowired
	private MessageProcessor messageProcessor;

	@RequestMapping(value = "phone/{phonenumb}", method = RequestMethod.GET)
	public ModelAndView shortMessage(HttpSession session, @PathVariable String phonenumb) {
		Map<String, String> data = new HashMap<>();
		data.put("phonenumber", phonenumb);
		data.put(VERIFY_CODE, messageProcessor.getCode(phonenumb));
		return jsonView(data);
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
		session.setAttribute(VERIFY_CODE, verifyCode.toLowerCase());
		// 生成图片
		// int w = 200, h = 80;
		VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);

	}

}
