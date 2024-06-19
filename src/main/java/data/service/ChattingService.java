package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.MessageDto;
import data.dto.RoomDto;
import data.mapper.ChattingMapper;
import data.mapper.UserMapperInter;

@Service
public class ChattingService {
	@Autowired
	ChattingMapper mapper;

	// Mapper service
	public List<RoomDto> getAllChatRooms(String name) {
		return mapper.getAllChatRooms(name);
	}
	
	public List<MessageDto> getAllMessage(int room_num) {
		return mapper.getAllMessage(room_num);
	}
}
