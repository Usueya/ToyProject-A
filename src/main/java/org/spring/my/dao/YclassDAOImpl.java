package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Page;
import org.spring.my.dto.Yclass;
import org.spring.my.dto.Ymember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class YclassDAOImpl implements YclassDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Ymember> selectTeacherList() throws Exception{
		return sqlSession.selectList("org.spring.my.YclassMapper.selectTeacherList");
	}
	
	@Override
	public List<Yclass> selectClassListPage(Page page) throws Exception{
		return sqlSession.selectList("org.spring.my.YclassMapper.selectClassListPage", page);
	}
	
	@Override
	public List<Yclass> selectClassList() {
		return sqlSession.selectList("org.spring.my.YclassMapper.selectClassList");
	}

	@Override
	public void add(Yclass yClass) throws Exception{
		sqlSession.insert("org.spring.my.YclassMapper.insert", yClass);
	}

	@Override
	public Yclass selectOne(Map<String, Object> findmap) throws Exception{
		return sqlSession.selectOne("org.spring.my.YclassMapper.selectClassOne", findmap);
	}

	@Override
	public void deleteClass(int clsnum) throws Exception{
		sqlSession.delete("org.spring.my.YclassMapper.delete", clsnum);
	}

	@Override
	public void update(Yclass yClass) throws Exception{
		sqlSession.update("org.spring.my.YclassMapper.update", yClass);
	}

	@Override
	public void updateLikeCnt(int clsnum) throws Exception{
		sqlSession.update("org.spring.my.YclassMapper.updateLikeCnt", clsnum);
	}

	@Override
	public void updateLikeCntCancel(int clsnum) throws Exception{
		sqlSession.update("org.spring.my.YclassMapper.updateLikeCntCancel", clsnum);
	}

	@Override
	public void updateReadCnt(int clsnum) throws Exception{
		sqlSession.update("org.spring.my.YclassMapper.updateReadCnt", clsnum);
	}

	@Override
	public Yclass selectOne(int clsnum) throws Exception{
		return sqlSession.selectOne("org.spring.my.YclassMapper.selectOne", clsnum);
	}

	@Override
	public int selectTotCnt(Page page) throws Exception{
		return sqlSession.selectOne("org.spring.my.YclassMapper.selectTotCnt",page);
	}





}
