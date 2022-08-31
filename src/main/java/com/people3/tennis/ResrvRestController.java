package com.people3.tennis;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.people3.model.mapper.TennisMapper;
import com.people3.model.vo.CLS;
import com.people3.model.vo.CTS;
import com.people3.model.vo.Coach;
import com.people3.model.vo.GJTennis;
import com.people3.model.vo.Reservation;

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
	
	@SneakyThrows
	@PostMapping(value = "/court/timesearch.do", produces = "application/text; charset=utf8")
	public String courtTimeSearch(CTS cts) {
		log.info("CTS ===> {}",cts);
		List<String> times = tmapper.selectCTS(cts);
		JsonObject obj = new JsonObject();
		for (int i = 0; i < times.size(); i++) {
			obj.addProperty(""+i, times.get(i));
		}
		obj.addProperty("length", times.size());
		return obj.toString();
	}
	
	@SneakyThrows
	@PostMapping(value = "/lesson/timesearch.do", produces = "application/text; charset=utf8")
	public String courtLessonSearch(CLS cls) {
		log.info("CLS ===> {}",cls);
		List<String> times = tmapper.selectCLS(cls);
		JsonObject obj = new JsonObject();
		for (int i = 0; i < times.size(); i++) {
			obj.addProperty(""+i, times.get(i));
		}
		obj.addProperty("length", times.size());
		return obj.toString();
	}
	
	@SneakyThrows
	@PostMapping(value = "/calendar/getall.do")
	public String calendarGetAll() {
//		log.info("Event 조회");
		List<JsonObject> events = new ArrayList<>();
		List<Reservation> resrvs = tmapper.selectEvents("test");
		for (Reservation resrv : resrvs) {
//			log.info("event ===> {}",resrv);
			String[] tmp = null;
			tmp = resrv.getRevTime().split("-");
			JsonObject obj = new JsonObject();
			obj.addProperty("title", resrv.getCourtCode() + " " + URLEncoder.encode(resrv.getRevType(),"UTF-8"));
			obj.addProperty("start", resrv.getRevDate() + " " + tmp[0]);
			obj.addProperty("end", resrv.getRevDate() + " " + tmp[1]);
			events.add(obj);
		}
		
		int i = 0;
		JsonObject rsv = new JsonObject();
		for (JsonObject obj : events) {
			rsv.add(""+i,obj);
			i++;
		}
		rsv.addProperty("length", events.size());
		log.error(rsv.toString());
		return rsv.toString();
	}
	
	@PostMapping(value = "/cancelResrv.do", produces = "application/json; charset=utf8")
	public String cancelResrv(Reservation resrv) {
		JsonObject obj = new JsonObject();
		resrv.setId("test");
		// log.info("data ===> {}",resrv);
		try {
			tmapper.deleteResrv(resrv);
			obj.addProperty("result", true);
		} catch (Exception e) {
			e.printStackTrace();
			obj.addProperty("result", false);
		}
		return obj.toString();
	}
}
