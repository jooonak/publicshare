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
	
	//���� ��ǰ ��� ������
	@PostMapping("/new")
	public void reserve(@RequestBody ReservationDTO dto) {
		//�뿩�ڰ� �����ֿ��� �뿩 ��û�ϴ� �޼���(sb)
		log.info(""+dto);
		service.bookReserve(dto, "123");
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
		//
	}
	
	@GetMapping("/applyreadylist")
	public void applyreadylist() {
		//�뿩�ڰ� ������ ��ǰ �� �ռ� ������ ����� ������ ����Ͽ� �ڽ��� ���ʰ� �Ǿ��� �� ������ �� �������� ���� ���θ� ����� ���� ����
		service.onApplyReadyList("123");
	}

}
