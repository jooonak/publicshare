package org.slam.web;

import javax.inject.Inject;

import org.slam.dto.MemberDTO;
import org.slam.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.java.Log;

@Controller
@Log
public class UserController {

	@Inject
	UserService service;
	
	@PostMapping("/join")
	public String joinPost(MemberDTO dto, RedirectAttributes rttr) {
		log.info("JOIN IN.....");
		service.joinMember(dto);
		rttr.addFlashAttribute("result","success");
		
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public void loginGET() {
		log.info("WELLCOME LOGIN PAGE");
	}
	
	@PostMapping("/login")
	public void loginPOST(MemberDTO dto, Model model, String auto) {
		log.info("member.....:"+dto);
		log.info("auto.....:" + auto);
		
		MemberDTO member = service.checkMember(dto);
		
		model.addAttribute("member",member);
		model.addAttribute("auto",auto);
	}
}
