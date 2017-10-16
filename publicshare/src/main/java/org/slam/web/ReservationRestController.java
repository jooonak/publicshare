package org.slam.web;

import javax.inject.Inject;

import org.slam.service.ResBookService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping("/reservation/*")
public class ReservationRestController {


	@Inject
	private ResBookService service;
	
	//나의 물품 등록 페이지
	@PostMapping("/book/{bno}")
	public void reserve(@PathVariable("bno")int bno) {
		System.out.println("gogogo book!");	
		System.out.println("bno:" + bno);
		service.bookReserve(bno);
	}


}
