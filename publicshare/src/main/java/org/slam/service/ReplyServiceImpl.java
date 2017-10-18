package org.slam.service;

import java.util.List;

import javax.inject.Inject;

import org.slam.dto.Criteria;
import org.slam.dto.ReplyDTO;
import org.slam.mapper.ReplyMapper;
import org.springframework.stereotype.Service;

import lombok.extern.java.Log;

@Service
@Log
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyMapper mapper;

	@Override
	public List<ReplyDTO> listPage(Criteria cri, int bno) {

		return mapper.list(cri, bno);
	}

	@Override
	public void register(ReplyDTO dto) {

		mapper.create(dto);
	}

	@Override
	public void remove(int reno) {
		 
		mapper.delete(reno);
	}

	@Override
	public void update(ReplyDTO dto) {
		log.info(""+dto);
		mapper.update(dto);
	}

}
