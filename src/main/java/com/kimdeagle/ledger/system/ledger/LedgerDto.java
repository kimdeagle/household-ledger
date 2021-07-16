package com.kimdeagle.ledger.system.ledger;

import com.kimdeagle.ledger.util.Pagination;

import lombok.Data;

@Data
public class LedgerDto {

	private String no;
	private String userNo;
	private String addDate;
	private String amount;
	private String content;
	private String inOut;
	private String category;
	private String asset;
	
	private String allCategory;
	private String inCategory;
	private String outCategory;
	
	private LedgerSearchDto search;
	
	private Pagination pagination;
	
}
