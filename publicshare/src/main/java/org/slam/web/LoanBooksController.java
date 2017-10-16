package org.slam.web;

import org.slam.dto.Criteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/loanbook/*")
public class LoanBooksController {

	@GetMapping("/list")
	public void getBookList(Model model, Criteria cri) {
		
	}
}
