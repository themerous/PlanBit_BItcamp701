package data.controller;

import data.dto.Blog_BoardDto;
import data.dto.Blog_MapDto;
import data.service.Blog_BoardService;
import data.service.Blog_MapService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import naver.ncloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class Blog_BoardEditController {

    @NonNull
    private Blog_BoardService boardService;
    @Autowired
    private Blog_MapService mapService;


    private String bucketName = "hyunsung-bucket";
    private String folderName = "blog_photo";


    @Autowired
    private NcpObjectStorageService storageService;

    @GetMapping("/updateform")
    public String updateForm(
            @RequestParam int board_num,
            @RequestParam int currentPage,
            Model model
    )
    {
        model.addAttribute("currentPage", currentPage);
        //dto 얻기
        Blog_BoardDto dto=boardService.getData(board_num);
        model.addAttribute("dto", dto);


        //        지도 값 불러오는 부분
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

        return "board/edit";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute Blog_BoardDto dto,
                         @RequestPart("upload")  MultipartFile upload,
                         @RequestParam int currentPage,
                         @RequestParam(value = "placeNames", required = false) String placeNamesStr,
                         @RequestParam(value = "placeAddress", required = false) String placeAddressStr,
                         @RequestParam(value = "placeLatitudes", required = false) String placeLatitudesStr,
                         @RequestParam(value = "placeLongitudes", required = false) String placeLongitudesStr,
                         Model model,
                         HttpServletRequest request)
    {
        // 파일 업로드 처리
        if (upload != null && !upload.isEmpty()) {
            String photo = storageService.uploadFile(bucketName, folderName, upload);
            dto.setPhoto(photo);
        }
        //dto 의 사진변경



        //수정
        boardService.updateBoard(dto);

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
            mapService.updateMapData(mapDto);


        }





        return "redirect:/board/detail?board_num=" + board_num + "&currentPage=" + currentPage;
    }


}