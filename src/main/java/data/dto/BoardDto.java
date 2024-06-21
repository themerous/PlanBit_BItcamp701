package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Alias("BoardDto")
public class BoardDto {
	private int board_num;
	private String id;
	private String title;
	private String img;
	private String content;
	private String addr;
	private Timestamp writeday;
	private String lat;
	private String lng;
	private String mapname;
}
