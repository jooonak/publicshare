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
	
	//댓글에 대한 기록은 남겨놔야 하므로 삭제처리를 요청해도 db 상에서는 해당 댓글 기록을 남겨놓아야 한다. 그렇게 하기 위해 상태값 업데이트를 진행한다.
	@Delete("update tbl_reply set delreply = 'T' where reno = #{reno}")
	public void delete(int reno);

	@Update("update tbl_reply set reply= #{reply} where reno = #{reno} ")
	public void update(ReplyDTO dto);
	
	//대댓글에 대한 sql
	@Insert("insert into tbl_reply(bno,reply,replyer,replytree) values(#{dto.bno},#{dto.reply},#{mid},concat((select replytree from tbl_reply a where reno = #{dto.reno}),(','),(select max(reno)+1 from tbl_reply a)))")
	public void reReplycreate(@Param("dto") ReplyDTO dto, @Param("mid") String mid);
}
