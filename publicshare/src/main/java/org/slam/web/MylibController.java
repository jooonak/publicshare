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
	
	//���� ��ǰ ����Ʈ ������
	@GetMapping("/list")
	public void getList() {
		
	}
	
	//���� ��ǰ ��� ������
	@GetMapping("/register")
	public void register() {
		
	}
	
	//���� ��ǰ �� ������
	@GetMapping("/view")
	public void view() {
		
	}
	
	//���� ��ǰ ����/���� ������
	@PostMapping("/modify")
	public void modify() {
		
	}

}
