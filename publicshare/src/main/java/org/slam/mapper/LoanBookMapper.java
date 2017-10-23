package org.slam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.dto.MemberDTO;

public interface LoanBookMapper {

	//DB에서 페이지에 해당하는 BookList반환
	//select * from tbl_book order by resCnt desc, bno desc limit #{skip},8
	@Select("select * from tbl_book where owner <> #{mid} order by bno desc limit #{cri.skip},8")
	public List<BookDTO> getBookList(@Param("mid") String mid,@Param("cri") Criteria cri);
	
	//DB에서 Book테이블의 총 카운드값 반환
	@Select("select count(*) from tbl_book where owner != #{mid}")
	public int getTotal(String mid);
	
	//DB에서 bno에 해당하는 Book데이터 반환
	@Select("select * from tbl_book where bno = #{bno}")
	public BookDTO getBook(int bno);
	
	//북에 달린 댓글 수를 추가하는 sql (hb)
	@Update("update tbl_book set replycnt = replycnt+1 where bno = #{bno}")
	public void updateReplyCnt(int bno);
}
