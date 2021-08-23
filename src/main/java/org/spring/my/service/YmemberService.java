package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Ymember;

public interface YmemberService {
	public Map<String, Object> createAccount(Ymember ymember) throws Exception;
	public List<Ymember> selectList() throws Exception;
	public Ymember selectOne(String userid) throws Exception;
	public Map<String, Object> login(String userid, String passwd);
	public void update(String oldfiles, Ymember yMember);
	public void delete(String userid);
	public void updateAdmin(String userid, String admin);
	public void updateEmailAuth(String userid);

}
