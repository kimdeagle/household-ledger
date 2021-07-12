package com.kimdeagle.ledger.system.ledger;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LedgerMapper {

	List<LedgerDto> getList(int userNo);
	
	int regist(LedgerDto ledger);

}
