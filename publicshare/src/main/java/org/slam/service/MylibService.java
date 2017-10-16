package org.slam.service;

import java.util.List;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface MylibService {

	//��� ����
	public void register(BookDTO dto);

	//����Ʈ ����
	public List<BookDTO> list(Criteria cri);

	//�� ����
	public BookDTO get(int bno);

	//���� ����
	public void modify(BookDTO dto, Criteria cri);

	//���� ����
	public void remove(int bno);

	
	
}
