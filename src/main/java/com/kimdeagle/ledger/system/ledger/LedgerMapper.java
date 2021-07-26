package com.kimdeagle.ledger.system.ledger;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kimdeagle.ledger.util.Pagination;

@Mapper
public interface LedgerMapper {

	List<LedgerDto> getList(LedgerDto ledger);
	
	int regist(LedgerDto ledger);

	int update(LedgerDto ledger);

	int delete(String no);

	int getTotalCnt(LedgerDto ledger);

	StatDto getTodayStat(StatDto stat);

}
