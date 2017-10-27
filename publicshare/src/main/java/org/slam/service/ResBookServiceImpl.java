package org.slam.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.BookDTO;
import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;
import org.slam.mapper.ResBookMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ResBookServiceImpl implements ResBookService {

	@Inject
	private ResBookMapper mapper;

	@Transactional
	@Override
	public void bookReserve(ReservationDTO dto, String mid) {
		// transaction 처리 필요(sb)
		mapper.insertReservation(dto, mid);
		mapper.updateResCntUp(dto.getBno());
		//대여할 때 실행하는 메서드
	}

	@Override
	public void confirmBookReserve(ReservationDTO dto) {
		mapper.confirmUpdateResData(dto.getRno());
		//대여 신청에 대해서 수락하는 메서드
	}

	@Transactional
	@Override
	public void rejectBookReserve(ReservationDTO dto) {
		mapper.rejectUpdateResData(dto);
		mapper.updateResCntDown(dto.getBno());
		//대여 신청에 대해서 취소하는 메서드
	}

	@Override
	public List<Map<String, Object>> onApplyReadyList(String lender) {
		return mapper.getOnApplyReadyList(lender);
		//예약했던 책이 내 차례가 됐을 때 예약하는 메서드
	}

	
	public List<Map<String, Object>> ApplyList(String owner) {
		return mapper.getApplyList(owner);
		//내 도서에 대한 대여 신청목록을 불러오는 메서드(sb)
	}

	@Override
	public int bookCheck(int bno) {
		return mapper.bookCheck(bno);
		//대여 신청할 때 해당 책에 대한 예약 카운트 (대여자 수)를 가져오는 메서드
	}

	@Override
	public List<Map<String, Object>> getHistory(BookDTO dto, MemberDTO member) {
		if(dto.getOwner().equals(member.getMid())) {
			return mapper.getBookHistory(dto.getBno());
		}
		return mapper.getResHistory(dto.getBno());
	}

}
