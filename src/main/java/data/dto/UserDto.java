package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Alias("UserDto")
public class UserDto {
	private int user_num;
	private String id;
	private String pw;
	private String name;
	private String photo;
	private String provider;
}
