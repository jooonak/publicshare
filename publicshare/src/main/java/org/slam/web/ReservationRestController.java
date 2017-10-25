package org.slam.web;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.BookDTO;
import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;
import org.slam.service.ResBookService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping("/reservation/*")
public class ReservationRestController {

	@Inject
	private ResBookService service;

	// 나의 물품 등록 페이지
	@PostMapping("/rent")
	public String rent(@RequestBody ReservationDTO dto, @SessionAttribute("member") MemberDTO member,
			RedirectAttributes rttr) {
		// reservation status check (hb)
		int result = service.bookCheck(dto.getBno());
		log.info("------------------------" + result);

		if (result == 0) {
			System.out.println("성공했어요");
			service.bookReserve(dto, member.getMid());
			return "true";
		} else {
			System.out.println("실패햇어요");
			return "false";
		}
	}

	@PostMapping("/reserve")
	public void reserve(@RequestBody ReservationDTO dto, @SessionAttribute("member") MemberDTO member) {

		// 대여자가 소유주에게 대여 신청하는 메서드(sb)//예약메소드로 내용 변경 (hb)
		log.info("" + dto.getBno());
		service.bookReserve(dto, member.getMid());
	}

	@PostMapping("/confirm")
	public void confirm(@RequestBody ReservationDTO dto) {
		// 소유주가 대여자에게 대여를 허락하는 경우 분기되는 메서드(sb)
		System.out.println("confirm:" + dto);
		service.confirmBookReserve(dto);
		//
	}

	@PostMapping("/reject")
	public void resject(@RequestBody ReservationDTO dto) {
		// 소유주가 대여를 거절하는 경우 분기되는 메서드(sb)
		System.out.println("reject:" + dto);
		service.rejectBookReserve(dto);
	}

	@GetMapping("/applyreadylist")

	public List<Map<String, Object>> applyreadylist(@SessionAttribute(value = "member", required = false) MemberDTO dto) {
		// 대여자가 예약한 물품 중 앞서 예약한 사람이 예약을 취소하여 자신의 차례가 되었을 때 예약을 할 것인지에 대한 여부를 물어보기 위한 동작

		return service.onApplyReadyList(dto.getMid());
	}

	@GetMapping("/applylist")

	public List<Map<String, Object>> applylist(@SessionAttribute(value = "member", required = false) MemberDTO dto) {
		// 내 책에 대한 대여 요청에 대한 리스트를 불러오는 메서드

		return service.ApplyList(dto.getMid());
	}
	
}
