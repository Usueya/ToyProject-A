package org.spring.my.dao;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Reaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReactionDAOImpl implements ReactionDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insert(Reaction reaction) {
		sqlSession.insert("org.spring.my.ReactionMapper.insert", reaction);
	}

	@Override
	public Reaction selectOne(Reaction reaction) {
		return sqlSession.selectOne("org.spring.my.ReactionMapper.selectOne", reaction);
	}

	@Override
	public void update(Reaction reaction) {
		sqlSession.update("org.spring.my.ReactionMapper.update", reaction);
	}

}
