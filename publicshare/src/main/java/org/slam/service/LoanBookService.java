package org.slam.service;

import java.util.List;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.dto.MemberDTO;

public interface LoanBookService {

	public List<BookDTO> getBookList(Criteria cri, String mid);
	
	public BookDTO getBook(BookDTO dto);
	
}
