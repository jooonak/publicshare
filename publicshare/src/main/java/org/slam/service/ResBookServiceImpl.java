package org.slam.service;

import javax.inject.Inject;

import org.slam.mapper.ResBookMapper;
import org.springframework.stereotype.Service;

@Service
public class ResBookServiceImpl implements ResBookService {

	@Inject
	private ResBookMapper mapper;
	
	@Override
	public void bookReserve(int bno) {
		mapper.insertReservation(bno);
	}
	
}
