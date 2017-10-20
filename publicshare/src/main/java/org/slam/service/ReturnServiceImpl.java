package org.slam.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.Criteria;
import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;
import org.slam.mapper.ResBookMapper;
import org.slam.mapper.ReturnMapper;
import org.springframework.stereotype.Service;

@Service
public class ReturnServiceImpl implements ReturnService{

	@Inject
	ReturnMapper returnMapper;
	
	@Inject
	ResBookMapper resBookMapper;
	
	@Override
	public List<Map<String, Object>> getList(Criteria cri, String mid) {
		return returnMapper.getList(cri,mid);
	}

	@Override
	public void request(int rno) {
		returnMapper.request(rno);
	}

	@Override
	public List<Map<String, Object>> checkItem() {
		return returnMapper.checkItem();
	}

	@Override
	public void returnConfirm(int bno, int rno) {
		returnMapper.returnConfirm(bno, rno);
		resBookMapper.updateResCntDown(bno);
	}
	
	@Override
	public List<Map<String, Object>> onApplyReadyList(String lender){
		return returnMapper.getOnApplyReadyList(lender);
	}

	@Override
	public void acceptBookReserve(ReservationDTO dto) {
		resBookMapper.confirmUpdateApplyData(dto.getRno());
	}

	@Override
	public void refuseBookReserve(ReservationDTO dto) {
		resBookMapper.rejectUpdateApplyData(dto);
		resBookMapper.updateResCntDown(dto.getBno());
	}
}
