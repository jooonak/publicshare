package org.slam.web;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slam.mapper.TestMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
        locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DbTest {
	
	@Inject
	DataSource ds;
	
	@Inject
	TestMapper mapper;
	
	@Test
	public void dsTest() throws Exception {
		//datasourse 주입 테스트 성공
		System.out.println(ds.getConnection());
	}

	
	@Test
	public void mybatisTest() throws Exception {
		//mybatis 설정 완료
		//db접근 test 완료(dbcp, log4j 적용 확인)
		//lombok test 완료
		log.info(mapper.connectionTest());
	}
}
