package com.kimdeagle.ledger.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.kimdeagle.ledger.user.UserDto;
import com.kimdeagle.ledger.util.Result;

@Service
public class LoginService {
	
	@Autowired
	private LoginMapper loginMapper;

	public ResponseEntity<Result> login(UserDto user) {
		
		Result result = Result.instance();
		
		UserDto userInfo = loginMapper.login(user);
		
		if (ObjectUtils.isEmpty(userInfo)) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(result.loginFail());
		}

		loginMapper.insertLoginDate(userInfo);
		
		result.setData(userInfo);
		
		return ResponseEntity.ok(result.loginSuccess());
	}

	public ResponseEntity<Result> getLoginHistory(String no) {
		
		Result result = Result.instance();
		
		result.setData(loginMapper.getLoginHistory(no));
		
		return ResponseEntity.ok(result.success());
	}
	
}
