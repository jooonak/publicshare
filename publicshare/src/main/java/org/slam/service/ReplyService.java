package org.slam.service;

import java.util.List;

import org.slam.dto.Criteria;
import org.slam.dto.ReplyDTO;

public interface ReplyService {

	public List<ReplyDTO> listPage(Criteria cri, int bno);

	public void register(ReplyDTO dto);

	public void remove(int reno);

	public void update(ReplyDTO dto);

	public void reReplyUpdate(ReplyDTO dto);



}
