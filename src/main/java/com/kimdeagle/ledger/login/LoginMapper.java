package com.kimdeagle.ledger.login;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kimdeagle.ledger.user.UserDto;

@Mapper
public interface LoginMapper {

	UserDto login(UserDto user);

	void insertLoginDate(UserDto loginInfo);

	List<LoginHistoryDto> getLoginHistory(String no);

	UserDto find(UserDto user);
	
}
