package com.people3.tennis;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.people3.model.mapper.TennisPdtMapper;
import com.people3.model.vo.TennisPdt;

@Controller
public class TennisPdtController {

	@Inject
	private TennisPdtMapper mapper;
	
	@RequestMapping(value = "/productlist.do")
	public String productlistForm(Model model) {
		List<TennisPdt> list = mapper.list();
		model.addAttribute("list", list);
		System.out.println(list.size());
		return "productlist";
	}
	
}
