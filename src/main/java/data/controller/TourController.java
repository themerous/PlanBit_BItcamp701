package data.controller;

import data.dto.Tour_MarkDto;
import data.service.Tour_MarkService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/tour")
public class TourController {
    @GetMapping("/tourMain")
    public String tourMain() {
        return "tour/tour";
    }

    //REST
    Tour_MarkService tour_MarkService = new Tour_MarkService();

    @PostMapping("/markList")
    //마이페이지 = 세션 로그인 되 있을때 표시니 loginok검사 불필요
    public void markList(HttpSession session,
                                       Model model) {
        model.addAttribute("tourList", tour_MarkService.findByMark((String)session.getAttribute("loginid")));
    }

}
