package com.semi.planbit;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.dto.UserDto;
import team.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class HomeController {
	@Autowired
	private UserService userService;

	// main
	@GetMapping("/")
	public String home() {
		return "layout/main";
	}

	// 로그인
	@GetMapping("bit/login")
	public String login() {
		return "loginform/login";
	}

	// 회원가입
	@GetMapping("bit/form")
	public String form() {
		return "loginform/form";
	}

	// 회원가입 insert 이벤트
	@PostMapping("bit/insert")
	public String insert(@ModelAttribute UserDto dto, HttpServletRequest request) {
		userService.insertUser(dto);
		// 회원가입하고 로그인페이지로감
		return "loginform/login";
	}

	// 로그인 이벤트
	@GetMapping("bit/loginon")
	public String loginon(@RequestParam String id, @RequestParam String pw, HttpSession session, Model model) {
		// 로그인 상태
		boolean loginStatus = userService.logincheck(id, pw);
		String move;

		if (loginStatus) {
			// 아이디와 비번이 맞는 경우
			move = "redirect:/";
			model.addAttribute("status", "success");
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginok", id);
		} else {
			// 아이디와 비번이 틀린 경우
			move = "loginform/login";
			model.addAttribute("status", "fail");
		}

		return move;
	}

	// 로그아웃 이벤트
	@ResponseBody
	@GetMapping("bit/logout")
	public void logout(HttpSession session)
	{
		session.removeAttribute("loginok");
	}

}
