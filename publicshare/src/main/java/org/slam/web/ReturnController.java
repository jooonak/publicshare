package org.slam.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/return/*")
public class ReturnController {

	//대여 물품 리스트 페이지
	@GetMapping("/list")
	public void getList() {
		
	}
	
	
}
