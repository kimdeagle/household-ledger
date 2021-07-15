package com.kimdeagle.ledger.util;

import lombok.Data;

@Data
public class Pagination {

	private int pageNum; //현재 페이지 번호
	private int cntPerPage; //페이지당 게시글 수
	private int startIdx; //mysql limit 시작 숫자
	
	private int totalLedgerCnt; //총 게시글 수
	private int totalPageCnt; //총 페이지 수
	
	private int startPageNum; //시작 페이지 번호
	private int endPageNum; //끝 페이지 번호
	
	private int realEndPageNum; //실제 끝나는 페이지
	
	private boolean prev; //이전 페이지
	private boolean next; //다음 페이지
	
	public Pagination() {
		this.pageNum = 1;
		this.cntPerPage = 10;
	}
	
	public void setPagination() {
		this.startIdx = (pageNum - 1) * this.cntPerPage;
		this.totalPageCnt = (int)Math.ceil(this.totalLedgerCnt / 10.0);
		this.endPageNum = (int)Math.ceil(this.pageNum / 10.0) * this.cntPerPage;
		this.startPageNum = this.endPageNum - cntPerPage + 1;
		this.realEndPageNum = (int)Math.ceil(this.totalLedgerCnt / 10.0);
		
		if (this.realEndPageNum < this.endPageNum) {
			this.endPageNum = this.realEndPageNum;
		}
		
		this.prev = this.startPageNum > 1;
		this.next = this.endPageNum < this.realEndPageNum;
		
	}
	
}
