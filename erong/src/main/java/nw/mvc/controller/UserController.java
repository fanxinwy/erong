package nw.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import nw.entity.NwAccount;
import static nw.mvc.ResponseUtils.*;
import nw.service.UserService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "register", method = RequestMethod.POST, headers = "content-type=application/json")
	public NwAccount register(@Valid @RequestBody NwAccount body, BindingResult result) {
		try {
			userService.save(body);
		} catch (Exception e) {
			System.out.println("---" + e.getMessage());
			System.out.println("===" + e.getCause().getMessage());
		}
		return body;
	}

	@RequestMapping(value = "logon", method = RequestMethod.POST, headers = "content-type=application/json")
	public ModelAndView logon(@RequestBody NwAccount body, HttpServletRequest request) {
		if (StringUtils.isEmpty(body.getAccount()) || StringUtils.isEmpty(body.getPassword())) {
			return jsonView(501, "account or password could not be empty.");
		}
		NwAccount ka = userService.logon(body);
		if (ka == null) {
			return jsonView(502, "account is not exists or password is error.");
		}
		WebUtils.setSessionAttribute(request, UserService.TOKEN, ka.getId());
		WebUtils.setSessionAttribute(request, UserService.USERNAME, ka.getAccount());
		WebUtils.setSessionAttribute(request, UserService.PHONENUMBER, ka.getPhonenumb());
		return modelView("index");
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		/*
		WebUtils.setSessionAttribute(request, UserService.TOKEN, null);
		WebUtils.setSessionAttribute(request, UserService.USERNAME, null);
		WebUtils.setSessionAttribute(request, UserService.PHONENUMBER, null);
		*/
		HttpSession session = request.getSession(false);
		if(session != null){
			session.invalidate();
		}
		return "login";
	}

}