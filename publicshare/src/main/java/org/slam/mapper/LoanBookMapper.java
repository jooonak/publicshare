package org.slam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface LoanBookMapper {

	//DB에서 페이지에 해당하는 BookList반환
	@Select("select * from tbl_book order by bno desc limit #{skip},8")
	public List<BookDTO> getBookList(Criteria cri);
	
	//DB에서 Book테이블의 총 카운드값 반환
	@Select("select count(*) from tbl_book")
	public int getTotal();
}
