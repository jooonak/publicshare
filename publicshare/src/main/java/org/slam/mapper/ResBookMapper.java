package org.slam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.ReservationDTO;



public interface ResBookMapper {
	//status 확인 필요(sb)
	@Insert("insert into tbl_reservation (bno, lender, status) values (#{dto.bno} , #{mid}, #{dto.status})")//#{dto.status}
	public void insertReservation(@Param("dto")ReservationDTO dto, @Param("mid")String mid);
	
	
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

	//내가 예약했던 책이 내 차례가 되었을 때의 리스트를 불러오는 쿼리
	public List<Map<String, Object>> getOnApplyReadyList(String lender);
	
	//소유주의 물건에 등록 신청을 했을 경우에 생기는 쿼리(sb)
	public List<Map<String, Object>> getApplyList(String owner);

	//대여 신청할 때 해당 책에 대한 예약 카운트 (대여자 수)를 가져오는 쿼리
	@Select("select rescnt from tbl_book where bno = #{bno}")
	public int bookCheck(int bno);

	@Select("select  rno, lender, status, startdate, rescnt, res.latefee from tbl_reservation res, tbl_book book where res.bno = book.bno and book.bno = #{bno} and status != 'returned'"
			+ " and status != 'cancel' and status != 'loanrejected'")
	public List<Map<String, Object>> getResHistory(int bno);

	@Select("select lender, status, returndate, res.latefee, resdate, regdate, rescnt from tbl_reservation res, tbl_book book where res.bno = book.bno and book.bno = #{bno} order by rno desc")
	public List<Map<String, Object>> getBookHistory(int bno);
	
	//사용자의 과거 대여 이력
	public List<Map<String, Object>> loanHistoryList(String mid);


}
