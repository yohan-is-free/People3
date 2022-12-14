package com.people3.tennis;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.people3.model.mapper.MemberMapper;
import com.people3.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@RequestMapping(value = "/login.do")
	public String loginForm() {
		return "login";
	}
	
	@RequestMapping(value = "/join.do")
	public String joinForm() {
		return "join";
	}
	
	@Autowired
	private MemberMapper mapper;
	
	@RequestMapping("/Register.do")
	public String Register(Member vo) {
		mapper.Register(vo);
		return "login";
	}
	
	@RequestMapping("/idcheck.do")
	public @ResponseBody List<Member> idcheck(String id) {
		List<Member> list = mapper.idcheck(id);
		return list;
	}
	
	@RequestMapping("/go")
	public String login(Member vo, HttpSession session) {
		Member member = mapper.login(vo);
		
		if (member==null) {
			return "login";
		}
		log.info("member ===> {}",member);
		session.setAttribute("member", member);
		log.info("member ===> {}",session.getAttribute("member"));
		return "main";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		return "main";
	}
	
	@PostMapping("/loginCheck.do")
	@ResponseBody
	public String loginCheck(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		
		if (member == null) {
			return "false";
		}
		return "true";
	}
	

}
