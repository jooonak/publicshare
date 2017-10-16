package org.slam.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.slam.dto.MemberDTO;

public interface UserMapper {

	@Insert("insert into tbl_member(mid, mpw, mname) values(#{mid}, #{mpw}, #{mname})")
	public void joinMember(MemberDTO dto);
	
	@Select("select * from tbl_member where mid = #{mid} and mpw = #{mpw}")
	public MemberDTO checkMember(MemberDTO dto);
}
