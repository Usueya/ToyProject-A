package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Ysales;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class YsalesDAOImpl implements YsalesDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void salesAdd(Ysales ySales) {
		sqlSession.insert("org.spring.my.YsalesMapper.insert", ySales);
	}
	
	@Override
	public List<Ysales> selectListUser(String userid) {
		return sqlSession.selectList("org.spring.my.YsalesMapper.selectListUser", userid);
	}
	
	@Override
	public List<Ysales> selectListClass(int clsnum) {
		return sqlSession.selectList("org.spring.my.YsalesMapper.selectListClass", clsnum);
	}
	
	@Override
	public List<Map<String, Object>> selectList(){
		return sqlSession.selectList("org.spring.my.YsalesMapper.selectList");
	}

	@Override
	public Ysales selectOne(int salenum) {
		return sqlSession.selectOne("org.spring.my.YsalesMapper.selectOne", salenum);
	}

	@Override
	public void saleUpdate(Ysales ySales) {
		sqlSession.update("org.spring.my.YsalesMapper.update", ySales);
	}

	@Override
	public void saleDelete(int salenum) {
		sqlSession.delete("org.spring.my.YsalesMapper.delete", salenum);
		
	}

}
