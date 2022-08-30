package com.people3.tennis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.people3.model.mapper.BoardMapper;
import com.people3.model.mapper.TestMapper;
import com.people3.model.vo.Board;



@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper;
	
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
	
	@GetMapping("/boardContent")
	public String boardContent(@RequestParam("boardNo") int boardNo, Model model) {
		Board vo = mapper.boardContent(boardNo);
//		조회수 증가
		mapper.boardCount(boardNo);
		model.addAttribute("vo", vo);
		return "boardContent";
	}
	
	@GetMapping("/boardDelete.do/{boardNo}")
	public String boardDelete(@PathVariable("boardNo") int boardNo) {
		mapper.boardDelete(boardNo);
		return "redirect:/board.do";
	}
	
	@GetMapping("/boardUpdateForm.do")
	public String boardUpdateForm(int boardNo, Model model) {
		Board vo = mapper.boardContent(boardNo);
		model.addAttribute("vo", vo);
		return "boardUpdate";
	}
	
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) {
		mapper.boardUpdate(vo);
		return "redirect:/board.do";
	}
	
	
}
