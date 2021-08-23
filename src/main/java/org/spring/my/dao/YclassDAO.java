package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Page;
import org.spring.my.dto.Yclass;
import org.spring.my.dto.Ymember;

public interface YclassDAO {
	public List<Ymember> selectTeacherList() throws Exception;
	public void add(Yclass yClass) throws Exception;
	public List<Yclass> selectClassListPage(Page page) throws Exception;
	public void deleteClass(int clsnum) throws Exception;
	public void update(Yclass yClass) throws Exception;
	public void updateLikeCnt(int clsnum) throws Exception;
	public void updateLikeCntCancel(int clsnum) throws Exception;
	public void updateReadCnt(int clsnum) throws Exception;
	public Yclass selectOne(Map<String, Object> findmap) throws Exception;
	public Yclass selectOne(int clsnum) throws Exception;
	public int selectTotCnt(Page page) throws Exception;
	public List<Yclass> selectClassList();

}
