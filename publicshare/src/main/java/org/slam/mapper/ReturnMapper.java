package org.slam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface ReturnMapper {
	
	@Select("select * from tbl_reservation where lender = 'testUser'")
	List<BookDTO> getList(Criteria cri);

}
