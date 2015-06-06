package nw.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import nw.entity.NwAccount;
import nw.mvc.ResponseUtils;
import nw.service.UserService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.WebUtils;

@RestController
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value="register",method=RequestMethod.POST,headers="content-type=application/json")
	public NwAccount register(@Valid @RequestBody NwAccount body, BindingResult result){
		try {
			userService.save(body);
		} catch (Exception e) {
			System.out.println("---"+e.getMessage());
			System.out.println("==="+e.getCause().getMessage());
		}
		return body;
	}
	
	@RequestMapping(value="logon",method=RequestMethod.POST,headers="content-type=application/json")
	public Object logon(@RequestBody NwAccount body, HttpServletRequest request){
		if(StringUtils.isEmpty(body.getAccount()) || StringUtils.isEmpty(body.getPassword())){
			return ResponseUtils.createBody(501, "account or password could not be empty.");
		}
		NwAccount ka = userService.logon(body);
		if(ka == null){
			return ResponseUtils.createBody(502, "account is not exists or password is error.");
		}
		WebUtils.setSessionAttribute(request, UserService.TOKEN, ka.getAccount());
		return ResponseUtils.createBody(ka);
	}

}