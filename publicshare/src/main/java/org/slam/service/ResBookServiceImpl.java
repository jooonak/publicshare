package org.slam.service;

import javax.inject.Inject;

import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;
import org.slam.mapper.ResBookMapper;
import org.springframework.stereotype.Service;

@Service
public class ResBookServiceImpl implements ResBookService {

	@Inject
	private ResBookMapper mapper;
	
	@Override
	public void bookReserve(ReservationDTO dto, String mid) {
		//transaction 처리 필요(sb)
		mapper.insertReservation(dto, mid);
		mapper.updateResCntUp(dto.getBno());
	}
	
	@Override
	public void confirmBookReserve(ReservationDTO dto) {
		mapper.confirmUpdateResData(dto.getRno());
		mapper.updateResCntDown(dto.getBno());
	}
	
	@Override
	public void rejectBookReserve(ReservationDTO dto) {
		mapper.rejectUpdateResData(dto);
		mapper.updateResCntDown(dto.getBno());
	}
	
}
