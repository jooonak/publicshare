package org.slam.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/*")
public class TestController {

	@GetMapping("/test2")
	public void Test2() {
		System.out.println("¾È³ç¾È³ç");
	}
	
	@PostMapping("/test2")
	public void test2Post() {
		
	}
}
