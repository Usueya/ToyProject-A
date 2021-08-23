package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Ymember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class YmemberDAOImpl implements YmemberDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public Ymember selectOne(String userid) {
		return sqlSession.selectOne("org.spring.my.YmemberMapper.selectOne", userid);
	}

	@Override
	public void createAccount(Ymember yMember) {
		sqlSession.insert("org.spring.my.YmemberMapper.insert", yMember);
	}
	
	//네이버 간편가입
	@Override
	public void insertNaverLogin(Map<String, String> resultMap) {
		sqlSession.insert("org.spring.my.YmemberMapper.insertNaverLogin", resultMap);
	}

	@Override
	public List<Ymember> selectList() throws Exception {
		return sqlSession.selectList("org.spring.my.YmemberMapper.selectList");
	}

	@Override
	public void update(Ymember yMember) {
		sqlSession.update("org.spring.my.YmemberMapper.update", yMember);
	}

	@Override
	public void delete(String userid) {
		sqlSession.delete("org.spring.my.YmemberMapper.delete", userid);
	}

	@Override
	public void updateAdmin(Map<String, String> findmap) {
		sqlSession.update("org.spring.my.YmemberMapper.updateAdmin", findmap);
		
	}

	@Override
	public void updateEmailAuth(String userid) {
		sqlSession.update("org.spring.my.YmemberMapper.updateEmailAuth", userid);
	}

}
