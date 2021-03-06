package org.slam.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface MyLibMapper {

	@Insert("insert into tbl_book (bname, publisher, owner, img, contents) values(#{bname},#{publisher},#{owner}, #{img}, #{contents})")
	public void register(BookDTO dto);

	//해당 소유주의 물건만 가져오도록 쿼리 수정(sb)
	@Select("select * from tbl_book where owner = #{mid} order by bno desc limit #{cri.skip},8")
	public List<BookDTO> list(@Param("cri") Criteria cri, @Param("mid") String mid);

	@Select("select * from tbl_book where bno = #{bno}")
	public BookDTO getById(int bno);

	@Update("update tbl_book set  bname = #{bname}, publisher = #{publisher}, owner = #{owner}, contents = #{contents}, img = #{img} where bno = #{bno}")
	public void update(BookDTO dto);

	@Delete("delete from tbl_book where bno = #{bno}")
	public void remove(int bno);
	
	@Select("select count(*) from tbl_book where owner = #{mid}")
	public int getTotal(String mid);
	
}
