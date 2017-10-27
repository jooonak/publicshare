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
		// transaction ó�� �ʿ�(sb)
		mapper.insertReservation(dto, mid);
		mapper.updateResCntUp(dto.getBno());
		//�뿩�� �� �����ϴ� �޼���
	}

	@Override
	public void confirmBookReserve(ReservationDTO dto) {
		mapper.confirmUpdateResData(dto.getRno());
		//�뿩 ��û�� ���ؼ� �����ϴ� �޼���
	}

	@Transactional
	@Override
	public void rejectBookReserve(ReservationDTO dto) {
		mapper.rejectUpdateResData(dto);
		mapper.updateResCntDown(dto.getBno());
		//�뿩 ��û�� ���ؼ� ����ϴ� �޼���
	}

	@Override
	public List<Map<String, Object>> onApplyReadyList(String lender) {
		return mapper.getOnApplyReadyList(lender);
		//�����ߴ� å�� �� ���ʰ� ���� �� �����ϴ� �޼���
	}

	
	public List<Map<String, Object>> ApplyList(String owner) {
		return mapper.getApplyList(owner);
		//�� ������ ���� �뿩 ��û����� �ҷ����� �޼���(sb)
	}

	@Override
	public int bookCheck(int bno) {
		return mapper.bookCheck(bno);
		//�뿩 ��û�� �� �ش� å�� ���� ���� ī��Ʈ (�뿩�� ��)�� �������� �޼���
	}

	@Override
	public List<Map<String, Object>> getHistory(BookDTO dto, MemberDTO member) {
		if(dto.getOwner().equals(member.getMid())) {
			return mapper.getBookHistory(dto.getBno());
		}
		return mapper.getResHistory(dto.getBno());
	}

}
