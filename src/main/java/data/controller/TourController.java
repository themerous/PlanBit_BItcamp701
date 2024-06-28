package data.controller;

import data.dto.Tour_MarkDto;
import data.service.Tour_MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @PostMapping("/markList")
    //마이페이지 = 세션 로그인 되 있을때 표시니 loginok검사 불필요
    public void markList(HttpSession session,
                         Model model) {
        model.addAttribute("tourList", tour_MarkService.findByMark((String)session.getAttribute("loginid")));
    }

    @ResponseBody
    @PostMapping("/insert")
    public void insert(HttpSession session,
                       @RequestBody HashMap<String, String> map) {
        System.out.println(map.get("serial_num") + "성공??");
        tour_MarkService.insert((String)session.getAttribute("loginid"), map.get("title"), map.get("photo"), map.get("serial_num"), map.get("link"), map.get("phone_num"));
    }

    @ResponseBody
    @PostMapping("/delete")
    public void delete(HttpSession session,
                       @RequestBody HashMap<String, String> map) {
        System.out.println(map.get("serial_num") + "controller들어옴");
        tour_MarkService.deleteBySerialNum((String)session.getAttribute("loginid"), map.get("serial_num"));
    }

    @ResponseBody
    @PostMapping("/check")
    public Map<String, Object> checkBySerialNum(HttpSession session,
                                                @RequestBody HashMap<String, String> map) {
        String loginId = (String) session.getAttribute("loginid");
        String serialNum = map.get("serial_num");
        int check = tour_MarkService.checkBySerialNum(loginId, serialNum);

        Map<String, Object> response = new HashMap<>();
        response.put("serialNum", serialNum);
        response.put("check", check);

        return response;
    }
}
