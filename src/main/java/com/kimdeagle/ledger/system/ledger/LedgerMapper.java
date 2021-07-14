package com.kimdeagle.ledger.system.ledger;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LedgerMapper {

	List<LedgerDto> getList(String userNo);
	
	int regist(LedgerDto ledger);

	List<LedgerDto> getSearchList(LedgerSearchDto ledger);

	int update(LedgerDto ledger);

	int delete(String no);

}
