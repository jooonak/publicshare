package org.slam.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.slam.dto.ReservationDTO;



public interface ResBookMapper {
	//status 확인 필요
	@Insert("insert into db_96.tbl_reservation (bno, mid, status) values (#{dto.bno} , #{mid}, #{dto.status})")
	public void insertReservation(@Param("dto")ReservationDTO dto, @Param("mid")String mid);	//멤버정보는 강제로 집어 넣음
}
