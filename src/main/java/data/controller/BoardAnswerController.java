package data.controller;


import data.dto.Blog_AnswerDto;
import data.service.Blog_AnswerService;
import data.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/board")
public class BoardAnswerController {
    @Autowired
    private Blog_AnswerService answerService;
    @Autowired
    private UserService userService;

    @PostMapping("/ainsert")
    public Map<String,String> insertAnswer(@RequestParam int num,
                                           @RequestParam String content,
                                           HttpSession session)
    {
        //로그인한 아이디 얻기
        String user_id=(String)session.getAttribute("loginid");
        //아이디에 해당하는 이름 얻기
        String writer=userService.databyid(user_id).getName();
        //dto 에 필요한 데이터 넣기
        Blog_AnswerDto dto=Blog_AnswerDto.builder()
                .user_id(user_id)
                .content(content)
                .num(num).build();

        //db insert
        answerService.insertAnswer(dto);
        Map<String, String> map = new HashMap<>();
        map.put("status","true");
        return map;
    }

    @GetMapping("/alist")
    public List<Blog_AnswerDto> alist(@RequestParam int num)
    {
        return answerService.getAnswerData(num);
    }

    @GetMapping("/adelete")
    public void deleteAnswer(@RequestParam int aidx) {

        answerService.deleteAnswer(aidx);
    }

    }