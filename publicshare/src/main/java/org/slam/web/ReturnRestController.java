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
		//�ݳ� ��û�� �ִ��� Ȯ���ϴ� �޼��� -JH
		service.request(rno);
	}

	@GetMapping("/check")
	public List<Map<String, Object>> checkOnReturn(@SessionAttribute("member") MemberDTO dto){
		//�� ������ å�� ���� �ݳ� ��û�� �ִ��� üũ�ϰ�, ���� �� �� å�� ������ �������� �޼��� -JH 
		return service.checkItem(dto.getMid());
	}

	@PostMapping("/returnconfirm")
	public void returnConfirm(@RequestBody ReservationDTO dto) {
		//�ݳ� ��û�� ���� �� �ݳ� ó�� �ϴ� �޼��� -JH
		service.returnConfirm(dto.getBno(), dto.getRno());
	}
	
	@PostMapping("/returnreject")
	public void returnReject(@RequestBody ReservationDTO dto) {
		//�ݳ� ��û�� ���� �� �ݳ� �ź� ó�� �ϴ� �޼��� -JH
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
		//���� �ݳ� ��û ������, ���濡 ���� ������ ������ �������� �޼��� -JH
		return service.checkReturn(dto.getMid());
	}
	
	@PostMapping("/checkreject")
	public void checkReject(@RequestBody ReservationDTO dto) {
		service.checkReject(dto.getRno());
	}
}