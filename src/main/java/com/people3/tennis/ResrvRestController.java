package com.people3.tennis;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.people3.model.mapper.TennisMapper;
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
	@PostMapping("/tennissearch.do")
	public GJTennis search(@RequestParam Map<String, Object> reqParam) {
		
		log.error("진입 성공!!");
		GJTennis info = null;
		
		int courtNo = (int) reqParam.get("courtNo");
		
		info = tmapper.selectInfo(courtNo);
		info.setCourtCnt(tmapper.courtCnt(courtNo));
		info.setLesson(tmapper.isPossibleLesson(courtNo) >= 1);
		
		log.info("GJTInfo ===> {}",info);
		
		return info;	
	}
	
}
