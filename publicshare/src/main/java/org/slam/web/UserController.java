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
		//받은 user data를 db에 저장

		rttr.addFlashAttribute("result","success");
		//추 후 결과 표시등을 위한 data전송
		
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public void loginGET() {
		log.info("WELLCOME LOGIN PAGE");
		//처리할것 없음...
	}
	
	@PostMapping("/login")
	public String loginPOST(MemberDTO dto, String auto, Model model) {
		MemberDTO member = service.checkMember(dto);
		//입력한 정보를 db에서 찾아 나머지 정보를 받아오는 메서드
		
		if(member == null) {
			return "/login";
		}

		model.addAttribute("member", member);
		//interceptor에서 member data를 사용하기 위해 model에 add
		return "redirect:/loanbook/list";
	}
	
	@GetMapping("/mypage")
	public void goMypage(@SessionAttribute(value="member", required=false) MemberDTO member, Model model) {
		//SessionAttribute를 쓰는게 좋은지, interceptor에서 model에 넣는게 좋은지
		//@SessionAttribute를 사용하면 Session에 있는 명시된 이름의 data를 가져올 수 있다 (참고 : http://egloos.zum.com/springmvc/v/535572)
		
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
