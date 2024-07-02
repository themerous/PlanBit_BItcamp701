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
	public List<RoomDto> getAllChatRooms(int num) {
		return mapper.getAllChatRooms(Integer.toString(num));
	}
	public List<MessageDto> getAllMessage(int room_num) {
		return mapper.getAllMessage(room_num);
	}
	public void insertChat(MessageDto dto) {
		mapper.insertChat(dto);
	}
}
