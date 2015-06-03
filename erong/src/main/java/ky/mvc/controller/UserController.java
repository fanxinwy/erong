package ky.mvc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import ky.entity.KyAccount;
import ky.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value="register",method=RequestMethod.POST,headers="content-type=application/json")
	public KyAccount getUser(@Valid @RequestBody KyAccount body, BindingResult result){
		try {
			userService.save(body);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return body;
	}
	
	@RequestMapping(value="logon",method=RequestMethod.POST,headers="content-type=application/json")
	public Map<String, Object> logon(@RequestBody KyAccount body){
		String account = body.getAccount();
		
		Map<String, Object> r = new HashMap<String, Object>();
		System.out.println(body);
		return r;
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