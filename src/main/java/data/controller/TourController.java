package data.controller;

import data.dto.Tour_MarkDto;
import data.service.Tour_MarkService;
import data.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/tour")
public class TourController {
    @GetMapping("/tourMain")
    public String tourMain() {
        return "tour/tour";
    }

    //REST
    @Autowired
    Tour_MarkService tour_MarkService = new Tour_MarkService();
    @Autowired
    UserService userService = new UserService();

    @ResponseBody
    @PostMapping("/markList")
    //마이페이지 = 세션 로그인 되 있을때 표시니 loginok검사 불필요
    public List<Tour_MarkDto> markList(HttpSession session) {
        String login = (String) session.getAttribute("loginid");
        String provider = (String) session.getAttribute("role");

        if (login == null || provider == null) {
            throw new RuntimeException("로그인 정보가 없습니다.");
        }

        return tour_MarkService.findByMark(login, userService.getUserNum(login, provider));
    }

    @ResponseBody
    @PostMapping("/insert")
    public void insert(HttpSession session,
                       @RequestBody HashMap<String, String> map) {

        String loginId = (String)session.getAttribute("loginid");
        String loginProvider = (String)session.getAttribute("role");
        tour_MarkService.insert(loginId, userService.getUserNum(loginId, loginProvider), map.get("title"), map.get("addr"), map.get("photo"), map.get("serial_num"), map.get("link"), map.get("phone_num"));
    }

    @ResponseBody
    @PostMapping("/delete")
    public void delete(HttpSession session,
                       @RequestBody HashMap<String, String> map) {

        String loginId = (String)session.getAttribute("loginid");
        String loginProvider = (String)session.getAttribute("role");
        tour_MarkService.deleteBySerialNum(loginId, userService.getUserNum(loginId, loginProvider), map.get("serial_num"));
    }

    @ResponseBody
    @PostMapping("/check")
    public Map<String, Object> checkBySerialNum(HttpSession session,
                                                @RequestBody HashMap<String, String> map) {
        String loginId = (String) session.getAttribute("loginid");
        String loginProvider = (String)session.getAttribute("role");


        int check = tour_MarkService.checkBySerialNum(loginId, userService.getUserNum(loginId, loginProvider), map.get("serial_num"));


        Map<String, Object> response = new HashMap<>();
        response.put("serialNum", map.get("serial_num"));
        response.put("check", check);

        return response;
    }
}
