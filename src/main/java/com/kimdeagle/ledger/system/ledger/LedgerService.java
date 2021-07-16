package com.kimdeagle.ledger.system.ledger;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public ResponseEntity<Result> getList(LedgerDto ledger) {
		
		Result result = Result.instance();
		
		Map<String, Object> resultMap = new HashMap<>();
		
		//set category
		if (StringUtils.equals(ledger.getInOut(), "")) ledger.setCategory(ledger.getAllCategory());
		if (StringUtils.equals(ledger.getInOut(), "in")) ledger.setCategory(ledger.getInCategory());
		if (StringUtils.equals(ledger.getInOut(), "out")) ledger.setCategory(ledger.getOutCategory());
		
		if (ledger.getSearch().isEmpty()) {
			
		}
		
		ledger.getPagination().setTotalLedgerCnt(ledgerMapper.getTotalCnt(ledger));
		
		ledger.getPagination().setPagination();

		List<LedgerDto> list = ledgerMapper.getList(ledger);
		
		
		resultMap.put("list", list);
		resultMap.put("count", ledger.getPagination().getTotalLedgerCnt());
		resultMap.put("p", ledger.getPagination());
		
		result.setData(resultMap);
		
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



	public ResponseEntity<Result> update(LedgerDto ledger) {
		
		Result result = Result.instance();
		
		//set category
		if (StringUtils.equals(ledger.getInOut(), "in")) ledger.setCategory(ledger.getInCategory());
		if (StringUtils.equals(ledger.getInOut(), "out")) ledger.setCategory(ledger.getOutCategory());
		
		if (ledgerMapper.update(ledger) != 1) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body(result.fail("수정 실패"));
		}
		
		return ResponseEntity.ok(result.success("수정 성공"));
	}

	public ResponseEntity<Result> delete(String no) {
		Result result = Result.instance();
		
		if (ledgerMapper.delete(no) != 1) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body(result.fail("삭제 실패"));
		}
		
		return ResponseEntity.ok(result.success("삭제 성공"));
	}

}
