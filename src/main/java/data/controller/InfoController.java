package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InfoController {

    @GetMapping("bit/info")
    public String info(){
        return "layout/info";
    }
    @GetMapping("info/hinfo")
    public String infohotel(){
        return "info/hotelinfo";
    }
    @GetMapping("info/tinfo")
    public String infotransport(){
        return "info/transportinfo";
    }
    @GetMapping("info/supportinfo")
    public String infosupport(){
        return "info/supportinfo";
    }
}
