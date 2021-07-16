package com.kimdeagle.ledger.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimdeagle.ledger.member.MemberDto;
import com.kimdeagle.ledger.util.Result;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	@GetMapping("")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	@ResponseBody
	public ResponseEntity<Result> login(MemberDto user) {
		return loginService.login(user);
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/login/history/{no}")
	@ResponseBody
	public ResponseEntity<Result> loginHistory(@PathVariable String no) {
		return loginService.getLoginHistory(no);
	}
	
	@GetMapping("/join")
	public void join() {
		
	}
	
}
