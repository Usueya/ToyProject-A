package org.spring.my;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring.my.dao.YclassDAO;
import org.spring.my.dto.Yclass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml",
									"file:src/main/webapp/WEB-INF/spring/**/servlet-context.xml"})
public class BoardTest {
	
	@Autowired
	private YclassDAO yClassDAO;

	@Test
	public void test() throws Exception {
		Yclass yClass = yClassDAO.selectOne(1);
		System.out.println(yClass);
	}

}
