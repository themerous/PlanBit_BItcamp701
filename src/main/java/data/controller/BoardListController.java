package data.controller;

import data.dto.Blog_BoardDto;
import data.dto.BoardDto;
import data.service.Blog_BookmarkService;
import data.service.BoardService;
import data.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/bit")
public class BoardListController {

    @Autowired
    private BoardService boardService;

    @Autowired
    Blog_BookmarkService BKService;

    @Autowired
    UserService userService;

    @GetMapping("/blog")
    public String boardList(Model model, @RequestParam(defaultValue = "1") int currentPage, HttpSession session) {

        List<Blog_BoardDto> boardList = boardService.gettestboardlist();
        Blog_BoardDto topViewedBoard = boardService.getTopViewedBoard();
        model.addAttribute("topViewedBoard", topViewedBoard);
        model.addAttribute("currentPage",currentPage);
        model.addAttribute("boardList", boardList);


        //로그인 id 값 얻기
        String id = (String) session.getAttribute("loginid");
        System.out.println(id);
        //로그인 provider 값 얻ㄱ기
        String provider = (String) session.getAttribute("role");
        System.out.println(provider);
        int user_num = userService.getUserNum(id, provider);
        System.out.println("usernum="+user_num);



        List<Long> bookmarkedBoardIds = BKService.getBookmarkedBoardIds(user_num);
        System.out.println(bookmarkedBoardIds);

        model.addAttribute("bookmarkedBoardIds", bookmarkedBoardIds);



        return "layout/blog";
    }
    @GetMapping("/search")
    public String search(
            @RequestParam("category") String category,
            @RequestParam("query") String query,
            @RequestParam(defaultValue = "1") int currentPage,
            Model model
    ){
        List<Blog_BoardDto> searchResults = boardService.searchBoard(category, query);
        model.addAttribute("boardList", searchResults);
        model.addAttribute("currentPage",currentPage);


        return "layout/sblog";
    }

    @PostMapping("/bookmark")
    public ResponseEntity<Void> toggleFavorite(@RequestParam(required = true) int board_num, HttpSession session) {
        try {
            // 로그인 id 값 얻기
            String id = (String) session.getAttribute("loginid");
            // 로그인 provider 값 얻기
            String provider = (String) session.getAttribute("role");

            if (id == null || provider == null) {
                System.out.println("로그인 정보가 없습니다.");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build(); // 인증되지 않은 경우
            }

            System.out.println("Received board_num: " + board_num);
            int user_num = userService.getUserNum(id, provider);
            System.out.println("user_num: " + user_num);
            if (user_num == -1) {
                System.out.println("유효하지 않은 사용자입니다.");
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build(); // 유효하지 않은 사용자
            }

            BKService.toggleFavorite(user_num, board_num);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace(); // 서버 로그에 에러 출력
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 내부 서버 오류
        }
    }

    @PostMapping("delmark")
    public ResponseEntity<Void> delmark(@RequestParam(required = true) int board_num, HttpSession session){
        try {
            // 로그인 id 값 얻기
            String id = (String) session.getAttribute("loginid");
            // 로그인 provider 값 얻기
            String provider = (String) session.getAttribute("role");

            if (id == null || provider == null) {
                System.out.println("로그인 정보가 없습니다.");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build(); // 인증되지 않은 경우
            }

            System.out.println("Received board_num: " + board_num);
            int user_num = userService.getUserNum(id, provider);
            System.out.println("user_num: " + user_num);
            if (user_num == -1) {
                System.out.println("유효하지 않은 사용자입니다.");
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build(); // 유효하지 않은 사용자
            }
            System.out.println("fdsafdsafsfasfsdfasfas"+user_num);
            BKService.deleteFavorite(user_num, board_num);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace(); // 서버 로그에 에러 출력
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 내부 서버 오류
        }
    }

}
