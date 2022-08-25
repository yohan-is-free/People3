package com.people3.tennis;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "main";
	}
	
	@RequestMapping(value = "/main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/login.do")
	public String loginForm() {
		return "login";
	}
	
	@RequestMapping(value = "/join.do")
	public String joinForm() {
		return "join";
	}
	
	@RequestMapping(value = "/boardlist.do")
	public String boardlistForm() {
		return "boardlist";
	}
	
	@RequestMapping(value = "/productlist.do")
	public String productlistForm() {
		return "productlist";
	}
}
