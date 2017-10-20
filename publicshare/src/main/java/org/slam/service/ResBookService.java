package org.slam.service;

import java.util.List;
import java.util.Map;

import org.slam.dto.ReservationDTO;

public interface ResBookService {
	
	public void bookReserve(ReservationDTO dto, String lender);
	
	public void confirmBookReserve(ReservationDTO dto);

	public void rejectBookReserve(ReservationDTO dto);

	public List<Map<String, Object>> onApplyReadyList(String lender);

}
