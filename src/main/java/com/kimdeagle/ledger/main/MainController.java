package com.kimdeagle.ledger.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kimdeagle.ledger.member.MemberDto;

@Controller
public class MainController {
	
	@GetMapping("/main")
	public void main(Model model) {
		model.addAttribute("title", "메인");
	}
	
	@PostMapping("/main")
	public void main(MemberDto user, HttpSession session, Model model) {
		model.addAttribute("title", "메인");
		session.setAttribute("user", user);
	}
	
}
