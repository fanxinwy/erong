package nw.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index1() {
		return "index";
	}
	
	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	public String index2() {
		return "index";
	}

}
