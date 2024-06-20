package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Alias("RoomDto")
@ToString
public class RoomDto {
	private int room_num;
	private String room_title;
	private Timestamp room_lastupdate;
	private String room_creator;
	private String room_participant;
}
