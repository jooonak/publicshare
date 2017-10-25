package org.slam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface ImgFileMapper {
	public void insertImgFileList(String[] imgFiles);

	public void modifyImgFileList(@Param("imgFiles")String[] imgFiles, @Param("bno") int bno);
	
	@Select("select imgname from tbl_image where bno = #{bno}")
	public String[] getImgListById(int bno);


	@Delete("delete from tbl_image where bno = #{bno}")
	public void delete(int bno);

}
