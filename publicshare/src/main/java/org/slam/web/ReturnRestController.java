package org.slam.web;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;
import org.slam.service.ReturnService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

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
		//파라미터에 mid받아서 "testOwner"대신 작성 필요
		return service.checkItem("1234");
	}

	@PostMapping("/returnconfirm")
	public void returnConfirm(@RequestBody ReservationDTO dto) {
		System.out.println(dto.getBno());
		System.out.println(dto.getRno());
		service.returnConfirm(dto.getBno(), dto.getRno());
	}
	
	@PostMapping("/returnreject")
	public void returnReject(@RequestBody ReservationDTO dto) {
		System.out.println(dto);
		service.returnReject(dto.getRno());
	}
	
	@PostMapping("/reserveconfirm")
	public void confirm(@RequestBody ReservationDTO dto) {
		service.acceptBookReserve(dto);
	}
	
	
	@PostMapping("/reservereject")
	public void reject(@RequestBody ReservationDTO dto) {
		service.refuseBookReserve(dto);
		
	}
	
	@GetMapping("/checkReturn")
	public List<Map<String, Object>> checkReturn(@SessionAttribute("member") MemberDTO dto){
		//파라미터에 mid받아서 "testOwner"대신 작성 필요
		return service.checkReturn(dto.getMid());
	}
	
}