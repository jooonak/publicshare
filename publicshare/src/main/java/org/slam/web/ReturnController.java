package org.slam.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/return/*")
public class ReturnController {

	//�뿩 ��ǰ ����Ʈ ������
	@GetMapping("/list")
	public void getList() {
		
	}
	
	
}
