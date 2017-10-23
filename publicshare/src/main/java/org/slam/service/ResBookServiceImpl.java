package org.slam.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.BookDTO;
import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;
import org.slam.mapper.ResBookMapper;
import org.slam.mapper.ReturnMapper;
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
	}

	@Transactional
	@Override
	public void confirmBookReserve(ReservationDTO dto) {
		mapper.confirmUpdateResData(dto.getRno());
	}

	@Transactional
	@Override
	public void rejectBookReserve(ReservationDTO dto) {
		mapper.rejectUpdateResData(dto);
		mapper.updateResCntDown(dto.getBno());
	}

	@Override
	public List<Map<String, Object>> onApplyReadyList(String lender) {
		return mapper.getOnApplyReadyList(lender);
	}

	// 대여 요청온 물품 리스트를 가져오는 임플(sb)
	public List<Map<String, Object>> ApplyList(String owner) {
		return mapper.getApplyList(owner);
	}

	@Override
	public int bookCheck(int bno) {
		return mapper.bookCheck(bno);
		
	}

}
