package org.slam.web;

import javax.inject.Inject;


import org.slam.dto.Criteria;
import org.slam.service.ReturnService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/return/*")
public class ReturnController {

	@Inject
	ReturnService service;

	//대여 물품 리스트 페이지
	@GetMapping("/list")
	public void getList(@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("list",service.getList(cri,"123"));
	}
	
}
