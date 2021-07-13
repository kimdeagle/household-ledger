package com.kimdeagle.ledger.member;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberDto {

	private String no;
	private String id;
	private String pw;
	private String name;
	private String email;
	private Date registDate;
	private Date updateDate;
	
}
