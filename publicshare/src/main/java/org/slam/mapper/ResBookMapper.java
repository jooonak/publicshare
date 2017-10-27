package org.slam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.ReservationDTO;



public interface ResBookMapper {
	//status Ȯ�� �ʿ�(sb)
	@Insert("insert into tbl_reservation (bno, lender, status) values (#{dto.bno} , #{mid}, #{dto.status})")//#{dto.status}
	public void insertReservation(@Param("dto")ReservationDTO dto, @Param("mid")String mid);
	
	
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

	//���� �����ߴ� å�� �� ���ʰ� �Ǿ��� ���� ����Ʈ�� �ҷ����� ����
	public List<Map<String, Object>> getOnApplyReadyList(String lender);
	
	//�������� ���ǿ� ��� ��û�� ���� ��쿡 ����� ����(sb)
	public List<Map<String, Object>> getApplyList(String owner);

	//�뿩 ��û�� �� �ش� å�� ���� ���� ī��Ʈ (�뿩�� ��)�� �������� ����
	@Select("select rescnt from tbl_book where bno = #{bno}")
	public int bookCheck(int bno);

	@Select("select  rno, lender, status, startdate, rescnt, res.latefee from tbl_reservation res, tbl_book book where res.bno = book.bno and book.bno = #{bno} and status != 'returned'"
			+ " and status != 'cancel' and status != 'loanrejected'")
	public List<Map<String, Object>> getResHistory(int bno);

	@Select("select lender, status, returndate, res.latefee, resdate, regdate, rescnt from tbl_reservation res, tbl_book book where res.bno = book.bno and book.bno = #{bno} order by rno desc")
	public List<Map<String, Object>> getBookHistory(int bno);
	
	//������� ���� �뿩 �̷�
	public List<Map<String, Object>> loanHistoryList(String mid);


}
