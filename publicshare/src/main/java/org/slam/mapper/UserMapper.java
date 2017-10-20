package org.slam.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.MemberDTO;

public interface UserMapper {

	@Insert("insert into tbl_member(mid, mpw, mname, nickname) values(#{mid}, #{mpw}, #{mname}, #{nickname})")
	public void joinMember(MemberDTO dto);
	
	@Select("select * from tbl_member where mid = #{mid} and mpw = #{mpw}")
	public MemberDTO checkMember(MemberDTO dto);
	
	@Select("select * from tbl_member where mid = #{mid}")
	public MemberDTO getMember(String mid);

	@Update("update tbl_member set mpw = #{mpw} where mid = #{mid}")
	public void updateUser(MemberDTO dto);
}
