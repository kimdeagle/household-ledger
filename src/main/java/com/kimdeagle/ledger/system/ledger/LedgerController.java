package com.kimdeagle.ledger.system.ledger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimdeagle.ledger.member.MemberDto;
import com.kimdeagle.ledger.util.Result;

@Controller
@RequestMapping("/ledger")
public class LedgerController {

	@Autowired
	private LedgerService ledgerService;
	
	@GetMapping("")
	public String ledger(Model model, HttpSession session) {
		model.addAttribute("title", "가계부 관리");
		model.addAttribute("ledgerList", ledgerService.getList(((MemberDto)session.getAttribute("user")).getNo()));
		return "ledger";
	}
	
	@PostMapping("")
	@ResponseBody
	public ResponseEntity<Result> regist(LedgerDto ledger, HttpSession session) {
		
		ledger.setUserNo(((MemberDto)session.getAttribute("user")).getNo());
		
		return ledgerService.regist(ledger);
	}
	
}
