package com.kimdeagle.ledger.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.kimdeagle.ledger.login.LoginHistoryDto;
import com.kimdeagle.ledger.util.Result;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	public ResponseEntity<Result> login(MemberDto user) {
		
		Result result = Result.instance();
		
		MemberDto loginInfo = memberMapper.login(user);
		
		if (ObjectUtils.isEmpty(loginInfo)) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(result.loginFail());
		}

		
		memberMapper.setLoginDate(loginInfo);
		
		result.setData(loginInfo);
		
		return ResponseEntity.ok(result.loginSuccess());
	}
	
	

}
