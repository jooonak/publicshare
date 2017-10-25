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
	@Transactional
	@Override
	public BookDTO get(BookDTO dto) {
		dto = mapper.getById(dto.getBno());
		dto.setImgFiles(fileMapper.getImgListById(dto.getBno()));
		return dto;
		
	}

	//���� ���� ����
	@Transactional
	@Override
	public void modify(BookDTO dto, Criteria cri) {
		mapper.update(dto);
		fileMapper.delete(dto.getBno());
		fileMapper.modifyImgFileList(dto.getImgFiles(), dto.getBno());
	}

	//���� ���� ����
	@Override
	public void remove(int bno) {
		mapper.remove(bno);
		
	}

	@Override
	public String[] getImgList(int bno) {
		return fileMapper.getImgListById(bno);
	}


}
