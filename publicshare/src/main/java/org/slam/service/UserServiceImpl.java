package org.slam.service;

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

}
