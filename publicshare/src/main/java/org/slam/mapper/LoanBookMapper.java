package org.slam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface LoanBookMapper {

	//DB���� �������� �ش��ϴ� BookList��ȯ
	@Select("select * from tbl_book order by bno desc limit #{skip},8")
	public List<BookDTO> getBookList(Criteria cri);
	
	//DB���� Book���̺��� �� ī��尪 ��ȯ
	@Select("select count(*) from tbl_book")
	public int getTotal();
}
