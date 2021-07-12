package com.kimdeagle.ledger;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kimdeagle.ledger.member.MemberDto;

@Controller
@RequestMapping("/ledger")
public class LedgerController {

	@PostMapping("")
	public String regist(LedgerDto ledger, HttpSession session) {
		
		ledger.setUserNo(((MemberDto)session.getAttribute("user")).getNo());
		
		//DB insert
		
		return "redirect:/ledger";
	}
	
}
