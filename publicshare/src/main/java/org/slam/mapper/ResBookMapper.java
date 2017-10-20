package org.slam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.ReservationDTO;



public interface ResBookMapper {
	//status Ȯ�� �ʿ�(sb)
	@Insert("insert into db_96.tbl_reservation (bno, lender, status) values (#{dto.bno} , #{lender}, #{dto.status})")
	public void insertReservation(@Param("dto")ReservationDTO dto, @Param("lender")String lender);	//��������� ������ ���� ����(sb)
	
	
	//�����ְ� �뿩 ��û�� ���� �Ϸ� ó���� ���ִ� ����(sb)
	@Update("update tbl_reservation set startdate = now(), status = 'onloan' where rno = #{rno}")
	public void confirmUpdateResData(int rno);
	
	public void rejectUpdateResData(ReservationDTO dto);

	
	//���� �����ڰ� ���� ��Ҹ� �� ��� ���� �����ڿ��� ���� ���θ� ������� �� ���� �����ڰ� ������ �� ��� ȣ��Ǵ� �޼���(sb)
	@Update("update tbl_reservation set status = 'onapply' where rno = #{rno}")
	public void confirmUpdateApplyData(int rno);
	
	//���� �����ڰ� ���� ��Ҹ� �� ��� ���� �����ڿ��� ���� ���θ� ������� �� ���� �����ڰ� ��Ҹ� �� ��� ȣ��Ǵ� �޼���(sb)
	//enddate�� reject�� ��¥�� �����ؼ� ����ϴ� ���� ��� �ϴ� ������ ��.....(sb)
	public void rejectUpdateApplyData(ReservationDTO dto);
	
	
	@Update("update tbl_book set rescnt = rescnt+1 where bno = #{bno}")
	public void updateResCntUp(int bno);
	
	@Update("update tbl_book set rescnt = rescnt-1 where bno = #{bno}")
	public void updateResCntDown(int bno);

	
	public List<Map<String, Object>> getOnApplyReadyList(String lender);

}
