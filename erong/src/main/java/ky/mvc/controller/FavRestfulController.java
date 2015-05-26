package ky.mvc.controller;

import java.io.IOException;

import ky.entity.FavUser;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class FavRestfulController {

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

}