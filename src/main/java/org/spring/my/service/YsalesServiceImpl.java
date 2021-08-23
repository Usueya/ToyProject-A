package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dao.YsalesDAO;
import org.spring.my.dto.Ysales;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YsalesServiceImpl  implements YsalesService{
	
	@Autowired
	YsalesDAO ysalesDAO;

	@Override
	public void salesAdd(Ysales ySales) {
		ysalesDAO.salesAdd(ySales);
	}

	@Override
	public List<Ysales> selectListUser(String userid) {
		return ysalesDAO.selectListUser(userid);
	}

	@Override
	public List<Ysales> selectListClass(int clsnum) {
		return ysalesDAO.selectListClass(clsnum);
	}

	@Override
	public List<Map<String, Object>> selectList() {
		return ysalesDAO.selectList();
	}

	@Override
	public Ysales selectOne(int salenum) {
		return ysalesDAO.selectOne(salenum);
	}

	@Override
	public void saleUpdate(Ysales ySales) {
		ysalesDAO.saleUpdate(ySales);
		
	}

	@Override
	public void saleDelete(int salenum) {
		ysalesDAO.saleDelete(salenum);
		
	}

}
