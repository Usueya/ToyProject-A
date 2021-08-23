package org.spring.my.dto;

import lombok.Data;

@Data
public class Page {
	//게시물 검색 조건
	private String findKey;
	private String findValue;
	
	/*
	 * 페이징 처리에 필요한 속성
	 * ---------------------------------------------------------
	 * 게시물 조회(curPage:1~6 중 선택한 페이지)       perPage:5
	 * 번호            제목       조회수       작성일 
	 * ---------------------------------------------------------
	 * 1(startNum)    제목test      0          2021-07-15  
	 * ---------------------------------------------------------
	 * 2              제목test      0          2021-07-15  
	 * ---------------------------------------------------------
	 * 3              제목test      0          2021-07-15  
	 * ---------------------------------------------------------
	 * 4              제목test      0          2021-07-15  
	 * ---------------------------------------------------------
	 * 5(endNum)      제목test      0          2021-07-15  
	 * ---------------------------------------------------------
	 *                                         totPage : 6
	 *     1(startPage),    2,    3,    4,    5(endtPage)
	 * ---------------------------------------------------------
	 */
	
	private int curPage = 1; //현재 페이지
	private int perPage = 6; //페이지당 노출 갯수
	private int perBlock = 5; //한화면의 페이지수
	
	private int totPage; //전체페이지수
	private int startNum; //페이지 시작번호
	private int endNum; //페이지 끝번호
	private int startPage; //시작페이지
	private int endPage; //끝 페이지
	
}
