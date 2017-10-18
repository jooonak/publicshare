package org.slam.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.slam.dto.ReservationDTO;



public interface ResBookMapper {
	//status 확인 필요(sb)
	@Insert("insert into db_96.tbl_reservation (bno, lender, status) values (#{dto.bno} , #{lender}, #{dto.status})")
	public void insertReservation(@Param("dto")ReservationDTO dto, @Param("lender")String lender);	//멤버정보는 강제로 집어 넣음(sb)
	
	//소유주가 대여 요청에 대한 완료 처리를 해주는 쿼리(sb)
	@Insert("update tbl_reservation set startdate = now(), status = 'onloan' where rno = #{rno}")
	public void confirmUpdateResData(int rno);
	
	
	public void rejectUpdateResData(ReservationDTO dto);
	
	@Insert("update tbl_book set rescnt = rescnt+1 where bno = #{bno}")
	public void updateResCntUp(int bno);
	
	@Insert("update tbl_book set rescnt = rescnt-1 where bno = #{bno}")
	public void updateResCntDown(int bno);
	
	
}
