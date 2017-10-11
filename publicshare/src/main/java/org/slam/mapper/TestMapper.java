package org.slam.mapper;

import org.apache.ibatis.annotations.Select;

public interface TestMapper {
	
	@Select("select now()")
	public String connectionTest();
	
}
