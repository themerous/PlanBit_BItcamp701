package data.mapper;

import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import data.dto.UserDto;

@Mapper
public interface MemberMapper {
	//로그인 여부 체크
	@Select("select * from user where id = #{id} and provider=#{provider}")
	public Optional<UserDto> findUser(@Param("id") String id, @Param("provider") String provider);
	@Insert("insert into user(id, pw, name, photo, provider) value (#{id}, #{pw}, #{name}, #{photo}, #{provider})")
	public void save(UserDto dto); 
}
