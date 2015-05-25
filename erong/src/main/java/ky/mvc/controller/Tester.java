package ky.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("tester")
public class Tester {

	private static final Logger LOGGER = LoggerFactory.getLogger(Tester.class);

	@RequestMapping(value = "**/*.tt")
	public void touch(HttpServletRequest request, HttpServletResponse response) {
		LOGGER.info(request.getRequestURI());
	}

}
