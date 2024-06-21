package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tour")
public class TourController {
    @GetMapping("/tourMain")
    public String tourMain() {
        return "tour/tour";
    }
}
