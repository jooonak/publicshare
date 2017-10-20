package org.slam.web;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.ReservationDTO;
import org.slam.service.ReturnService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/myreturn/*")
public class ReturnRestController {

	@Inject
	ReturnService service;

	@PostMapping("/request")
	public void returnRequest(@RequestBody int rno) {
		service.request(rno);
	}

	@GetMapping("/check")
	public List<Map<String, Object>> checkOnReturn(){
		return service.checkItem();
	}

	@PostMapping("/returnconfirm")
	public void returnConfirm(@RequestBody ReservationDTO dto) {
		System.out.println(dto.getBno());
		System.out.println(dto.getRno());
		service.returnConfirm(dto.getBno(), dto.getRno());
	}
	
}