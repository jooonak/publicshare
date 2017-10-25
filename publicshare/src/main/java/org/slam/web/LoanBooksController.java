package org.slam.web;

import javax.inject.Inject;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.dto.MemberDTO;
import org.slam.service.LoanBookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/loanbook/*")
public class LoanBooksController {

	@Inject
	LoanBookService service;

	@GetMapping("/list")
	// test¿ë testOwner »ðÀÔ (hb)
	public void getBookList(Model model, @ModelAttribute("cri") Criteria cri, @SessionAttribute(value="member", required=false) MemberDTO member) {
		System.out.println("test+=============="+cri.getSearchConcept());
		model.addAttribute("booklist", service.getBookList(cri, member.getMid()));
		
	}

	@GetMapping("/view")
	public void viewBook(Model model, @ModelAttribute("cri") Criteria cri, BookDTO dto) {
		model.addAttribute("book", service.getBook(dto));
	}
}
