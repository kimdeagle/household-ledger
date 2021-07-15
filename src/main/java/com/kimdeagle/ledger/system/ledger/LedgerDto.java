package com.kimdeagle.ledger.system.ledger;

import java.util.Date;

import com.kimdeagle.ledger.util.Pagination;

import lombok.Data;

@Data
public class LedgerDto {

	private String no;
	private String userNo;
	private Date addDate;
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
