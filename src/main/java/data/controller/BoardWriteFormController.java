package data.controller;

import data.dto.Blog_BoardDto;
import data.dto.Blog_MapDto;
import data.service.Blog_BoardService;
import data.service.Blog_MapService;
import data.service.UserService;
import naver.ncloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardWriteFormController {

    @Autowired
    private Blog_BoardService boardService;

    @Autowired
    private UserService userService;

    @Autowired
    private Blog_MapService mapService;

    private String bucketName = "hyunsung-bucket";
    private String folderName = "blog_photo";

    @Autowired
    private NcpObjectStorageService storageService;

    @GetMapping("/form")
    public String form(
            @RequestParam(defaultValue = "1") int currentPage,
            HttpSession session,
            Model model
    ) {
        String board_title = "";

        String id = (String)session.getAttribute("loginid");

        Blog_BoardDto dto = Blog_BoardDto.builder().user_id(id).build();

        model.addAttribute("currentPage", currentPage);
        model.addAttribute("board_title", board_title);
        return "board/form";
    }

    @PostMapping("/insert")
    public String insert(
            @ModelAttribute Blog_BoardDto dto,
            @RequestParam(value = "upload",required = false) MultipartFile upload,
            @RequestParam int currentPage,
            @RequestParam("title") String title,
            @RequestParam(value = "placeNames", required = false) String placeNamesStr,
            @RequestParam(value = "placeAddress", required = false) String placeAddressStr,
            @RequestParam(value = "placeLatitudes", required = false) String placeLatitudesStr,
            @RequestParam(value = "placeLongitudes", required = false) String placeLongitudesStr,
            HttpSession session
    ) {
        // 파일 업로드 처리
        if (upload != null && !upload.isEmpty()) {
            String photo = storageService.uploadFile(bucketName, folderName, upload);
            dto.setPhoto(photo);
        }

        // Summernote 내용 저장
        dto.setBoard_content(dto.getBoard_content());

        // 제목 저장
        dto.setBoard_title(title);

        // 세션에서 로그인 아이디 얻기
        String loginId = (String) session.getAttribute("loginok");
        if (loginId != null) {

        }
        // 로그인 아이디 값 확인
        String id = (String) session.getAttribute("loginid");
        dto.setUser_id(id);


        // 로그인 provider 확인
        String provider = (String) session.getAttribute("role");


        int user_num = userService.getUserNum(id, provider);
        dto.setUser_num(user_num);

        // 게시물 DB에 저장
        boardService.insertBoard(dto);

        // 추가된 게시물의 시퀀스 번호 확인
        int board_num = dto.getBoard_num();

        // 장소 정보 저장 (쉼표로 구분된 문자열 그대로 저장)
        if (placeNamesStr != null && placeAddressStr != null && placeLatitudesStr != null && placeLongitudesStr != null) {
            Blog_MapDto mapDto = new Blog_MapDto();
            mapDto.setMap_num(board_num);
            mapDto.setPlaceNames(placeNamesStr);
            mapDto.setPlaceAddress(placeAddressStr);
            mapDto.setPlaceLatitudes(placeLatitudesStr);
            mapDto.setPlaceLongitudes(placeLongitudesStr);
            mapService.insertBoard(mapDto);
        }

        // 상세페이지로 리다이렉트
        return "redirect:/board/detail?board_num=" + board_num + "&currentPage=" + currentPage;
    }


}
