package org.slam.service;

import java.util.List;

import javax.inject.Inject;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.dto.MemberDTO;
import org.slam.mapper.ImgFileMapper;
import org.slam.mapper.LoanBookMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;

@Service
@Log
public class LoanBookServiceImpl implements LoanBookService {

	@Inject
	private LoanBookMapper mapper;
	@Inject
	private ImgFileMapper fileMapper;
	// mapper�� �޼��带 ���� �������� �ش��ϴ� BookList�� ��ȯ
	
	@Override
	public List<BookDTO> getBookList(Criteria cri, String mid) {
		cri.setTotal(mapper.getTotal(mid, cri));
		// criteria�� total���� setting
		return mapper.getBookList(mid, cri);
	}

	// mapper�� �޼��带 ���� bno�� �ش��ϴ� Book������ ��ȯ
	@Override
	public BookDTO getBook(BookDTO dto) {
		dto = mapper.getBook(dto.getBno());
		dto.setImgFiles(fileMapper.getImgListById(dto.getBno()));
		return dto;
		
	}

}
