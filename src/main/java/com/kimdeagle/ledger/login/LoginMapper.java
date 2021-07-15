package com.kimdeagle.ledger.login;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kimdeagle.ledger.member.MemberDto;

@Mapper
public interface LoginMapper {

	MemberDto login(MemberDto user);

	void insertLoginDate(MemberDto loginInfo);

	List<LoginHistoryDto> getLoginHistory(String no);
	
}
