package org.slam.mapper;

import org.apache.ibatis.annotations.Insert;



public interface ResBookMapper {
	//status Ȯ�� �ʿ�
	@Insert("insert into db_96.tbl_reservation (bno, mno, status) values (#{bno} , 15, 'onapply')")
	public void insertReservation(int bno);	//��������� ������ ���� ����
	

}
