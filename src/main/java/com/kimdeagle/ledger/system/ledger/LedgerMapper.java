package com.kimdeagle.ledger.system.ledger;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LedgerMapper {

	List<LedgerDto> getList(LedgerDto ledger);
	
	int regist(LedgerDto ledger);

	int update(LedgerDto ledger);

	int delete(String no);

	int getTotalCnt(LedgerDto ledger);

	StatDto getTodayStat(StatDto stat);

	StatDto getMonthlyStat(StatDto stat);
	
	StatDto getAnnualStat(StatDto stat);

}
