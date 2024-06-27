package data.controller;

import data.dto.Blog_BoardDto;
import data.service.Blog_BoardService;
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

    private String bucketName="bitcamp-bucket-56";
    private String folderName="photocommon";

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

        return "board/updateform";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute Blog_BoardDto dto,
                         @RequestParam("upload") MultipartFile upload,
                         @RequestParam int currentPage,
                         HttpServletRequest request)
    {
//		//업로드 경로
//		String saveFolder=request.getSession().getServletContext().getRealPath("/save");
//		//업로드 안했을경우 null 값 보내서 수정시 컬럼 제외
//		String uploadphoto=null;
//		if(!upload.getOriginalFilename().equals("")) {
//			//확장자 분리
//			String ext=upload.getOriginalFilename().split("\\.")[1];
//			uploadphoto=UUID.randomUUID()+"."+ext;
//			//업로드
//			try {
//				upload.transferTo(new File(saveFolder+"/"+uploadphoto));
//			} catch (IllegalStateException | IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
        String uploadphoto=storageService.uploadFile(bucketName, folderName, upload);
        //dto 의 사진변경
        dto.setPhoto(uploadphoto);
        //수정
        boardService.updateBoard(dto);

        return "redirect:./detail?num="+dto.getBoard_num()+"&currentPage="+currentPage;
    }


}