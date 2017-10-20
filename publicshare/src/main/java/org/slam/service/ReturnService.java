package org.slam.service;

import java.util.List;
import java.util.Map;

import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface ReturnService {

	public List<Map<String, Object>> getList(Criteria cri);

	public void request(int rno);

	public List<Map<String, Object>> checkItem();

	public void returnConfirm(int bno, int rno);
}
