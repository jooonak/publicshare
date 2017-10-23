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
		//반납 요청이 있는지 확인하는 메서드 -JH
		service.request(rno);
	}

	@GetMapping("/check")
	public List<Map<String, Object>> checkOnReturn(@SessionAttribute("member") MemberDTO dto){
		//내 소유의 책에 대해 반납 신청이 있는지 체크하고, 있을 때 그 책의 정보를 가져오는 메서드 -JH 
		return service.checkItem(dto.getMid());
	}

	@PostMapping("/returnconfirm")
	public void returnConfirm(@RequestBody ReservationDTO dto) {
		//반납 신청이 있을 때 반납 처리 하는 메서드 -JH
		service.returnConfirm(dto.getBno(), dto.getRno());
	}
	
	@PostMapping("/returnreject")
	public void returnReject(@RequestBody ReservationDTO dto) {
		//반납 신청이 있을 때 반납 거부 처리 하는 메서드 -JH
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
		//내가 반납 신청 했으나, 상대방에 의해 거절된 정보를 가져오는 메서드 -JH
		return service.checkReturn(dto.getMid());
	}
	
	@PostMapping("/checkreject")
	public void checkReject(@RequestBody ReservationDTO dto) {
		service.checkReject(dto.getRno());
	}
}