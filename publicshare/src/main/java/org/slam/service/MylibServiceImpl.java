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
	
	//��� ���� ����
	@Override
	public void register(BookDTO dto) {
		mapper.register(dto);
	}

	//����Ʈ ���� ����
	@Override
	public List<BookDTO> list(Criteria cri, String mid) {
		return mapper.list(cri, mid);
	}

	//�� ���� ����
	@Override
	public BookDTO get(int bno) {
		
		return mapper.getById(bno);
		
	}

	//���� ���� ����
	@Override
	public void modify(BookDTO dto, Criteria cri) {
		log.info(""+dto);
		mapper.update(dto);
		
	}

	//���� ���� ����
	@Override
	public void remove(int bno) {
		mapper.remove(bno);
		
	}
	
	//�뿩 ��û�� ��ǰ ����Ʈ�� �������� ����(sb)
	public List<Map<String, Object>> ApplyList() {
		return mapper.getApplyList();
	}
	

}
