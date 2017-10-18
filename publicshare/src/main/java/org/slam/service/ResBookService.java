package org.slam.service;

import org.slam.dto.ReservationDTO;

public interface ResBookService {
	
	public void bookReserve(ReservationDTO dto, String mid);

}
