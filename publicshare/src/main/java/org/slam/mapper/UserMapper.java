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
	
	//�˶��� ������ �������� query
	@Select("select count(*) from tbl_reservation res, tbl_book book where book.bno = res.bno and owner = #{mid} and status = 'onapply'") //�� å�� ���� �뿩 ��û �˶�
	public int getOnApplyCNT(String mid);
	@Select("select count(*) from tbl_reservation res, tbl_book book where book.bno = res.bno and lender = #{mid} and status = 'onapplyready'") //���� ������ å�� �� ���ʰ� �Ǿ��� �� �˶�
	public int getOnApplyReadyCNT(String mid);
	@Select("select count(*) from tbl_reservation res, tbl_book book where book.bno = res.bno and owner = #{mid} and status = 'onreturn'") //�� å�� ���� �ݳ� ��û �˶�
	public int getOnReturnCNT(String mid);
	@Select("select count(*) from tbl_reservation res, tbl_book book where book.bno = res.bno and lender = #{mid} and status = 'returnrejected'") //���� �ݳ���û�� å�� ���� �˶�
	public int getReturnRejectedCNT(String mid);

}
