package data.controller;

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

import data.dto.UserDto;
import data.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class HomeController {
	@Autowired
	private UserService userService;

	// main
	@GetMapping("/")
	public String home()
	{
		return "layout/main";
	}

	// 로그인
	@GetMapping("bit/login")
	public String login() 
	{
		return "loginform/login";
	}

	// 회원가입
	@GetMapping("bit/form")
	public String form() 
	{
		return "loginform/form";
	}
	
	// 블로그글 디테일페이지
	@GetMapping("bit/detail")
	public String blogDetail() {
		return "board/detail";
	}

	// 회원가입 insert 이벤트
	@PostMapping("bit/insert")
	public String insert(@ModelAttribute UserDto dto, HttpServletRequest request) 
	{
		userService.insertUser(dto);
		// 회원가입하고 로그인페이지로감
		return "loginform/login";
	}

	// 로그인 이벤트
	@ResponseBody
	@PostMapping("bit/loginon")
	public Map<String, String> loginon(
			@RequestParam String id,
			@RequestParam String pw, 
			HttpSession session
			) 
	{
		Map<String, String> map = new HashMap<>();
		//로그인 상태
		boolean loginstatus = userService.logincheck(id, pw);
		if(loginstatus)
		{
			//아이디와 비번이 맞는 경우
			map.put("status","success");
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", id);
		}
		else
		{
			//아이디와 비번이 틀린 경우
			map.put("status", "fail");
		}
		return map;
	}

	// 로그아웃 이벤트
	@ResponseBody
	@GetMapping("bit/logout")
	public void logout(HttpSession session)
	{
		session.removeAttribute("loginok");
	}
	
	//아이디 중복확인
	@ResponseBody
	@GetMapping("bit/idcheck")
	public Map<String, Integer> idcheck(@RequestParam String searchid)
	{
		Map<String, Integer> map = new HashMap<>();
		int count = userService.idcheckcount(searchid);
		map.put("count", count);
		
		return map;
	}
	
	
}
