package com.people3.tennis;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.people3.model.mapper.TennisMapper;
import com.people3.model.vo.Coach;
import com.people3.model.vo.GJTennis;
import com.people3.model.vo.Reservation;
import com.people3.model.vo.TennisCourt;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ResrvController {
	
	private final TennisMapper tmapper;

	@RequestMapping(value = "/resrv.do")
	public String resrvForm(Model model) {
		List<GJTennis> list = tmapper.selectTA();
		// 확인
		// list.stream().forEach(tennis -> log.info("테니스장 정보 : {}",tennis));
		model.addAttribute("GJTennisInfo",list);
		return "resrv";
	}
	
	@RequestMapping(value = "/resrvDetail.do")
	public String resrvDetailForm(Model model, int courtNo) {
		
		GJTennis info = null;
		info = tmapper.selectInfo(courtNo);
		List<TennisCourt> courts = tmapper.selectCourts(courtNo);
		List<Coach> coachs = tmapper.selectCoachs(courtNo);
		info.setCourtCnt(courts.size());
		info.setIsLesson(coachs.size() >= 1 ? "가능":"불가능");
		
		model.addAttribute("GJTInfo",info);
		model.addAttribute("courts",courts);
		model.addAttribute("coachs",coachs);
		
		/*
		 * log.info("GJTInfo ===> {}",info); for (TennisCourt court : courts) {
		 * log.info("court ===> {}",court); }
		 * 
		 * for (Coach coach : coachs) { log.info("coach ===> {}",coach); }
		 */
		
		return "resrvDetail";
	}
	
	@RequestMapping("/resrvShow.do")
	public String resrcShow() {
		return "resrvShow";
	}
	
	@PostMapping("/courtResrv.do")
	public String saveCourtResrv(HttpSession session, Reservation resrv) {
		resrv.setId("test");
		resrv.setRevType("코트 사용");
		log.info("ResrvInfo ===> {}",resrv);
		tmapper.insertCourtResrv(resrv);
		return "redirect:/resrvShow.do";
	}
	
	@PostMapping("/lessonResrv.do")
	public String saveLessonResrv(HttpSession session, Reservation resrv) {
		resrv.setId("test");
		resrv.setRevType("레슨 수강");
		log.info("ResrvInfo ===> {}",resrv);
		tmapper.insertLessonResrv(resrv);
		return "redirect:/resrvShow.do";
	}
}
