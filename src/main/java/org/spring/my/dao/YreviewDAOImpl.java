package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Yreview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class YreviewDAOImpl implements YreviewDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void reviewAdd(Yreview yReview) {
		sqlSession.insert("org.spring.my.YreviewMapper.insert", yReview);
		
	}

	@Override
	public void reviewDelete(int rnum) {
		sqlSession.delete("org.spring.my.YreviewMapper.delete",rnum);
		
	}

	@Override
	public Yreview selectOne(Map<String, Object> findmap) {
		return sqlSession.selectOne("org.spring.my.YreviewMapper.selectOne",findmap);
	}

	@Override
	public List<Map<String, Object>> selectList(int clsnum) {
		return sqlSession.selectList("org.spring.my.YreviewMapper.selectList",clsnum);
	}

}
