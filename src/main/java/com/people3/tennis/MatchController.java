package com.people3.tennis;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatchController {
	
	@RequestMapping("/match.do")
	public String match() {
		return "match";
	}
	
}
