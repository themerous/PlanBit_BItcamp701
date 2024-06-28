//해당 controller
// BoardWriteFormController 생성 후 이동 (6/25) 박주용


//package data.controller;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import data.dto.BoardDto;
//import data.service.BoardService;
//
//@Controller
//public class BoardController {
//	@Autowired
//	private BoardService boardService;
//
//	//게시판
//	@GetMapping("bit/board")
//	public String board(HttpSession session, Model model) {
//	    //System.out.println("Entering board method"); // Debugging statement
//
//	    // 로그인한 아이디 얻기
//	    String id = (String) session.getAttribute("loginid");
//	    //System.out.println("Login ID: " + id); // Debugging statement
//
//	    // dto에 아이디 넣기
//	    BoardDto dto = BoardDto.builder().id(id).build();
//	    //boardService.insertboard(dto);
//
//	    //System.out.println("Generated Board Number: " + dto.getBoard_num()); // Debugging statement
//	    model.addAttribute("board_num", "1");//dto.getBoard_num());
//
//	    //System.out.println("Exiting board method"); // Debugging statement
//
//	    return "board/form";
//	}
//	//게시판 만들기
//	@PostMapping("bit/boardinsert")
//	public String boardinsert(@ModelAttribute BoardDto dto)
//	{
//		//boardService.updateboard(dto);
//
//		return "redirect:/";
//	}
//
//	@PostMapping("bit/mapinsert")
//	public String mapinsert(@ModelAttribute BoardDto dto)
//	{
//		//boardService.updatemap(dto);
//		return "redirect:/";
//	}
//}


