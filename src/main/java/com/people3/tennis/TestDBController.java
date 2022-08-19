package com.people3.tennis;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.people3.model.mapper.TestMapper;

import lombok.SneakyThrows;

@Controller
public class TestDBController {
	
	@Inject
	TestMapper testMapper;
	
	@SneakyThrows
	@RequestMapping(value = "/testDB.do")
	public void testDB(HttpServletResponse res) {
		
		PrintWriter out = res.getWriter();
		String now = testMapper.testDB();
		out.print(now);
	}
}
