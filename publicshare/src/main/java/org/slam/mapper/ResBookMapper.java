package org.slam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.ReservationDTO;



public interface ResBookMapper {
	//status 확인 필요(sb)
	@Insert("insert into db_96.tbl_reservation (bno, lender, status) values (#{dto.bno} , #{lender}, #{dto.status})")
	public void insertReservation(@Param("dto")ReservationDTO dto, @Param("lender")String lender);	//멤버정보는 강제로 집어 넣음(sb)
	
	
	//소유주가 대여 요청에 대한 완료 처리를 해주는 쿼리(sb)
	@Update("update tbl_reservation set startdate = now(), status = 'onloan' where rno = #{rno}")
	public void confirmUpdateResData(int rno);
	
	public void rejectUpdateResData(ReservationDTO dto);

	
	//이전 예약자가 예약 취소를 한 경우 다음 예약자에게 예약 여부를 물어보았을 때 다음 예약자가 컨펌을 한 경우 호출되는 메서드(sb)
	@Update("update tbl_reservation set status = 'onapply' where rno = #{rno}")
	public void confirmUpdateApplyData(int rno);
	
	//이전 예약자가 예약 취소를 한 경우 다음 예약자에게 예약 여부를 물어보았을 때 다음 예약자가 취소를 한 경우 호출되는 메서드(sb)
	//enddate를 reject된 날짜로 생각해서 등록하는 것은 어떤가 하는 생각이 듬.....(sb)
	public void rejectUpdateApplyData(ReservationDTO dto);
	
	
	@Update("update tbl_book set rescnt = rescnt+1 where bno = #{bno}")
	public void updateResCntUp(int bno);
	
	@Update("update tbl_book set rescnt = rescnt-1 where bno = #{bno}")
	public void updateResCntDown(int bno);

	
	public List<Map<String, Object>> getOnApplyReadyList(String lender);

}
