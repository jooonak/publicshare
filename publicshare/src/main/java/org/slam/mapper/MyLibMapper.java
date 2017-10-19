package org.slam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;

public interface MyLibMapper {

	@Insert("insert into tbl_book (bname, publisher, owner) values(#{bname},#{publisher},#{owner})")
	public void register(BookDTO dto);

	//�ش� �������� ���Ǹ� ���������� ���� ����(sb)
	@Select("select * from tbl_book where owner = #{mid} order by bno limit #{cri.skip},4")
	public List<BookDTO> list(@Param("cri") Criteria cri, @Param("mid") String mid);

	@Select("select * from tbl_book where bno = #{bno}")
	public BookDTO getById(int bno);

	@Update("update tbl_book set  bname = #{bname}, publisher = #{publisher}, owner = #{owner} where bno = #{bno}")
	public void update(BookDTO dto);

	@Delete("delete from tbl_book where bno = #{bno}")
	public void remove(int bno);
	

	//�������� ���ǿ� ��� ��û�� ���� ��쿡 ����� ����(��)
	public List<Map<String, Object>> getApplyList(String owner);

}
