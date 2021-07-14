package com.kimdeagle.ledger.system.ledger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimdeagle.ledger.member.MemberDto;
import com.kimdeagle.ledger.util.Result;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/ledger")
@Slf4j
public class LedgerController {

	@Autowired
	private LedgerService ledgerService;
	
	@GetMapping("")
	public String ledger(Model model) {
		model.addAttribute("title", "가계부 관리");
//		model.addAttribute("ledgerList", ledgerService.getList(((MemberDto)session.getAttribute("user")).getNo()));
		return "ledger";
	}
	
	@GetMapping("/list")
	@ResponseBody
	public ResponseEntity<Result> getList(String userNo) {
		return ledgerService.getList(userNo);
	}
	
	@PostMapping("")
	@ResponseBody
	public ResponseEntity<Result> regist(LedgerDto ledger, HttpSession session) {
		
		ledger.setUserNo(((MemberDto)session.getAttribute("user")).getNo());
		
		return ledgerService.regist(ledger);
	}
	
	@GetMapping("/search")
	@ResponseBody
	public ResponseEntity<Result> search(LedgerSearchDto ledger) {
		return ledgerService.getSearchList(ledger);
	}
	
	@PutMapping("")
	@ResponseBody
	public ResponseEntity<Result> update(LedgerDto ledger) {
		return ledgerService.update(ledger);
	}
	
	@DeleteMapping("/{no}")
	@ResponseBody
	public ResponseEntity<Result> delete(@PathVariable String no) {
		return ledgerService.delete(no);
	}
	
}
