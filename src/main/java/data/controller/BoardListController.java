package data.controller;

import data.dto.Blog_BoardDto;
import data.dto.BoardDto;
import data.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BoardListController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/bit/blog")
    public String boardList(Model model,@RequestParam(defaultValue = "1") int currentPage) {

        List<Blog_BoardDto> boardList = boardService.gettestboardlist();
        model.addAttribute("currentPage",currentPage );
        model.addAttribute("boardList", boardList);

        return "layout/blog";
    }

    @GetMapping("bit/mypage")
    public String mypage() {

        return "layout/mypage";
    }
}
