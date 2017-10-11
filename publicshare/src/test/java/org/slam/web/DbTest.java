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
		//datasourse ���� �׽�Ʈ ����
		System.out.println(ds.getConnection());
	}

	
	@Test
	public void mybatisTest() throws Exception {
		//mybatis ���� �Ϸ�
		//db���� test �Ϸ�(dbcp, log4j ���� Ȯ��)
		//lombok test �Ϸ�
		log.info(mapper.connectionTest());
	}
}
