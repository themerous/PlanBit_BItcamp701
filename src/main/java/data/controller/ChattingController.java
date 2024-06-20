package data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import data.dto.MessageDto;
import data.dto.RoomDto;
import data.service.ChattingService;

@Controller
public class ChattingController {
	@Autowired
	ChattingService service;
	
	@GetMapping("/bit/chat")
	public String chatting() {
		return "chatting/chat";
	}
	@PostMapping("/bit/chatting")
	public String chatroom(
			@RequestParam String room_num,
			Model model) {
		model.addAttribute("room_num", room_num);
		return "chatting/chatroom";
	}
	
	@ResponseBody
	@GetMapping("/bit/loadPrevChat")
	public List<MessageDto> getAllMessage(
			@RequestParam int room_num) {
		return service.getAllMessage(room_num);
	}
	
	@ResponseBody
	@PostMapping("/bit/getChatRooms")
	public List<RoomDto> getChatRooms(HttpSession session) {
		return service.getAllChatRooms((String)session.getAttribute("loginid"));
	}
	
	@ResponseBody
	@PostMapping("/bit/insertChat")
	public void insertChat(
			@ModelAttribute MessageDto dto) {
		service.insertChat(dto);
	}
	
	@ResponseBody
	@PostMapping("/bit/createChatroom")
	public void createChatroom(
			@ModelAttribute RoomDto dto) {
		service.insertChatroom(dto);
	}
}
