package com.kimdeagle.ledger.login;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.kimdeagle.ledger.user.UserDto;
import com.kimdeagle.ledger.util.Result;

@Service
public class JoinService {
	
	@Autowired
	private JoinMapper joinMapper;

	public ResponseEntity<Result> duplicationCheck(String id) {
		
		Result result = Result.instance();
		
		Map<String, Boolean> isDuplication = new HashMap<>();
		
		if (joinMapper.duplicationCheck(id) == 1) {
			isDuplication.put("isDuplication", true);
			result.setData(isDuplication);
			return ResponseEntity.ok(result.success("중복된 아이디입니다."));
		}
		
		isDuplication.put("isDuplication", false);
		result.setData(isDuplication);
		return ResponseEntity.ok(result.success("사용할 수 있는 아이디입니다."));
	}

	public ResponseEntity<Result> join(UserDto user) {
		Result result = Result.instance();
		
		if (joinMapper.join(user) != 1) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body(result.fail("가입 실패"));
		}
		
		return ResponseEntity.ok(result.success("가입 성공"));
	}

}
