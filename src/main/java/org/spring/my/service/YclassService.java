package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Page;
import org.spring.my.dto.Yclass;
import org.spring.my.dto.Ymember;

public interface YclassService {
	public List<Ymember> selectTeacherList() throws Exception;
	public void add(Yclass yClass) throws Exception;
	public List<Yclass> selectClassListPage(Page page) throws Exception;
	public Yclass selectOne(Map<String, Object> findmap) throws Exception;
	public void deleteClass(int clsnum) throws Exception;
	public void update(String oldfiles, Yclass yClass) throws Exception;
	public void updateLikeCnt(int clsnum, String userid) throws Exception;
	public void updateLikeCntCancel(int clsnum, String userid) throws Exception;
	public void updateReadCnt(int clsnum, String userid) throws Exception;
	public Yclass selectOne(int clsnum) throws Exception;
	public List<Yclass> selectClassList() throws Exception;

}
