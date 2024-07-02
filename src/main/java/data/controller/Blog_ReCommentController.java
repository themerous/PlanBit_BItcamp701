package data.controller;



import data.dto.Blog_ReCommentDto;
import data.service.Blog_ReCommentService;
import data.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/board")
public class Blog_ReCommentController {
    @Autowired
    private Blog_ReCommentService reCommentService;
    @Autowired
    private UserService userService;

    @PostMapping("/rinsert")
    public Map<String,String> insertReComment(@RequestParam int comment_num,
                                           @RequestParam String content,
                                           HttpSession session)
    {
        //로그인한 아이디 얻기
        String user_id=(String)session.getAttribute("loginid");
        //아이디에 해당하는 이름 얻기
        String writer=userService.databyid(user_id).getName();
        //dto 에 필요한 데이터 넣기
        Blog_ReCommentDto dto=Blog_ReCommentDto.builder()
                .user_id(user_id)
                .content(content)
                .comment_num(comment_num).build();

        //db insert
        reCommentService.insertReComment(dto);
        Map<String, String> map = new HashMap<>();
        map.put("status","true");
        return map;
    }

    @ResponseBody
    @GetMapping("/rlist")
    public List<Blog_ReCommentDto> rlist(@RequestParam int num)
    {
        return reCommentService.getReCommentData(num);
    }

    @GetMapping("/rdelete")
    public void deleteAnswer(@RequestParam int aidx) {

        reCommentService.deleteReComment(aidx);
    }

    }