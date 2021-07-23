package com.kimdeagle.ledger.util;

import lombok.Data;

@Data
public class Result {
	
	private final static String LOGIN_SUCCESS = "로그인 성공";
	private final static String LOGIN_FAIL = "로그인 실패";
	private final static String SUCCESS = "성공";
	private final static String FAIL = "실패";

	private String message;
	private Object data;
	
	public static Result instance() {
		return new Result();
	}
	
	public Result success() {
		this.message = SUCCESS;
		return this;
	}
	
	public Result success(String message) {
		this.message = message;
		return this;
	}
	
	public Result success(Object data, String message) {
		this.data = data;
		this.message = message;
		return this;
	}
	
	public Result fail() {
		this.message = FAIL;
		return this;
	}
	
	public Result fail(String message) {
		this.message = message;
		return this;
	}
	
	public Result fail(Object data, String message) {
		this.data = data;
		this.message = message;
		return this;
	}
	
	public Result loginSuccess() {
		this.message = LOGIN_SUCCESS;
		return this;
	}
	
	public Result loginFail() {
		this.message = LOGIN_FAIL;
		return this;
	}
	
}
