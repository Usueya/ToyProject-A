package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Yreview;

public interface YreviewService {
	public void reviewAdd(Yreview yReview);
	public void reviewDelete(int rnum);
	public Yreview selectOne(String userid, int salenum);
	public  List<Map<String, Object>> selectList(int clsnum);
}
