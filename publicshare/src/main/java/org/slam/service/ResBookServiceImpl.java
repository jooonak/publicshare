package org.slam.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;
import org.slam.mapper.ResBookMapper;
import org.slam.mapper.ReturnMapper;
import org.springframework.stereotype.Service;

@Service
public class ResBookServiceImpl implements ResBookService {

	@Inject
	private ResBookMapper mapper;
	
	@Override
	public void bookReserve(ReservationDTO dto, String mid) {
		//transaction ó�� �ʿ�(sb)
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
	
	@Override
	public List<Map<String, Object>> onApplyReadyList(String lender){
		return mapper.getOnApplyReadyList(lender);
	}

}
