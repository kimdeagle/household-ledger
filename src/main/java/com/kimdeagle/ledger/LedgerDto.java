package com.kimdeagle.ledger;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class LedgerDto {

	private int no;
	private int userNo;
	
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
//	private Timestamp addDate;
	private int amount;
	private String content;
	private String inOut;
	private String category;
	private String asset;
	
}
