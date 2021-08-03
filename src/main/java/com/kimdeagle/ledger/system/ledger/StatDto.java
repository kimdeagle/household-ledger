package com.kimdeagle.ledger.system.ledger;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class StatDto {

	private String userNo;
	
	private String income;
	private String outgoings;
	
	private String date;
	
	private String incomeCnt;
	private String outgoingsCnt;
	
	private String startDate;
	private String endDate;
	
	public StatDto() {}
	
	public StatDto(String userNo, String date) {
		this.userNo = userNo;
		this.date = date;
	}
	
	public StatDto(String userNo, String startDate, String endDate) {
		this.userNo = userNo;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
	public static StatDto todayStat(String userNo) {
		
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		return new StatDto(userNo, date);
		
	}
	
	public static StatDto monthlyStat(String userNo) {
		
		String date = new SimpleDateFormat("yyyy-MM").format(new Date());
		
		return new StatDto(userNo, date);
		
	}
	
	public static StatDto annualStat(String userNo) {
		
		String date = new SimpleDateFormat("yyyy").format(new Date());
		
		return new StatDto(userNo, date);
		
	}
	
	public static StatDto setDateStat(String userNo, String startDate, String endDate) {
		
		return new StatDto(userNo, startDate, endDate);
		
	}
	
}
