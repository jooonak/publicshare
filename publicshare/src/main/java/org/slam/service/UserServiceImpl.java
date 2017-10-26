package org.slam.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.MemberDTO;
import org.slam.mapper.UserMapper;
import org.springframework.stereotype.Service;

import lombok.extern.java.Log;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserMapper mapper;

	@Override
	public void joinMember(MemberDTO dto) {
		mapper.joinMember(dto);
	}

	@Override
	public MemberDTO checkMember(MemberDTO dto) {
		return mapper.checkMember(dto);
	}

	@Override
	public MemberDTO getMember(String mid) {
		return mapper.getMember(mid);
	}

	@Override
	public void modifyUser(MemberDTO dto) {
		mapper.updateUser(dto);
	}

	@Override
	public Map<String, Integer> getNotice(String mid) {
		Map<String, Integer> map = new HashMap<>();
		
		map.put("applycnt", mapper.getOnApplyCNT(mid));
		map.put("applyreadycnt", mapper.getOnApplyReadyCNT(mid));
		map.put("returncnt", mapper.getOnReturnCNT(mid));
		map.put("rejectcnt", mapper.getReturnRejectedCNT(mid));
		
		return map;
	}

	
}
