package org.slam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.dto.ReservationDTO;

public interface ReturnMapper {
	
	@Select("select * from tbl_reservation where lender = 'testUser'")
	public List<BookDTO> getList(Criteria cri);
	
	public List<Map<String, Object>> getOnApplyReadyList(String lender);
		

}
