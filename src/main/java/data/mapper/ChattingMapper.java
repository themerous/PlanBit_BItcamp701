package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import data.dto.MessageDto;
import data.dto.RoomDto;

@Mapper
public interface ChattingMapper {
	@Select("select * from chat_room where room_participant like concat('%', #{name}, '%')")
	public List<RoomDto> getAllChatRooms(String name);
	@Select("select * from chat_content where room_num = #{room_num}")
	public List<MessageDto> getAllMessage(int room_num);
	@Insert("insert into chat_content (room_num, content, writer) value (#{room_num}, #{content}, #{writer})")
	public void insertChat(MessageDto dto);
	@Insert("""
			insert into chat_room (room_title, room_lastupdate, room_creator, room_participant) 
			value (#{room_title}, #{room_lastupdate}, #{room_creator}, #{room_participant})
			""")
	public void insertChatroom(RoomDto dto);
}
