package org.slam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.Criteria;
import org.slam.dto.ReplyDTO;

public interface ReplyMapper {

	@Select("select * from tbl_reply,tbl_member where tbl_reply.replyer = tbl_member.mid and bno = #{bno} order by replytree asc limit #{cri.skip},10")
	public List<ReplyDTO> list(@Param("cri") Criteria cri, @Param("bno") int bno);

	@Insert("insert into tbl_reply(bno,reply,replyer,replytree) values(#{dto.bno},#{dto.reply},#{mid},(select max(reno)+1 from tbl_reply a))")
	public void create(@Param("dto") ReplyDTO dto, @Param("mid") String mid);

	@Delete("delete from tbl_reply where reno = #{reno}")
	public void delete(int reno);

	@Update("update tbl_reply set reply= #{reply} where reno = #{reno} ")
	public void update(ReplyDTO dto);
	
	//���ۿ� ���� sql
	@Insert("insert into tbl_reply(bno,reply,replyer,replytree) values(#{dto.bno},#{dto.reply},#{mid},concat((select replytree from tbl_reply a where reno = #{dto.reno}),(','),(select max(reno)+1 from tbl_reply a)))")
	public void reReplycreate(@Param("dto") ReplyDTO dto, @Param("mid") String mid);
}
