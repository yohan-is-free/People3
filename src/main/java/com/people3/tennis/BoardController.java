package com.people3.tennis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.people3.model.mapper.TestMapper;
import com.people3.model.vo.Board;



@Controller
public class BoardController {
	
	@Autowired
	private TestMapper mapper;
	
	@RequestMapping("/board.do")
	public String boardList(Model model) {
		
		List<Board> list = mapper.getLists();	
		model.addAttribute("list", list);
		
		return "board"; // /WEB-INF/views/boardList.jsp ->forward
		
	}
	
	@GetMapping("/boardForm.do")
	public String boardForm() { //   /WEB-INF/views/boardList.jsp ->forward
		return "boardForm";
	}
	
	
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board vo) { // title, content, writer 파라메터 수집(Board)
		mapper.boardInsert(vo);
		return "redirect:/board.do"; // redirect
	}
	
	
	
}
