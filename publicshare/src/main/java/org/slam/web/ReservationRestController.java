package org.slam.web;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;
import org.slam.service.ResBookService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping("/reservation/*")
public class ReservationRestController {


	@Inject
	private ResBookService service;
	
	//���� ��ǰ ��� ������
	@PostMapping("/new")
	public void reserve(@RequestBody ReservationDTO dto, @SessionAttribute("member") MemberDTO member) {
		//�뿩�ڰ� �����ֿ��� �뿩 ��û�ϴ� �޼���(sb)
		log.info(""+dto);
		service.bookReserve(dto, member.getMid());
	}
	
	@PostMapping("/confirm")
	public void confirm(@RequestBody ReservationDTO dto) {
		//�����ְ� �뿩�ڿ��� �뿩�� ����ϴ� ��� �б�Ǵ� �޼���(sb)
		System.out.println("confirm:"+dto);
		service.confirmBookReserve(dto);
		//
	}
	
	@PostMapping("/reject")
	public void resject(@RequestBody ReservationDTO dto) {
		//�����ְ� �뿩�� �����ϴ� ��� �б�Ǵ� �޼���(sb)
		System.out.println("reject:"+dto);
		service.rejectBookReserve(dto);
	}
	
	@GetMapping("/applyreadylist")
	public List<Map<String, Object>> applyreadylist(@SessionAttribute("member") MemberDTO dto) {
		//�뿩�ڰ� ������ ��ǰ �� �ռ� ������ ����� ������ ����Ͽ� �ڽ��� ���ʰ� �Ǿ��� �� ������ �� �������� ���� ���θ� ����� ���� ����
		return service.onApplyReadyList(dto.getMid());
	}
	
	@GetMapping("/applylist")
	public List<Map<String, Object>> applylist(@SessionAttribute("member") MemberDTO dto) {
		//�� å�� ���� �뿩 ��û�� ���� ����Ʈ�� �ҷ����� �޼���
		return service.ApplyList(dto.getMid());
	}

}
