package com.kimdeagle.ledger.system.ledger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.kimdeagle.ledger.util.Result;

@Service
public class LedgerService {
	
	@Autowired
	private LedgerMapper ledgerMapper;

	public List<LedgerDto> getList(int userNo) {
		return ledgerMapper.getList(userNo);
	}
	
	public ResponseEntity<Result> regist(LedgerDto ledger) {
		Result result = Result.instance();
		
		if (ledgerMapper.regist(ledger) != 1) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body(result.fail("등록 실패"));
		}
		
		return ResponseEntity.ok(result.success("등록 성공"));
	}

}
