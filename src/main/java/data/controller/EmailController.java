package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import data.service.EmailService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EmailController {
	
	private final EmailService emailService;
	
	@ResponseBody
	@PostMapping("bit/mail")
	public String email(String mail) {
		int number = emailService.sendEmail(mail);
		String num = "" + number;
		
		return num;
	}
}
