package com.people3.tennis;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public GJTennis search(String courtNo) {
		
		log.error("진입 성공!!");
		GJTennis info = null;
		
		info = tmapper.selectInfo(courtNo);
		info.setCourtCnt(tmapper.courtCnt(courtNo));
		info.setLesson(tmapper.isPossibleLesson(courtNo) >= 1);
		
		log.info("GJTInfo ===> {}",info);
		
		return info;	
	}
	
}
