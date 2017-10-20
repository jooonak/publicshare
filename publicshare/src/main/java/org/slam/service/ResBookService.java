package org.slam.service;

import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;

public interface ResBookService {
	
	public void bookReserve(ReservationDTO dto, String mid);
	
	public void confirmBookReserve(ReservationDTO dto);

	public void rejectBookReserve(ReservationDTO dto);

}
