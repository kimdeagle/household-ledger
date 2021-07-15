package com.kimdeagle.ledger.system.ledger;

import org.apache.commons.lang3.StringUtils;

import lombok.Data;

@Data
public class LedgerSearchDto {

	private String startDate;
	private String endDate;
	private String startAmount;
	private String endAmount;
	private String keyword;
	private Boolean isCheckAllDate;
	private Boolean isCheckAllAmount;
	
	public Boolean isEmpty() {
		return
				this.startDate == null &&
				this.endDate == null &&
				StringUtils.isEmpty(this.startAmount) &&
				StringUtils.isEmpty(this.endAmount) &&
				StringUtils.isEmpty(this.keyword) &&
				this.isCheckAllDate == null &&
				this.isCheckAllAmount == null;
	}
	
}
