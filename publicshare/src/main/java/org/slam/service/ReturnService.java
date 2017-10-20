package org.slam.service;

import java.util.List;
import java.util.Map;

import org.slam.dto.Criteria;
import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;

public interface ReturnService {

	public List<Map<String, Object>> getList(Criteria cri, String mid);

	public void request(int rno);

	public List<Map<String, Object>> checkItem(String mid);

	public void returnConfirm(int bno, int rno);

	public void acceptBookReserve(ReservationDTO dto);

	public void refuseBookReserve(ReservationDTO dto);

	public void returnReject(int bno);

	public List<Map<String, Object>> checkReturn(String mid);

}
