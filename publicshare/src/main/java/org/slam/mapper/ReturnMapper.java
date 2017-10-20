package org.slam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.Criteria;

public interface ReturnMapper {
	
	public List<Map<String, Object>> getList(Criteria cri);
	
	@Update("update tbl_reservation set status = 'onreturn' where rno = #{rno}")
	public void request(int rno);
	//�뿩 ��û, �뿩 ��, ���� �� ���..

	public List<Map<String, Object>> checkItem();

	public void returnConfirm(@Param("bno") int bno, @Param("rno") int rno);
	
}
