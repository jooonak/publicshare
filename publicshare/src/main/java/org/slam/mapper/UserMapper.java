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
	
	//알람의 개수를 가져오는 query
	@Select("select count(*) from tbl_reservation res, tbl_book book where book.bno = res.bno and owner = #{mid} and status = 'onapply'") //내 책에 대한 대여 요청 알람
	public int getOnApplyCNT(String mid);
	@Select("select count(*) from tbl_reservation res, tbl_book book where book.bno = res.bno and lender = #{mid} and status = 'onapplyready'") //내가 예약한 책이 내 차례가 되었을 때 알람
	public int getOnApplyReadyCNT(String mid);
	@Select("select count(*) from tbl_reservation res, tbl_book book where book.bno = res.bno and owner = #{mid} and status = 'onreturn'") //내 책에 대한 반납 요청 알람
	public int getOnReturnCNT(String mid);
	@Select("select count(*) from tbl_reservation res, tbl_book book where book.bno = res.bno and lender = #{mid} and status = 'returnrejected'") //내가 반납요청한 책의 거절 알람
	public int getReturnRejectedCNT(String mid);

}
