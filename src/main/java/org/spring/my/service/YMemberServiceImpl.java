package org.spring.my.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.spring.my.dao.YmemberDAO;
import org.spring.my.dto.Ymember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class YMemberServiceImpl implements YmemberService{
	
	@Autowired
	private YmemberDAO yMemberDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private FileService fileService;

	@Override
	public Map<String, Object> createAccount(Ymember ymember) throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		
		//중복아이디체크 후 rcode, msg 리턴
		//rcode: 0(사용가능), -1(중복ID)
		//msg: 0(사용가능), -1(중복ID)
		
		Ymember returnMember = yMemberDAO.selectOne(ymember.getUserid());
		if(returnMember == null) {
			//비밀번호 암호화
			String bpasswd = bCryptPasswordEncoder.encode(ymember.getPasswd());
			ymember.setPasswd(bpasswd);
			//DB입력
			yMemberDAO.createAccount(ymember);
			resultMap.put("rcode", 0);
			resultMap.put("msg", "가입이 완료되었습니다.");
		}else {
			resultMap.put("rcode", -1);
			resultMap.put("msg", "중복된 아이디입니다.");
		}
		return resultMap;
	}

	@Override
	public Ymember selectOne(String userid) throws Exception {
		return yMemberDAO.selectOne(userid);
	}
	
	@Override
	public Map<String, Object> login(String userid, String passwd) {
		Map<String,Object> resultMap = new HashMap<>(); 
		// 0 : 로그인 완료
		// 1 : 아이디 미존재
		// 2 : 비밀번호 불일치
		//admin: 0:관리자, 1:강사, 2:회원

		int rcode=0;
		String msg ="";
		String admin ="";
		//회원조회
		Ymember member = yMemberDAO.selectOne(userid);
		if (member == null) { //아이디 미존재
			rcode = 1;
			msg = "미가입된 아이디입니다.";
		}else {
			//비밀번호 체크
			//매개변수 : 평문, 암호화된 비밀번호
			if (bCryptPasswordEncoder.matches(passwd, member.getPasswd())) {
				rcode = 0;
				msg = "로그인이 완료되었습니다.";
				admin = member.getAdmin();
			}else {
				rcode = 2;
				msg = "비밀번호가 일치하지 않습니다.";
			}
		}
		resultMap.put("rcode", rcode);
		resultMap.put("msg", msg);
		resultMap.put("admin", admin);
		
		return resultMap;
	}

	@Override
	public List<Ymember> selectList() throws Exception {
		return yMemberDAO.selectList();
	}

	@Override
	public void update(String oldfiles, Ymember yMember) {
		String filename = fileService.fileUpload(yMember.getFiles());
		if(!filename.equals("")) { //이미지파일 신규등록시
			yMember.setFilename(filename);
		}else { //미등록시 oldfiles이름 유지
			yMember.setFilename(oldfiles);
		}
		yMemberDAO.update(yMember);
		
	}

	@Override
	public void delete(String userid) {
		yMemberDAO.delete(userid);
	}

	@Override
	public void updateAdmin(String userid, String admin) {
		Map<String, String> findmap = new HashMap<>();
		findmap.put("userid", userid);
		findmap.put("admin", admin);
		yMemberDAO.updateAdmin(findmap);
		
	}

	@Override
	public void updateEmailAuth(String userid) {
		yMemberDAO.updateEmailAuth(userid);
		
	}
	
	

}
