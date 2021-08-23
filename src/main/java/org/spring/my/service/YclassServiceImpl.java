package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dao.ReactionDAO;
import org.spring.my.dao.YclassDAO;
import org.spring.my.dto.Page;
import org.spring.my.dto.Reaction;
import org.spring.my.dto.Yclass;
import org.spring.my.dto.Ymember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class YclassServiceImpl implements YclassService{
	
	@Autowired
	private YclassDAO yClassDAO;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private ReactionDAO reactionDAO;
	
	//클래스조회
	@Override
	public Yclass selectOne(Map<String, Object> findmap) throws Exception{
		return yClassDAO.selectOne(findmap);
	}

	//강사리스트
	@Override
	public List<Ymember> selectTeacherList() throws Exception{
		return yClassDAO.selectTeacherList();
	}
	
	//클래스리스트
	@Override
	public List<Yclass> selectClassList() throws Exception {
		return yClassDAO.selectClassList();
	}
	
	//페이징클래스리스트
	@Override
	public List<Yclass> selectClassListPage(Page page) throws Exception{
		//totPage=0, startNum=0, endNum=0, 
		//startPage=0, endtPage=0 값구해서 셋팅
		
		//전체게시물수(조건이 있을경우 적용)
		int totCnt = yClassDAO.selectTotCnt(page);
		
		System.out.println("totCnt"+totCnt);
		
		//페이지수(totPage = 전체게시물수/페이지당게시물수)
		int totPage = totCnt/page.getPerPage();
		if(totCnt % page.getPerPage() != 0) totPage +=1;
		page.setTotPage(totPage);
		//현재페이지(뷰에서 클릭한 값)
		int curPage = page.getCurPage();
		
		//게시물 시작번호
		int startNum = (curPage-1) * page.getPerPage();
		page.setStartNum(startNum);
		//게시물 끝번호
		int endNum = startNum + page.getPerPage() -1;
		page.setEndNum(endNum);
		
		//시작페이지
		int startPage = curPage - ((curPage -1)%page.getPerBlock());
		page.setStartPage(startPage);
		//끝페이지
		int endPage = startPage + page.getPerBlock()-1;
		if(endPage > totPage) endPage = totPage;
		page.setEndPage(endPage);
		
		System.out.println("page"+page);
		
		return yClassDAO.selectClassListPage(page);
	}

	//클래스 이미지 저장 및 클래스 정보 DB저장
	@Transactional
	@Override
	public void add(Yclass yClass) throws Exception{
		//파일저장 후 저장된 파일명 DTO에 담기
		String filename = fileService.fileUpload(yClass.getFiles());
		yClass.setFilename(filename);
		//클래스정보 DB 저장
		yClassDAO.add(yClass);
	}

	//클래스삭제
	@Override
	public void deleteClass(int clsnum) throws Exception{
		yClassDAO.deleteClass(clsnum);
	}

	//클래스업데이트
	@Transactional
	@Override
	public void update(String oldfiles, Yclass yClass) throws Exception{
		String filename = fileService.fileUpload(yClass.getFiles());
		if(!filename.equals("")) { //이미지파일 신규등록시
			yClass.setFilename(filename);
		}else { //미등록시 oldfiles이름 유지
			yClass.setFilename(oldfiles);
		}
		yClassDAO.update(yClass);
		
	}
	//좋아요+1
	@Transactional
	@Override
	public void updateLikeCnt(int clsnum, String userid) throws Exception{
		//class에 like +1
		yClassDAO.updateLikeCnt(clsnum);
		
		//reaction에 업데이트
		Reaction reaction = new Reaction();
		reaction.setClsnum(clsnum);
		reaction.setUserid(userid);
		reaction.setState("1"); //0:없음 1:좋아요 2:싫어요
		
		reactionDAO.update(reaction);
		
	}
	
	//좋아요-1
	@Transactional
	@Override
	public void updateLikeCntCancel(int clsnum, String userid) throws Exception{
		//class에 like -1
		yClassDAO.updateLikeCntCancel(clsnum);
		
		//reaction에 업데이트
		Reaction reaction = new Reaction();
		reaction.setClsnum(clsnum);
		reaction.setUserid(userid);
		reaction.setState("0"); //0:없음 1:좋아요 2:싫어요
		
		reactionDAO.update(reaction);
		
	}
	
	//조회수
	@Transactional
	@Override
	public void updateReadCnt(int clsnum, String userid) throws Exception{
		
		Reaction reaction = new Reaction();
		reaction.setClsnum(clsnum);
		reaction.setUserid(userid);
		reaction.setState("0"); //0:없음 1:좋아요 2:싫어요
		
		Reaction returnReaction = reactionDAO.selectOne(reaction);
		
		if(returnReaction == null) {
			reactionDAO.insert(reaction);
			//조회수 +1
			yClassDAO.updateReadCnt(clsnum);
		}
		
		
	}

	@Override
	public Yclass selectOne(int clsnum) throws Exception {
		return yClassDAO.selectOne(clsnum);
	}







}
