package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Ymember;

public interface YmemberDAO {
	public Ymember selectOne(String userid);
	public List<Ymember> selectList() throws Exception;
	public void createAccount(Ymember yMember);
	public void insertNaverLogin(Map<String, String> resultMap);
	public void update(Ymember yMember);
	public void delete(String userid);
	public void updateAdmin(Map<String, String> findmap);
	public void updateEmailAuth(String userid);
}
