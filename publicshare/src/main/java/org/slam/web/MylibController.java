package org.slam.web;

import java.util.Arrays;

import javax.inject.Inject;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.dto.MemberDTO;
import org.slam.service.MylibService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/itemmanage/*")
public class MylibController {

	@Inject
	MylibService service;

	// 나의 물품 리스트 페이지
	@GetMapping("/list")
	public void getList(@ModelAttribute("cri") Criteria cri, Model model, @SessionAttribute(value="member", required=false) MemberDTO member) {
		//test용 아이디 "testOwner" 삽입(sb)
		model.addAttribute("list", service.list(cri, member.getMid()));
	}

	// 나의 물품 등록 페이지
	@GetMapping("/register")
	public void register() {

	}

	// 물품 등록 후 list 페이지로 이동
	@PostMapping("/register")
	public String registerPost(BookDTO dto, RedirectAttributes rttr) {

		System.out.println("imglist: "+ Arrays.toString(dto.getImgFiles()));
		
		System.out.println("mainThumb: "+ dto.getImg());
		
		service.register(dto);
		
		rttr.addFlashAttribute("result","success");
		
		return "redirect:/itemmanage/list";
	}

	// 나의 물품 뷰 페이지
	@GetMapping("/view")
	public void view(@ModelAttribute("cri") Criteria cri, BookDTO dto, Model model) {
		model.addAttribute("book", service.get(dto));
	}

	// 나의 물품 수정/삭제 페이지
	@GetMapping("/modify")
	public void modify(@ModelAttribute("cri") Criteria cri, BookDTO dto, Model model) {
		view(cri, dto, model);
	}

	// 나의 물품 수정/삭제 페이지
	@PostMapping("/modify")
	public String modifyPost(@ModelAttribute("cri") Criteria cri, BookDTO dto, RedirectAttributes rttr) {
		service.modify(dto, cri);
		rttr.addAttribute("bno", dto.getBno());
		rttr.addFlashAttribute("result","modify");
		return "redirect:/itemmanage/view";
	}
	
	// 나의 물품 수정/삭제 페이지
	@PostMapping("/remove")
	public String remove(BookDTO dto, Model model, RedirectAttributes rttr) {
		service.remove(dto.getBno());	
		rttr.addFlashAttribute("result","delete");
		return "redirect:/itemmanage/list";
	}

}
