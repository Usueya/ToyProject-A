package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Yreview;

public interface YreviewDAO {
	public void reviewAdd(Yreview yReview);
	public void reviewDelete(int rnum);
	public Yreview selectOne(Map<String, Object> findmap);
	public  List<Map<String, Object>> selectList(int clsnum);

}
