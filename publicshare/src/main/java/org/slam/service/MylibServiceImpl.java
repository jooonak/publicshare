package org.slam.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.mapper.MyLibMapper;
import org.springframework.stereotype.Service;

import lombok.extern.java.Log;

@Service
@Log
public class MylibServiceImpl implements MylibService {

	
	@Inject
	public MyLibMapper mapper;
	
	//등록 서비스 임플
	@Override
	public void register(BookDTO dto) {
		mapper.register(dto);
	}

	//리스트 서비스 임플
	@Override
	public List<BookDTO> list(Criteria cri, String mid) {
		return mapper.list(cri, mid);
	}

	//뷰 서비스 임플
	@Override
	public BookDTO get(int bno) {
		
		return mapper.getById(bno);
		
	}

	//수정 서비스 임플
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
	
	//대여 요청온 물품 리스트를 가져오는 임플(sb)
	public List<Map<String, Object>> ApplyList() {
		return mapper.getApplyList();
	}
	

}
