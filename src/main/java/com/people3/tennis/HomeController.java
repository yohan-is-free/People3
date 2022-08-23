package com.people3.tennis;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.people3.model.mapper.TennisMapper;
import com.people3.model.vo.GJTennis;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	TennisMapper tmapper;
	
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
	
	@RequestMapping(value = "/resrv.do")
	public String resrvForm(Model model) {
		List<GJTennis> list = tmapper.selectTA();
		// 확인
		// list.stream().forEach(tennis -> log.info("테니스장 정보 : {}",tennis));
		model.addAttribute("GJTennisInfo",list);
		return "resrv";
	}
}
