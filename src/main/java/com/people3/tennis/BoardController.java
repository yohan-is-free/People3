package com.people3.tennis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.people3.model.mapper.TestMapper;
import com.people3.model.vo.Board;



@Controller
public class BoardController {
	
	@Autowired
	private TestMapper mapper;
	
	@RequestMapping("/board.do")
	public String boardList(Model model) {
		
		System.out.println(11);
		
		List<Board> list = mapper.getLists();	
	
		model.addAttribute("list", list);
		
		System.out.println(list.get(0).toString());
		return "board"; // /WEB-INF/views/boardList.jsp ->forward
		
	}
	
}
