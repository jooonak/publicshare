package org.slam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.dto.MemberDTO;

public interface LoanBookMapper {

	//DB���� �������� �ش��ϴ� BookList��ȯ
	//select * from tbl_book order by resCnt desc, bno desc limit #{skip},8
	@Select("select * from tbl_book where owner <> #{mid} order by bno desc limit #{cri.skip},8")
	public List<BookDTO> getBookList(@Param("mid") String mid,@Param("cri") Criteria cri);
	
	//DB���� Book���̺��� �� ī��尪 ��ȯ
	@Select("select count(*) from tbl_book where owner != #{mid}")
	public int getTotal(String mid);
	
	//DB���� bno�� �ش��ϴ� Book������ ��ȯ
	@Select("select * from tbl_book where bno = #{bno}")
	public BookDTO getBook(int bno);
	
	//�Ͽ� �޸� ��� ���� �߰��ϴ� sql (hb)
	@Update("update tbl_book set replycnt = replycnt+1 where bno = #{bno}")
	public void updateReplyCnt(int bno);
}
