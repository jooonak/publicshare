package org.slam.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/*")
public class TestController {
	
	//나의 물품 관리 탭
	@GetMapping("/itemmanage")
	public void myItems() {	
	}
	
	//대출한 물품 관리 
	@GetMapping("/return")
	public void myReturns() {	
	}
	
	//대여 목록 화면(메인)
	@GetMapping("/main")
	public void goMain() {	
	}
		
	@GetMapping("/view")
	public void view() {	
	}	
	
	@GetMapping("/login")
	public void login() {	
	}	
}
