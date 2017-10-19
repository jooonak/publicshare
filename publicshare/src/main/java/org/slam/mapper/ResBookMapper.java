package org.slam.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.slam.dto.ReservationDTO;



public interface ResBookMapper {
	//status Ȯ�� �ʿ�(sb)
	@Insert("insert into db_96.tbl_reservation (bno, lender, status) values (#{dto.bno} , #{lender}, #{dto.status})")
	public void insertReservation(@Param("dto")ReservationDTO dto, @Param("lender")String lender);	//��������� ������ ���� ����(sb)
	
	//�����ְ� �뿩 ��û�� ���� �Ϸ� ó���� ���ִ� ����(sb)
	@Insert("update tbl_reservation set startdate = now(), status = 'onloan' where rno = #{rno}")
	public void confirmUpdateResData(int rno);
	
	
	public void rejectUpdateResData(ReservationDTO dto);
	
	@Insert("update tbl_book set rescnt = rescnt+1 where bno = #{bno}")
	public void updateResCntUp(int bno);
	
	@Insert("update tbl_book set rescnt = rescnt-1 where bno = #{bno}")
	public void updateResCntDown(int bno);
	
	
}
