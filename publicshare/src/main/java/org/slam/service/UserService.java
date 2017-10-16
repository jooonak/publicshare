package org.slam.service;

import org.slam.dto.MemberDTO;

public interface UserService {

	public void joinMember(MemberDTO dto);
	
	public MemberDTO checkMember(MemberDTO dto);
}
