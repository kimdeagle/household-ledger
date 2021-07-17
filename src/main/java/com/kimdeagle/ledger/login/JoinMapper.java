package com.kimdeagle.ledger.login;

import org.apache.ibatis.annotations.Mapper;

import com.kimdeagle.ledger.user.UserDto;

@Mapper
public interface JoinMapper {

	int duplicationCheck(String id);

	int join(UserDto user);

}
