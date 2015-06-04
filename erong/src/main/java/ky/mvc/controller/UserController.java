package ky.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import ky.entity.KyAccount;
import ky.mvc.ResponseUtils;
import ky.service.UserService;

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
	public KyAccount register(@Valid @RequestBody KyAccount body, BindingResult result){
		try {
			userService.save(body);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return body;
	}
	
	@RequestMapping(value="logon",method=RequestMethod.POST,headers="content-type=application/json")
	public Object logon(@RequestBody KyAccount body, HttpServletRequest request){
		if(StringUtils.isEmpty(body.getAccount()) || StringUtils.isEmpty(body.getPassword())){
			return ResponseUtils.createBody(500, "account or password could not be empty.");
		}
		KyAccount ka = userService.logon(body);
		if(ka == null){
			return ResponseUtils.createBody(501, "account is not exists or password is error.");
		}
		WebUtils.setSessionAttribute(request, UserService.TOKEN, ka.getAccount());
		return ResponseUtils.createBody(ka);
	}
	
	

	/*
	@RequestMapping(value = "/getUserName", method = RequestMethod.POST)
	public String getUserName(@RequestParam(value = "name") String name) {
		return name;
	}

	@RequestMapping("getFavUser")
	public FavUser getFavUser(@RequestParam("userName") String userName,
			String userId, int userAge) {
		FavUser favUser = new FavUser();
		favUser.setUserId(userId);
		favUser.setUserName(userName);
		favUser.setUserAge(userAge);
		return favUser;
	}

	@RequestMapping("getFavUserBody")
	public FavUser getFavUserBody(@RequestBody String body) {
		ObjectMapper mapper = new ObjectMapper();
		FavUser favUser = null;
		try {
			favUser = mapper.readValue(body, FavUser.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(favUser);
		return favUser;
	}
	*/

}