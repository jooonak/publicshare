package org.slam.service;

import java.util.List;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface ReturnService {

	public List<BookDTO> getList(Criteria cri);
}
