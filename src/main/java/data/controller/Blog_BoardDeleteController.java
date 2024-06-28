package data.controller;

import data.service.Blog_BoardService;
import data.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board")
public class Blog_BoardDeleteController {

    @Autowired
    private Blog_BoardService boardService;


    @GetMapping("/delete")
    public String delete(
            @RequestParam int board_num,
            @RequestParam int currentPage
    ){
        boardService.deleteBoard(board_num);


        return "redirect:/bit/blog";
    }

}