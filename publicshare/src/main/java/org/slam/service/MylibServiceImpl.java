package org.slam.service;

import java.util.List;
import javax.inject.Inject;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.mapper.ImgFileMapper;
import org.slam.mapper.MyLibMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;


@Service
@Log
public class MylibServiceImpl implements MylibService {

	
	@Inject
	private MyLibMapper mapper;
	
	@Inject
	private ImgFileMapper fileMapper;	//mapper �̸� ���� �ʿ�...(sb)
	
	//��� ���� ����
	@Transactional
	@Override
	public void register(BookDTO dto) {
		mapper.register(dto);
		fileMapper.insertImgFileList(dto.getImgFiles());
	}

	//����Ʈ ���� ����
	@Override
	public List<BookDTO> list(Criteria cri,String mid) {
		cri.setTotal(mapper.getTotal(mid));
		return mapper.list(cri, mid);
	}

	//�� ���� ����
	@Override
	public BookDTO get(int bno) {
		
		return mapper.getById(bno);
		
	}

	//���� ���� ����
	@Transactional
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


}
