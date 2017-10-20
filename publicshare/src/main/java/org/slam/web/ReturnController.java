package org.slam.web;

import javax.inject.Inject;

import org.slam.dto.Criteria;
import org.slam.service.ReturnService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/return/*")
public class ReturnController {

	@Inject
	ReturnService service;

	//대여 물품 리스트 페이지
	@GetMapping("/list")
	public void getList(@ModelAttribute("cri") Criteria cri, Model model) {
		//대여자가 예약한 물품 중 앞서 예약한 사람이 예약을 취소하여 자신의 차례가 되었을 때 예약을 할 것인지에 대한 여부를 물어보기 위한 동작
		model.addAttribute("applyreadylist", service.onApplyReadyList("testUser"));
	}
	
	
	
}
