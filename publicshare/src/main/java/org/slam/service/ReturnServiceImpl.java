package org.slam.service;

import java.util.List;

import javax.inject.Inject;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.mapper.ReturnMapper;
import org.springframework.stereotype.Service;

@Service
public class ReturnServiceImpl implements ReturnService{

	@Inject
	ReturnMapper mapper;
	
	@Override
	public List<BookDTO> getList(Criteria cri) {
		return mapper.getList(cri);
	}

}
