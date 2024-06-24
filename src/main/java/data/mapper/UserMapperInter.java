package data.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import data.dto.UserDto;

@Mapper
public interface UserMapperInter {
	//회원가입 이벤트
	@Insert("""
				insert into user (id,pw,name,email,question,answer)
				value (#{id},#{pw},#{name},#{email},#{question},#{answer})
			""")
	public void insertUser(UserDto dto);
	//로그인 이벤트
	@Select("select count(*) from user where id=#{id} and pw=#{pw}")
	public int logincheck(String id, String pw);
	//아이디 중복체크 이벤트
	@Select("select count(*) from user where id=#{searchid}")
	public int idcheckcount(String searchid);

	@Select("select * from user where id=#{id}")
	public UserDto getDataById(String id);
}
