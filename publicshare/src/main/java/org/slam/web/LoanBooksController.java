package org.slam.web;

import javax.inject.Inject;

import org.slam.dto.Criteria;
import org.slam.service.LoanBookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/loanbook/*")
public class LoanBooksController {

	@Inject
	LoanBookService service;
	
	
	@GetMapping("/list")
	public void getBookList(Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("booklist",service.getBookList(cri));
	}
	
	@GetMapping("/view")
	public void viewBook(Model model, @ModelAttribute("cri") Criteria cri, int bno) {
		
	}
}
