package org.slam.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.slam.dto.ReservationDTO;



public interface ResBookMapper {
	//status Ȯ�� �ʿ�
	@Insert("insert into db_96.tbl_reservation (bno, mid, status) values (#{dto.bno} , #{mid}, #{dto.status})")
	public void insertReservation(@Param("dto")ReservationDTO dto, @Param("mid")String mid);	//��������� ������ ���� ����
}
