package org.slam.web;

import javax.inject.Inject;

import org.slam.dto.ReservationDTO;
import org.slam.service.ReturnService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/myreturn/*")
public class ReturnRestController {
	
	@Inject
	private ReturnService service;
	
	@PostMapping("/request")
	public void returnRequest() {
		
	}
	
	@PostMapping("/reserveconfirm")
	public void confirm(@RequestBody ReservationDTO dto) {
		service.acceptBookReserve(dto);
	}
	
	
	@PostMapping("/reservereject")
	public void reject(@RequestBody ReservationDTO dto) {
		service.refuseBookReserve(dto);
		
	}	
	
	
}