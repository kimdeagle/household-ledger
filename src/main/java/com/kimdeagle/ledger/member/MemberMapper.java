package com.kimdeagle.ledger.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	MemberDto login(MemberDto user);

}
