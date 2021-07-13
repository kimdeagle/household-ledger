package com.kimdeagle.ledger.system.ledger;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.kimdeagle.ledger.util.Result;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LedgerService {
	
	@Autowired
	private LedgerMapper ledgerMapper;

	public ResponseEntity<Result> getList(String userNo) {
		
		Result result = Result.instance();
		
		result.setData(ledgerMapper.getList(userNo));
		
		return ResponseEntity.ok(result.success());
		
	} //getList
	
	public ResponseEntity<Result> regist(LedgerDto ledger) {
		
		Result result = Result.instance();
		
		//set category
		if (StringUtils.equals(ledger.getInOut(), "in")) ledger.setCategory(ledger.getInCategory());
		if (StringUtils.equals(ledger.getInOut(), "out")) ledger.setCategory(ledger.getOutCategory());
		
		if (ledgerMapper.regist(ledger) != 1) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body(result.fail("등록 실패"));
		}
		
		return ResponseEntity.ok(result.success("등록 성공"));
		
	} //regist

	public ResponseEntity<Result> getSearchList(LedgerSearchDto ledger) {
		
		Result result = Result.instance();
		
		//set category
		if (StringUtils.equals(ledger.getInOut(), "")) ledger.setCategory(ledger.getAllCategory());
		if (StringUtils.equals(ledger.getInOut(), "in")) ledger.setCategory(ledger.getInCategory());
		if (StringUtils.equals(ledger.getInOut(), "out")) ledger.setCategory(ledger.getOutCategory());
		
		result.setData(ledgerMapper.getSearchList(ledger));
		
		return ResponseEntity.ok(result.success());
	}

}
