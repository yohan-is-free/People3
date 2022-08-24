package com.people3.tennis;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.people3.model.mapper.TennisMapper;
import com.people3.model.vo.GJTennis;

import lombok.RequiredArgsConstructor;

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
		info.setCourtCnt(tmapper.courtCnt(courtNo).getCnt());
		info.setIsLesson(tmapper.isPossibleLesson(courtNo).getCnt() >= 1 ? "가능":"불가능");
		return "resrvDetail";
	}
}
