package org.spring.my.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.spring.my.dao.YreviewDAO;
import org.spring.my.dto.Yreview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YreviewServiceImpl implements YreviewService{
	
	@Autowired
	YreviewDAO yReviewDAO;

	@Override
	public void reviewAdd(Yreview yReview) {
		yReviewDAO.reviewAdd(yReview);
	}

	@Override
	public void reviewDelete(int rnum) {
		yReviewDAO.reviewDelete(rnum);
	}

	@Override
	public Yreview selectOne(String userid, int salenum) {
		Map<String, Object> findmap = new HashMap<>();
		findmap.put("userid", userid);
		findmap.put("salenum", salenum);
		return yReviewDAO.selectOne(findmap);
		
	}

	@Override
	public  List<Map<String, Object>> selectList(int clsnum) {
		return yReviewDAO.selectList(clsnum);
	}

}
