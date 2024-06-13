package team.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import team.dto.UserDto;

@Mapper
public interface UserMapperInter {
	//회원가입 이벤트
	@Insert("insert into testuser (id,pw,name,email) value (#{id},#{pw},#{name},#{email})")
	public void insertUser(UserDto dto);
	//로그인 이벤트
	@Select("select count(*) from testuser where id=#{id} and pw=#{pw}")
	public int logincheck(String id, String pw);
}
