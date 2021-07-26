package com.kimdeagle.ledger.system.ledger;

import lombok.Data;

@Data
public class StatDto {

	private String userNo;
	
	private String income;
	private String outgoings;
	
	private String incomeCnt;
	private String outgoingsCnt;
	
	private String today;
	
	private String startDate;
	private String endDate;
	
}
