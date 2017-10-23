package org.slam.service;

import java.util.List;
import javax.inject.Inject;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.mapper.ImgFileMapper;
import org.slam.mapper.MyLibMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;


@Service
@Log
public class MylibServiceImpl implements MylibService {

	
	@Inject
	private MyLibMapper mapper;
	
	@Inject
	private ImgFileMapper fileMapper;	//mapper 이릅 수정 필요...(sb)
	
	//등록 서비스 임플
	@Transactional
	@Override
	public void register(BookDTO dto) {
		mapper.register(dto);
		fileMapper.insertImgFileList(dto.getImgFiles());
	}

	//리스트 서비스 임플
	@Override
	public List<BookDTO> list(Criteria cri,String mid) {
		cri.setTotal(mapper.getTotal(mid));
		return mapper.list(cri, mid);
	}

	//뷰 서비스 임플
	@Override
	public BookDTO get(int bno) {
		
		return mapper.getById(bno);
		
	}

	//수정 서비스 임플
	@Transactional
	@Override
	public void modify(BookDTO dto, Criteria cri) {
		log.info(""+dto);
		mapper.update(dto);
		
	}

	//삭제 서비스 임플
	@Override
	public void remove(int bno) {
		mapper.remove(bno);
		
	}


}
