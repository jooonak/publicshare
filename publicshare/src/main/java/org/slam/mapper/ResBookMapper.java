package org.slam.mapper;

import org.apache.ibatis.annotations.Insert;



public interface ResBookMapper {
	//status 확인 필요
	@Insert("insert into db_96.tbl_reservation (bno, mno, status) values (#{bno} , 15, 'onapply')")
	public void insertReservation(int bno);	//멤버정보는 강제로 집어 넣음
	

}
