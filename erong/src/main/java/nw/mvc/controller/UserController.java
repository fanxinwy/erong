package nw.mvc.controller;

import static nw.mvc.ResponseUtils.jsonView;
import static nw.mvc.ResponseUtils.modelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import nw.entity.NwAccount;
import nw.service.UserService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

@Controller("userController")
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private Md5PasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "register", method = RequestMethod.POST, headers = "content-type=application/json")
	public ModelAndView register(@Valid @RequestBody NwAccount body, BindingResult result) {
		if (StringUtils.isEmpty(body.getPhonenumb()) || StringUtils.isEmpty(body.getPassword())) {
			return jsonView(501, "phonenumber or password could not be empty.");
		}
		try {
			body.setPassword(passwordEncoder.encodePassword(body.getPassword(), null));
			userService.save(body);
		} catch (Exception e) {
			String msg = e.getMessage();
			if(e.getCause() != null){
				msg = e.getCause().getMessage();
			}
			return jsonView(502, msg);
		}
		return modelView("index");
	}

	@RequestMapping(value = "logon", method = RequestMethod.POST, headers = "content-type=application/json")
	public ModelAndView logon(@RequestBody NwAccount body, HttpServletRequest request) {
		if (StringUtils.isEmpty(body.getAccount()) || StringUtils.isEmpty(body.getPassword())) {
			return jsonView(501, "account or password could not be empty.");
		}
		body.setPassword(passwordEncoder.encodePassword(body.getPassword(), null));
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
		WebUtils.setSessionAttribute(request, UserService.TOKEN, null);
		WebUtils.setSessionAttribute(request, UserService.USERNAME, null);
		WebUtils.setSessionAttribute(request, UserService.PHONENUMBER, null);
		HttpSession session = request.getSession(false);
		if(session != null){
			session.invalidate();
		}
		return "login";
	}

}