package org.slam.web;

import javax.inject.Inject;

import org.slam.dto.MemberDTO;
import org.slam.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.WebRequest;
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
		
		log.info(""+dto);
		service.joinMember(dto);
		//���� user data�� db�� ����

		rttr.addFlashAttribute("result","success");
		//�� �� ��� ǥ�õ��� ���� data����
		
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public void loginGET() {
		log.info("WELLCOME LOGIN PAGE");
		//ó���Ұ� ����...
	}
	
	@PostMapping("/login")
	public String loginPOST(MemberDTO dto, String auto, Model model) {
		MemberDTO member = service.checkMember(dto);
		//�Է��� ������ db���� ã�� ������ ������ �޾ƿ��� �޼���
		
		if(member == null) {
			return "/login";
		}

		model.addAttribute("member", member);
		//interceptor���� member data�� ����ϱ� ���� model�� add
		return "redirect:/loanbook/list";
	}
	
	@GetMapping("/mypage")
	public void goMypage(@SessionAttribute(value="member", required=false) MemberDTO member, Model model) {
		//SessionAttribute�� ���°� ������, interceptor���� model�� �ִ°� ������
		//@SessionAttribute�� ����ϸ� Session�� �ִ� ��õ� �̸��� data�� ������ �� �ִ� (���� : http://egloos.zum.com/springmvc/v/535572)
		
		log.info("member........." + member);
		model.addAttribute("member", member);
	}
	
	@PostMapping("/logout")
	public String logoutPOST(@SessionAttribute(value="member", required=false) MemberDTO member, Model model) {
		
		log.info("DO LOGOUT CONTROLLER");
		
		model.addAttribute("logout","success");
		
		return "redirect:/login";
	}
	
	@PostMapping("/modify")
	public String userModify(MemberDTO dto, RedirectAttributes rttr) {
		service.modifyUser(dto);
		
		rttr.addFlashAttribute("result","modify");
		return "redirect:/logout";
	}
	
}
