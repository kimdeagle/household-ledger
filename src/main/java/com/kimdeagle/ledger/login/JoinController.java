package com.kimdeagle.ledger.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimdeagle.ledger.user.UserDto;
import com.kimdeagle.ledger.util.Result;

@Controller
@RequestMapping("/join")
public class JoinController {
	
	@Autowired
	private JoinService joinService;

	@GetMapping("")
	public void join() {
		
	}
	
	@GetMapping("/duplication/{id}")
	@ResponseBody
	public ResponseEntity<Result> duplicationCheck(@PathVariable String id) {
		return joinService.duplicationCheck(id);
	}
	
	@PostMapping("")
	@ResponseBody
	public ResponseEntity<Result> join(UserDto user) {
		return joinService.join(user);
	}
	
}
