package org.slam.service;

import java.util.List;

import javax.inject.Inject;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.dto.MemberDTO;
import org.slam.mapper.LoanBookMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;

@Service
@Log
public class LoanBookServiceImpl implements LoanBookService {

	@Inject
	LoanBookMapper mapper;

	// mapper의 메서드를 통해 페이지에 해당하는 BookList를 반환
	
	@Override
	public List<BookDTO> getBookList(Criteria cri, String mid) {
		log.info("" + mapper.getBookList(mid, cri));
		cri.setTotal(mapper.getTotal(mid));
		// criteria의 total값을 setting
		return mapper.getBookList(mid, cri);
	}

	// mapper의 메서드를 통해 bno에 해당하는 Book데이터 반환
	@Override
	public BookDTO getBook(int bno) {
		return mapper.getBook(bno);
	}

}
