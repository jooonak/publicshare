package org.slam.service;

import java.util.List;

import javax.inject.Inject;

import org.slam.dto.Criteria;
import org.slam.dto.ReplyDTO;
import org.slam.mapper.LoanBookMapper;
import org.slam.mapper.ReplyMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;

@Transactional
@Service
@Log
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyMapper mapper;
	
	@Inject
	private LoanBookMapper bookMapper;

	@Override
	public List<ReplyDTO> listPage(Criteria cri, int bno) {

		return mapper.list(cri, bno);
	}

	@Override
	public void register(ReplyDTO dto, String mid) {

		mapper.create(dto, mid);
		bookMapper.updateReplyCnt(dto.getBno());//북에 댓글이 달리면  댓글 카운터가 올라감(hb)
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

	@Override
	public void reReplyUpdate(ReplyDTO dto, String mid) {
		mapper.reReplycreate(dto, mid);
		bookMapper.updateReplyCnt(dto.getBno());
		
	}

}
