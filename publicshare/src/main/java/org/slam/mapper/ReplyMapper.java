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

	@Select("select * from tbl_reply where bno = #{bno}  limit #{cri.skip},10")
	public List<ReplyDTO> list(@Param("cri") Criteria cri, @Param("bno") int bno);

	@Insert("insert into tbl_reply(bno,reply, replyer) values(#{bno},#{reply},'admin')")
	public void create(ReplyDTO dto);

	@Delete("delete from tbl_reply where reno = #{reno}")
	public void delete(int reno);

	@Update("update tbl_reply set reply= #{reply} where reno = #{reno} ")
	public void update(ReplyDTO dto);

}
