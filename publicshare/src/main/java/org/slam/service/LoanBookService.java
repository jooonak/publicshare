package org.slam.service;

import java.util.List;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface LoanBookService {

	public List<BookDTO> getBookList(Criteria cri);
	
	public BookDTO getBook(int bno);
}
