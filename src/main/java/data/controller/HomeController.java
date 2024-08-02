package data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import data.dto.Blog_BoardDto;
import data.dto.BoardDto;
import data.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import data.dto.UserDto;
import naver.ncloud.NcpObjectStorageService;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {
	@Autowired
	private UserService userService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private Blog_BoardService blogService;

	@Autowired
	private NcpObjectStorageService ncpService;

	@Autowired
	private Blog_BookmarkService BKService;

	private String bucketName = "hyunsung-bucket";
	private String folderName = "blog_photo";
	// board mapping
	// 글 작성 writeform
	// GetMapping board/form
	// PostMapping board/insert

	// 글 상세보기 detail
	// GetMapping board/detail

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

	// 비밀번호 재설정 페이지
	@GetMapping("bit/passform")
	public String passform(@RequestParam String mail, Model model) {
		UserDto dto = userService.databyid(mail);
		model.addAttribute("dto", dto);

		return "loginform/passform";
	}

	// 비밀번호 재설정이벤트
	@GetMapping("bit/passon")
	public String passon(@RequestParam String repw, @RequestParam String id) {
		userService.updatepw(repw, id);

		return "loginform/login";
	}

	// 블로그글 디테일페이지
	// 블로그 글 디테일 페이지 BoardDetailController 생성 후 이동 (6/25) 박주용
	// @GetMapping("bit/detail")
	// public String blogDetail() {
	// return "board/detail";
	// }

	// 회원가입 insert 이벤트
	@PostMapping("bit/insert")
	public String insert(@ModelAttribute UserDto dto, HttpServletRequest request,
			@RequestParam("myfile") MultipartFile myfile) {
		String photo = ncpService.uploadFile(bucketName, folderName, myfile);
		dto.setPhoto(photo);
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
			HttpSession session) {
		UserDto dto = userService.databyid(id);
		Map<String, String> map = new HashMap<>();
		// 로그인 상태
		boolean loginstatus = userService.logincheck(id, pw);
		String photo = dto.getPhoto();
		if (loginstatus) {
			// 아이디와 비번이 맞는 경우
			map.put("status", "success");
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", id);
			session.setAttribute("role", "bit");
			session.setAttribute("img", photo);
			session.setAttribute("user_num", dto.getUser_num());
			session.setAttribute("name", dto.getName());
			System.out.println(session.getAttribute("img"));
		} else {
			// 아이디와 비번이 틀린 경우
			map.put("status", "fail");
		}
		return map;
	}

	// 로그아웃 이벤트
	@ResponseBody
	@GetMapping("bit/logout")
	public void logout(HttpSession session) {
		session.removeAttribute("loginok");
		session.removeAttribute("loginid");
		session.removeAttribute("role");
		session.removeAttribute("img");
	}

	// 아이디 중복확인
	@ResponseBody
	@GetMapping("bit/idcheck")
	public Map<String, Integer> idcheck(@RequestParam String searchid) {
		Map<String, Integer> map = new HashMap<>();
		int count = userService.idcheckcount(searchid);
		map.put("count", count);

		return map;
	}

	// 마이페이지
	@GetMapping("bit/mypage")
	public String mypage(@RequestParam String id, @RequestParam(defaultValue = "1") int currentPage, Model model,
			HttpSession session) {
		String user_id = (String) session.getAttribute("loginid");
		String provider = (String) session.getAttribute("role");
		UserDto dto = userService.databyid(user_id);
		int user_num = userService.getUserNum(user_id, provider);
		String name = dto.getName();
		String photo = dto.getPhoto();

		List<Blog_BoardDto> userPost = blogService.userDataID(user_num);

		List<Long> userMark = BKService.getBookmarkedBoardIds(user_num);

		model.addAttribute("user_num", user_num);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("user_id", user_id);
		model.addAttribute("name", name);
		model.addAttribute("photo", photo);
		model.addAttribute("userPost", userPost);
		model.addAttribute("userMark", userMark);

		return "layout/mypage";
	}

	@GetMapping("bit/map")
	public String map() {

		return "layout/map";
	}
}
