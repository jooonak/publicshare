package org.slam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.ReservationDTO;

public interface ReturnMapper {
	
	public List<Map<String, Object>> getList(@Param("skip") int skip, @Param("status") String status, @Param("mid") String mid);
	
	public void request(ReservationDTO dto);
	
	public List<Map<String, Object>> getOnApplyReadyList(String lender);
	
	public List<Map<String, Object>> checkItem(String mid);
	
	public void returnConfirm(@Param("bno") int bno, @Param("rno") int rno);
	
	@Update("update tbl_reservation set status = 'returnrejected' where rno = #{rno}")
	public void returnReject(int rno);
	
	public List<Map<String, Object>> checkReturn(String mid);
	
	@Update("update tbl_reservation set status = 'onloan' where rno = #{rno}")
	public void checkReject(int rno);
	
	@Select("select count(*) from tbl_reservation where lender = #{mid} and status = 'onloan'")
	public int getTotal(String mid);
	
	//사용자의 대여 이력 (hb)
	public List<Map<String, Object>> loanHistoryList(String mid);
}
