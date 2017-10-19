package org.slam.service;

import java.util.List;
import java.util.Map;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface MylibService {

	//��� ����
	public void register(BookDTO dto);

	//����Ʈ ����
	public List<BookDTO> list(Criteria cri, String mid);

	//�� ����
	public BookDTO get(int bno);

	//���� ����
	public void modify(BookDTO dto, Criteria cri);

	//���� ����
	public void remove(int bno);

	public List<Map<String, Object>> ApplyList(String owner);
	
}
