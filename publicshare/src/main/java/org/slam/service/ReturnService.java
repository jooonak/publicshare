package org.slam.service;

import java.util.List;
import java.util.Map;

import org.slam.dto.Criteria;
import org.slam.dto.ReservationDTO;

public interface ReturnService {

	public Criteria setCri(Criteria cri, String mid);
	//내가 대여한 책의 리스트를 가져오는 메서드

	public void request(ReservationDTO dto);
	//내가 대여한 책을 반납신청하는 메서드

	public List<Map<String, Object>> checkItem(String mid);
	//현재 대여중인 내 책에 반납신청이 있으면 그 리스트를 가져오는 메서드

	public void returnConfirm(int bno, int rno);
	//반납 신청에 대해 확인하는 메서드

	public void acceptBookReserve(ReservationDTO dto);

	public void refuseBookReserve(ReservationDTO dto);

	public void returnReject(int bno);
	//반납 신청에 대해 거절하는 메서드

	public List<Map<String, Object>> checkReturn(String mid);
	//내 반납신청에 대해 거절된 리스트를 가져오는 메서드

	public void checkReject(int rno);

	public List<Map<String, Object>> getList(int page, String status, String mid);

	//사용자의 대여 이력(hb)
	public List<Map<String, Object>> loanHistoryList(String mid);

}
