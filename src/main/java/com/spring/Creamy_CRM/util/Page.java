package com.spring.Creamy_CRM.util;

public class Page {

	private int pageSize; // 한페이지당 출력할 글 갯수
	private int pageBlock; // 한 블럭당 페이지 갯수

	private int cnt; // 글 갯수
	private int start; // 현재 페이지 시작 글 번호
	private int end; // 현재 페이지의 마지막 글 번호
	private int number; // 출력용 글번호
	private int currentPage; // 현재 페이지
	private int pageCount; // 페이지 갯수
	private int startPage; // 시작 페이지
	private int endPage; // 마지막 페이지

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getStart() {
		return start = getEnd() - getPageSize() + 1;
	}

	public int getEnd() {
		return end = getCurrentPage() * getPageSize();
	}

	public int getNumber() {
		return number = getStart();
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String pageNum) {
		if (pageNum == null || pageNum.equals("")) {
			this.currentPage = 1;
		} else {
			this.currentPage = Integer.parseInt(pageNum);
		}
	}

	public int getPageCount() {
		return pageCount = (getCnt() / getPageSize()) + (getCnt() % getPageSize() > 0 ? 1 : 0);
	}

	public int getStartPage() {
		startPage = (getCurrentPage() / getPageBlock()) * getPageBlock() + 1;
		if (getCurrentPage() % getPageBlock() == 0) {
			startPage -= getPageBlock();
		}
		return startPage;
	}

	public int getEndPage() {
		endPage = getStartPage() + getPageBlock() - 1;
		if (endPage > getPageCount()) {
			endPage = getPageCount();
		}
		return endPage;
	}

}
