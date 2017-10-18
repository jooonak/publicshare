package org.slam.web;

import javax.inject.Inject;

import org.slam.dto.ReservationDTO;
import org.slam.service.ResBookService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	@PostMapping("/new")
	public void reserve(@RequestBody ReservationDTO dto) {
		//mno값 가져와야 함 and mno 없애고 id값으로 사용하자
		log.info(""+dto);
		service.bookReserve(dto, "test");
	}


}
