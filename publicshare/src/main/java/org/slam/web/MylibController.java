package org.slam.web;

import javax.inject.Inject;

import org.slam.service.MylibService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/itemmanage/*")
public class MylibController {
	
	//나의 물품 리스트 페이지
	@GetMapping("/list")
	public void getList() {
		
	}
	
	//나의 물품 등록 페이지
	@GetMapping("/register")
	public void register() {
		
	}
	
	//나의 물품 뷰 페이지
	@GetMapping("/view")
	public void view() {
		
	}
	
	//나의 물품 수정/삭제 페이지
	@PostMapping("/modify")
	public void modify() {
		
	}

}
