package com.kimdeagle.ledger.system.ledger;

import java.util.Date;

import lombok.Data;

@Data
public class LedgerSearchDto {

	private String userNo;
	private String inOut;
	private String category;
	private String asset;
	private Date startDate;
	private Date endDate;
	private String startAmount;
	private String endAmount;
	private String keyword;
	
	private String allCategory;
	private String inCategory;
	private String outCategory;
	
	private Boolean isCheckAllDate;
	private Boolean isCheckAllAmount;
	
}
