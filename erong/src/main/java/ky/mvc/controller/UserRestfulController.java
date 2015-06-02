package ky.mvc.controller;

import java.io.IOException;

import ky.dao.support.KyAccountDAO;
import ky.entity.KyAccount;
import ky.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("user")
public class UserRestfulController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("register")
	public KyAccount getUser(@RequestBody String body){
		System.out.println(body);
		ObjectMapper mapper = new ObjectMapper();
		KyAccount ka = null;
		try {
			ka = mapper.readValue(body, KyAccount.class);
			userService.save(ka);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ka;
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