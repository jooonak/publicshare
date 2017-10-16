package org.slam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface MyLibMapper {

	@Insert("insert into tbl_book (bname, publisher, owner) values(#{bname},#{publisher},#{owner})")
	public void register(BookDTO dto);

	@Select("select * from tbl_book order by bno limit #{skip},4;")
	public List<BookDTO> list(Criteria cri);

	@Select("select * from tbl_book where bno = #{bno}")
	public BookDTO getById(int bno);

	@Update("update tbl_book set  bname = #{bname}, publisher = #{publisher}, owner = #{owner} where bno = #{bno}; ")
	public void update(BookDTO dto);

	@Delete("delete from tbl_book where bno = #{bno}")
	public void remove(int bno);

}
