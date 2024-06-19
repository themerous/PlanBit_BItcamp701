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
	private String id;
	private String pw;
	private String email;
	private int question;
	private String name;
	private int addr;
	private String answer;
	private int user_num;
}
