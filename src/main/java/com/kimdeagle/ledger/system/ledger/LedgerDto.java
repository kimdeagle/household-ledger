package com.kimdeagle.ledger.system.ledger;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class LedgerDto {

	private int no;
	private int userNo;
	private Date addDate;
	private int amount;
	private String content;
	private String inOut;
	private String category;
	private String asset;
	
}
