package com.hmc.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Pagination {

	// 현재 페이지번호
	private int pageNo;
	// 조회된 총 갯수
	private int totalRows;
	// 총 페이지 갯수
	private int totalPages;
	// 총 페이지블록 갯수(한 페이지블록은 페이지번호를 5개씩 포함한다.)
	private int totalPageBlocks;
	// 현제 페이지번호에 해당하는 블록번호
	private int currentPageBlock;
	// 시작페이지번호
	private int beginPage;
	// 끝페이지번호
	private int endPage;
}
