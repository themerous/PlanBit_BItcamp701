package data.controller;

import data.dto.Blog_LikeDto;
import data.service.Blog_BoardService;
import data.service.Blog_LikeService;
import data.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/board")
public class Blog_LikeController {
    @Autowired
    private Blog_BoardService blogBoardService;

    @Autowired
    private Blog_LikeService blogLikeService;

    @Autowired
    private UserService userService;

    // Endpoint to handle like button click
    @PostMapping("/like")
    public ResponseEntity<Map<String, Integer>> likePost(@RequestParam("board_num") int board_num, HttpSession session) {
        String user_id = (String) session.getAttribute("loginid");
        String provider = (String) session.getAttribute("role");
        int user_num = userService.getUserNum(user_id,provider);

        Blog_LikeDto likeDto = new Blog_LikeDto(user_num, board_num, 1, 0, 0);

        blogLikeService.addOrUpdateLike(likeDto);

        int likeCount = blogLikeService.getLikeCount(board_num);


        Map<String, Integer> response = new HashMap<>();
        try {

            response.put("board_like", likeCount);
            response.put("success", 1);
        }catch (Exception e){
            response.put("success", 0);
        }
        return ResponseEntity.ok(response);
    }
}