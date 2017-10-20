package org.slam.service;

import java.util.List;
import java.util.Map;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface MylibService {

	//등록 서비스
	public void register(BookDTO dto);

	//리스트 서비스
	public List<BookDTO> list(Criteria cri, String mid);

	//뷰 서비스
	public BookDTO get(int bno);

	//수정 서비스
	public void modify(BookDTO dto, Criteria cri);

	//삭제 서비스
	public void remove(int bno);

	public List<Map<String, Object>> ApplyList(String owner);
	
}
