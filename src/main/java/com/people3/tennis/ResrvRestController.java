package com.people3.tennis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.people3.model.mapper.TennisMapper;
import com.people3.model.vo.Coach;
import com.people3.model.vo.GJTennis;

import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
public class ResrvRestController {
	
	final private TennisMapper tmapper;
	
	@SneakyThrows
	@RequestMapping(value = "/tennissearch.do", produces = "application/text; charset=utf8")
	public String search(int courtNo) {
		
//		log.info("진입 성공!! ===> {}",courtNo);
		GJTennis info = null;
		
		info = tmapper.selectInfo(courtNo);
		info.setCourtCnt(tmapper.courtCnt(courtNo).getCnt());
		List<Coach> coachs = tmapper.selectCoachs(courtNo);
		info.setIsLesson(coachs.size() >= 1 ? "가능":"불가능");
		
//		log.info("GJTInfo ===> {}",info);
		
		JsonObject obj = new JsonObject();
		obj.addProperty("courtAddr", info.getCourtAddr());
		obj.addProperty("courtName",info.getCourtName());
		obj.addProperty("courtTel",info.getCourtTel());
		obj.addProperty("courtCnt",info.getCourtCnt());
		obj.addProperty("lesson",info.getIsLesson());		
		obj.addProperty("imgPath",info.getImgPath());
		
		return obj.toString();	
	}
	
}
