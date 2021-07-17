package com.kimdeagle.ledger.user;

import java.util.Date;

import lombok.Data;

@Data
public class UserDto {

	private String no;
	private String id;
	private String pw;
	private String name;
	private String email;
	private Date registDate;
	private Date updateDate;
	
	private Date lastLoginDate;
	
}
