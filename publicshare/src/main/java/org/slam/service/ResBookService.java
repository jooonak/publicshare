package org.slam.service;

import java.util.List;
import java.util.Map;

import org.slam.dto.BookDTO;
import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;


public interface ResBookService {
	
	public void bookReserve(ReservationDTO dto, String mid);
	
	public void confirmBookReserve(ReservationDTO dto);

	public void rejectBookReserve(ReservationDTO dto);

	public List<Map<String, Object>> onApplyReadyList(String lender);

	public List<Map<String, Object>> ApplyList(String owner);

	//책 대여 상태 확인 (hb)
	public int bookCheck(int bno);

	public List<Map<String, Object>> getHistory(BookDTO dto, MemberDTO member);
}
