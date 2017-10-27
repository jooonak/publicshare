package org.slam.service;

import java.util.Map;

import org.slam.dto.MemberDTO;

public interface UserService {

	public void joinMember(MemberDTO dto);
	
	public MemberDTO checkMember(MemberDTO dto);
	
	public MemberDTO getMember(String mid);
	
	public void modifyUser(MemberDTO dto);
	
	public Map<String, Integer> getNotice(String mid);
}
