package data.controller;

import data.dto.Blog_BoardDto;
import data.dto.Blog_MapDto;
import data.dto.UserDto;
import data.service.Blog_BoardService;
import data.service.Blog_LikeService;
import data.service.Blog_MapService;
import data.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardDetailController {

    @Autowired
    private Blog_BoardService boardService;

    @Autowired
    private UserService userService;

    @Autowired
    private Blog_MapService mapService;

    @Autowired
    private Blog_LikeService blogService;

    private String bucketName = "hyunsung-bucket";
    private String folderName = "blog_photo";

    @ResponseBody
    @GetMapping("/detail/likes")
    public void detailLikeCount(
            @RequestParam int board_num) {
        // 1. 세션에 저장된 정보로 user_num값 가져오기

        // 2. user_num과 board_num값을 이용하여 likeCount 증가시키기
    }

    @GetMapping("/detail")
    public String detail(
            @RequestParam int board_num,
            @RequestParam int currentPage,
            Model model,
            HttpSession session
    ) {

        // 조회수 증가
        boardService.updateReadcount(board_num);

        // num 에 해당하는 글 가져오기
        Blog_BoardDto dto = boardService.getData(board_num);
        int like = blogService.getLikeCount(board_num);
        // 해당 아이디가 갖고 있는 프로필 사진 가져오기
        UserDto memberDto = userService.databyid(dto.getUser_id());
        String profile_photo = memberDto.getPhoto();
        String provider2 = memberDto.getProvider();

        String loginok = (String) session.getAttribute("loginok");
        String loginid = (String) session.getAttribute("loginid");
        String role = (String) session.getAttribute("role");
        if (loginok != null && (dto.getUser_num() == userService.getUserNum(loginid,role))) {
            int user_num = userService.getUserNum(loginid,role);
            model.addAttribute("user_num",user_num);
        }
      
        // 지도 데이터 가져오기
        int map_num = board_num;
        Blog_MapDto mdto = mapService.selectMap(map_num);

        if (mdto != null && mdto.getPlaceNames() != null && !mdto.getPlaceNames().isEmpty()) {
            // 쉼표로 구분된 문자열을 분리하여 리스트로 변환
            String placeNames = mdto.getPlaceNames();
            String placeAddress = mdto.getPlaceAddress();
            String placeLatitudes = mdto.getPlaceLatitudes();
            String placeLongitudes = mdto.getPlaceLongitudes();


            // 지도 데이터를 모델에 추가
            model.addAttribute("placeNames", placeNames);
            model.addAttribute("placeAddress", placeAddress);
            model.addAttribute("placeLatitudes", placeLatitudes);
            model.addAttribute("placeLongitudes", placeLongitudes);
        }

        model.addAttribute("like", like);
        model.addAttribute("dto", dto);
        model.addAttribute("provider2",provider2);
        model.addAttribute("profile_photo",profile_photo);
        model.addAttribute("currentPage", currentPage);
        return "board/detail";
    }
}