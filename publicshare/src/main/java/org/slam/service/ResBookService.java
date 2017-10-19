package org.slam.service;

import org.slam.dto.ReservationDTO;

public interface ResBookService {
	
	public void bookReserve(ReservationDTO dto, String lender);
	
	public void confirmBookReserve(ReservationDTO dto);

	public void rejectBookReserve(ReservationDTO dto);

}
