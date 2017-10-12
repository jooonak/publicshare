package org.slam.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/*")
public class TestController {
	
	//���� ��ǰ ���� ��
	@GetMapping("/itemmanage")
	public void myItems() {	
	}
	
	//������ ��ǰ ���� 
	@GetMapping("/return")
	public void myReturns() {	
	}
	
	//�뿩 ��� ȭ��(����)
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
