package data.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.amazonaws.services.ec2.model.UserData;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import data.dto.ChatDto;
import data.dto.MessageDto;
import data.dto.RoomDto;
import data.dto.UserDto;
import data.service.ChattingService;
import data.service.UserService;

@RestController
public class ChattingController {
	@Autowired
	ChattingService service;
	@Autowired
	UserService uservice;
	
	@GetMapping("/chat")
	public List<RoomDto> chatting(HttpSession session) {
		List<RoomDto> chatList = service.getAllChatRooms(uservice.getUserNum((String) session.getAttribute("loginid"), (String) session.getAttribute("role")));
		return chatList;
	}
	
	@GetMapping("/chat/data")
	public List<ChatDto> chattingData(
			@RequestParam int room_num) {
		List<ChatDto> Clist = new ArrayList<>();
		List<MessageDto> Mlist = service.getAllMessage(room_num);
		for(MessageDto Mdto: Mlist) {
			UserDto Udto = uservice.getUser(Mdto.getWriter());
			ChatDto Cdto = new ChatDto();
			String photoPath = Udto.getProvider() == "bit" ? "https://kr.object.ncloudstorage.com/hyunsung-bucket/blog_photo/" + Udto.getPhoto() : Udto.getPhoto();
 			Cdto.setContent(Mdto.getContent());
			Cdto.setName(Udto.getName());
			Cdto.setPhoto(photoPath);
			Cdto.setWriteday(Cdto.getWriteday());
			Clist.add(Cdto);
		}
		return Clist;
	}
	@PostMapping("/chat/data")
	public void inputChat(
			@RequestParam int room,
			@RequestParam int writer,
			@RequestParam String content) {
		MessageDto dto = new MessageDto();
		dto.setContent(content);
		dto.setRoom_num(room);
		dto.setWriter(writer);
		service.insertChat(dto);
	}
}
