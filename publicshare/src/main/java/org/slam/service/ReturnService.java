package org.slam.service;

import java.util.List;
import java.util.Map;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.dto.ReservationDTO;

public interface ReturnService {

	public List<BookDTO> getList(Criteria cri);
	
	public List<Map<String, Object>> onApplyReadyList(String lender);

	public void acceptBookReserve(ReservationDTO dto);

	public void refuseBookReserve(ReservationDTO dto);

}
